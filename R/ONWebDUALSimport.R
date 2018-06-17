#' Imports patients' records from the web and excel source. Part of the ONWebDUALS project.
#'
#'
#' @docType package
#' @name ONWebDUALSimport
NULL

# nocov start
.onLoad	<-	function(libname,	pkgname)	{
  op	<-	options()
  op.onwebduals	<-	list(
    onwebduals.webaddress="http://10.150.24.67/OWSMain.asmx",
    onwebduals.webdocs="app_dictionaries.xlsx", #documentation of the web database. Information about mapping dictionaries to questions
    onwebduals.web2xls_dic="web_xls_dic.xlsx", #Mapping between column names in web database and the reference database. Information about simple recodings
    onwebduals.xls2xls_dic="xls_xls_dic.xlsx", #Mapping between column names in web database and the reference database. Information about simple recodings
    onwebduals.xlstemplate="XlsTemplate.xlsm", #Reference common format for all databases. Only structure, no cases.
    onwebduals.dbtemplate="CommonRawTemplate.xlsm", #Reference common format for all databases. Only structure, no cases.
    onwebduals.dbanalysis="AnalysisTemplate.xlsm", #Reference common format for all databases. Only structure, no cases.
    onwebduals.als_ctrl_dic="als_ctrl_dic.xlsx" #Dictionary that mapps question names in the control group to question names in the ALS group
  )
  toset	<-	!(names(op.onwebduals)	%in%	names(op))
  if(any(toset))	options(op.onwebduals[toset])
  invisible()
}
# nocov end


#' Imports the web-based database via its SOAP API.
#' @param flag_ALSFRS_as_integers If set (the default) the ALSFRS questionnaire
#'        gets output as integers, not labelled data.
#' @param filename If not-empty, function will save the database into the excel
#'        file with the given name
#' @return Returns data.table version of the database.
#' @export
importWebDatabase<-function(filename=NULL, flag_ALSFRS_as_integers=TRUE, reportClass) {
  # Read all the records in all the pages
  value_table_all<-load_all_patient_tables(getOption('onwebduals.webaddress'))

  # Remove all the test cases
  vtable_not_deleted<-value_table_all[value_table_all$is_deleted!='true',]
  vtable_not_test<-vtable_not_deleted[stringr::str_sub(vtable_not_deleted$uid,1, 3)!='TES',]
  value_table<-vtable_not_test[!is.na(vtable_not_test$patient_id),]

  # Read in the documentation for the web service to get the dictionaries for
  # variables' labels. The documentation is held in the separate (included) file.
  docs_filename<-system.file(getOption('onwebduals.webdocs'),package='ONWebDUALSimport')
  app_dict<-read_dictionaries_xlsx(docs_filename)

  # Using the web documentaion associate dictionaries with the questions,
  # and also read in nested questionnaires (modelled as one-to-many relationship
  # in the underlying relational database that powers the service).
  #
  # During the read, any missing labels are reported as (human-readable) warnings. We suppress
  # them, because we accept silent conversion of all these cases into NA
  dtall<-suppressWarnings(read_through_dicts2(value_table = value_table, app_dict = app_dict,
                                              webaddress=getOption('onwebduals.webaddress')))

  # Read the reference format for the database.
  # The format is present in the separate Excel file.
  # In this reference file there are all necessary meta-data, including
  # the code that does the validation
  dbtemplate_filename<-system.file(getOption('onwebduals.dbtemplate'),package='ONWebDUALSimport')
  ref<-read_ref(row_length = nrow(dtall), reference_source = dbtemplate_filename)

  # Read the dictionary that translates the layout of the web database
  # to the layout of the Excel file. It is stored in a separate file
  dic_filename<-system.file(getOption('onwebduals.web2xls_dic'),package='ONWebDUALSimport')
  dict<-get_dict(dic_filename)

  # Fill the reference database with the web entries after they are
  # transcoded according to the dict. ref gets updated by reference.
  ref<-fill_template(in_dt = dtall, out_dt = ref, dict = dict)$dt

  # If required, transcode ALSFRS into integers (instead of labelled data)
  if(flag_ALSFRS_as_integers) {
    dbout<-recode_ALSFRS(ref)
  } else {
    dbout<-data.table::copy(ref)
  }

  dbpp<-post_processing_for_webdb(dbout)
  if(!is.null(filename)) {
    savedb(db = dbpp, filename = filename)
  }
  return(dbpp)
  webdb<-dbpp
}

#' Recodes ALSFRS into integers
recode_ALSFRS<-function(db) {
  vars <-
    c("q_51_1.1", "q_51_1.2", "q_51_1.3", "q_51_1.4", "q_51_1.5",
      "q_51_1.6", "q_51_1.7", "q_51_1.8", "q_51_1.9", "q_51_1.10",
      "q_51_1.11", "q_51_1.12",
      "q_51_2.1", "q_51_2.2", "q_51_2.3",
      "q_51_2.4", "q_51_2.5", "q_51_2.6", "q_51_2.7", "q_51_2.8", "q_51_2.9",
      "q_51_2.10", "q_51_2.11", "q_51_2.12",
      "q_51.1", "q_51.2", "q_51.3", "q_51.4", "q_51.5", "q_51.6", "q_51.7",
      "q_51.8", "q_51.9", "q_51.10", "q_51.11", "q_51.12")
  vars<-intersect(vars, colnames(db))
  for(varname in vars) {
    var<-as.integer(db[[varname]])
    danesurowe::copy_obj_attributes(obj_source = db[[varname]], obj_dest = var)
    db[[varname]]<-var
  }
  return(db)
}

#' Simple function that saves the database in the Excel format
savedb<-function(db, filename) {
  db2<-data.table::copy(db)
  labels<-danesurowe::GetVarLabel(db)
  xlsx::write.xlsx(labels, filename, sheetName='labels')
  for(i in seq_along(colnames(db))) {
    if('labelled' %in% class(db[[i]])) {
#      cat(paste0(i, '\n'))
      #			browser()
      db2[[i]]<-haven::as_factor(db[[i]])
    }
  }
  xlsx::write.xlsx(db2, filename, append = TRUE, sheetName='data', col.names=TRUE, row.names=TRUE, showNA=FALSE)
}


#' Reads in all the Excel databases
#' @param path_prefix Path containing all the input files. For security reasons the files
#'        are not provided with the library.
#' @param filename If not-empty, function will save the database into the excel
#'        file with the given name
#' @return Returns data.table version of the database.
#' @export
importXLSDatabases<-function(filename=NULL, path_prefix=NULL, flag_ALSFRS_as_integers=TRUE, reportClass) {
  checkmate::assert_class(reportClass, 'ReportClass')
  if(is.null(path_prefix)) {
    path_prefix<-'Excel'
  }
  db_als<-joinExcels(prefix = path_prefix, flag_control = FALSE)
  db_ctrl<-joinExcels(prefix = path_prefix, flag_control = TRUE)

  als_ctrl_dic_filename<-system.file(getOption('onwebduals.als_ctrl_dic'),package='ONWebDUALSimport')
  als_ctrl_dic<-getALS_control_dic(als_ctrl_dic_filename)

  duplicated_ids<-intersect(db_als$q_0, db_ctrl$q_0)
  poses_als<-rep(0L, length(duplicated_ids))
  poses_ctrl<-rep(0L, length(duplicated_ids))
  for(i in seq_along(duplicated_ids)) {
    duplicated_id <- duplicated_ids[[i]]
    pos_als<-which(db_als$q_0 == duplicated_id)
    pos_ctrl<-which(db_ctrl$q_0 == duplicated_id)
    if(length(pos_als)>1) {
      browser()
    }
    if(length(pos_ctrl)>1) {
      browser()
    }
    data.table::set(db_als, pos_als, 'q_0', paste0(duplicated_id, '_A'))
    data.table::set(db_ctrl, pos_ctrl, 'q_0', paste0(duplicated_id, '_C'))
    poses_als[[i]]<-pos_als
    poses_ctrl[[i]]<-pos_ctrl
  }
  reportClass$set_case_names(c(db_als$q_0, db_ctrl$q_0))
  for(i in seq_along(duplicated_ids)) {

    duplicated_id <- duplicated_ids[[i]]

    reportClass$add_element(case = poses_als[[i]], var = 'q_0', type = 'id_duplicates', par1=poses_ctrl[[i]])
  }


  reference_db<-read_ref(reference_source = system.file(getOption('onwebduals.xlstemplate'),package='ONWebDUALSimport'), flag_ALSFRS_as_integers = flag_ALSFRS_as_integers)
  joined_db<-joinALS_Ctrl(db_als = db_als, db_ctrl = db_ctrl, als_control_dic =  als_ctrl_dic,reference_db=reference_db,  reportClass = reportClass)


  als_ctrl_dic_filename<-system.file(getOption('onwebduals.als_ctrl_dic'),package='ONWebDUALSimport')
  als_ctrl_dic<-getALS_control_dic(als_ctrl_dic_filename)

  # If required, transcode ALSFRS into integers (instead of labelled data)
  if(flag_ALSFRS_as_integers) {
    dbout<-recode_ALSFRS(joined_db)
  } else {
    dbout<-data.table::copy(joined_db)
  }


  if(!is.null(filename)) {
    savedb(db = dbout, filename = filename)
  }
  return(dbout)
}


#' Reads in all the Excel databases
#' @param path_prefix Path containing all the input files. For security reasons the files
#'        are not provided with the library.
#' @param filename If not-empty, function will save the database into the excel
#'        file with the given name
#' @return Returns data.table version of the database.
#' @export
importXLSDatabasesAndConvert<-function(filename=NULL, path_prefix=NULL, flag_ALSFRS_as_integers=TRUE, reportClass) {
  xlsdb<-importXLSDatabases(filename=filename, path_prefix=path_prefix, flag_ALSFRS_as_integers=flag_ALSFRS_as_integers, reportClass=reportClass)

  dict<-get_dict(system.file(getOption('onwebduals.xls2xls_dic'),package='ONWebDUALSimport'))

  #Sprawdź pytanie q_23.  Na stronie web niby mamy 229 praworęcznych. Powinno być trochę leworęcznych i tylko ALS. W kontrolnej w ogóle nie ma tego pytania.

  ref<-read_ref(row_length = nrow(xlsdb),
                reference_source = system.file(getOption('onwebduals.dbtemplate'),package='ONWebDUALSimport'),
                flag_ALSFRS_as_integers=flag_ALSFRS_as_integers)

  xlsdb_copy<-data.table::copy(xlsdb)
  ref_copy<-data.table::copy(ref)

  ans<-fill_template(in_dt = xlsdb_copy, out_dt = ref_copy, dict = dict, rownames_colname = 'q_0', reportClass = reportClass)
  xlsdb2<-ans$dt

  return(xlsdb2)
}

compose_conversion_report<-function(reportClass, report_composer,  filepath='translation_report') {
  doc<-ReportGatherer::doc_Document$new(author = 'Adam Ryczkowski',title = 'DB consistency report')
  dbcasereport::compile_report(reportClass = reportClass, fn_hasher = dbcasereport::general_hash_fn, doc = doc, report_headers_list = report_chapters, report_composer = report_composer)
  a<-pander::Pandoc$new()
  doc$render(a)
  a$export('/tmp/report', open=FALSE, options='+RTS -K100000000 -RTS --filter pandoc-fignos --filter pandoc-tablenos -M "tablenos-caption-name:Tabela" -M "fignos-caption-name:Rycina"')
}

#' Reads xls and web databases from their sources using importXLSDatabases and importWebDatabase, and merges both databases into one format.
#'
#' @export
importAllDatabases<-function(path_prefix=NULL, flag_ALSFRS_as_integers=TRUE) {
  reportClass<-dbcasereport::ReportClass$new()

  webdb<-importWebDatabase(flag_ALSFRS_as_integers = flag_ALSFRS_as_integers, reportClass=reportClass)
  xlsdb<-importXLSDatabasesAndConvert(flag_ALSFRS_as_integers = flag_ALSFRS_as_integers, reportClass=reportClass)

  joined_df<-join_dbs(webdb=webdb, xlsdb=xlsdb, reference_db = system.file(getOption('onwebduals.dbtemplate'),package='ONWebDUALSimport'), reportClass=reportClass)

  joined_df<-generateNewVariables(joined_df)

  if(flag_show_report) {
    compose_conversion_report(reportClass=reportClass, report_composer = gen_report_composer(in_dt = xlsdb, out_dt = xlsdb2), filepath='tmp/report')
  }

  return(joined_df)



  dict<-get_dict(system.file(getOption('onwebduals.xls2xls_dic'),package='ONWebDUALSimport'))

  #Sprawdź pytanie q_23.  Na stronie web niby mamy 229 praworęcznych. Powinno być trochę leworęcznych i tylko ALS. W kontrolnej w ogóle nie ma tego pytania.

  ref<-read_ref(row_length = nrow(xlsdb),
                reference_source = system.file(getOption('onwebduals.dbtemplate'),package='ONWebDUALSimport'),
                flag_ALSFRS_as_integers=flag_ALSFRS_as_integers)

  xlsdb_copy<-data.table::copy(xlsdb)
  ref_copy<-data.table::copy(ref)

  ans<-fill_template(in_dt = xlsdb_copy, out_dt = ref_copy, dict = dict, rownames_colname = 'q_0')
  xlsdb2<-ans$dt
#  compose_conversion_report(reportClass=ans$report, report_composer = gen_report_composer(in_dt = xlsdb, out_dt = ref), filepath='tmp/report')

#  ONWebDUALSimport:::compare_dfs(webdb, ref, flag_structure_only = TRUE)
  rm(ans)

  #debugonce(dbcasereport::compile_report)

  #debugonce(dbcasereport::compile_report)


  browser()
  to_delete<-c(colnames(ref)[which(stringr::str_detect(colnames(ref), pattern=stringr::regex('^\\.')))])
  for(cname in to_delete) {
    data.table::set(joined_df, NULL, cname, NULL)
  }
  q_common<-intersect(ref$q_0, webdb$q_0)
  db_web<-webdb[!webdb$q_0 %in% q_common,]
  db<-suppressWarnings(rbind(as_tibble(ref), as_tibble(db_web)))

  db_xls_common<-ref[ref$q_0 %in% q_common,]
  db_web_common<-webdb[webdb$q_0 %in% q_common,]
  ONWebDUALSimport:::compare_dfs(db_xls_common, db_web_common, flag_comment_new_rows = FALSE, flag_comment_deleted_rows = FALSE)
  for(i in seq_along(webdb)) {
    cat(paste0(i,'\n'))
    as.character(webdb[[i]])
  }
  names(webdb)[[78]]
  webdb[[78]]
  ref[[78]]
  webdb[[91]]
  sum(duplicated(xlsdb$q_0))
}


na.replace <- function (x, to_what=0L) {
  x[is.na(x)] <- to_what
  return(x)
}

gen_blank_df<-function(reference_db, row_length=0) {
  template<-reference_db[integer(0),]
  template<-danesurowe::copy_dt_attributes(dt_source = reference_db, dt_dest=template)
  if(row_length>0) {
    cols<-colnames(template)
    template<-rbind(template, lp=seq(length.out=row_length), fill=TRUE)
    to_delete<-setdiff(colnames(template), cols)
    data.table::set(template, NULL, to_delete, NULL)
  }
  template<-danesurowe::copy_dt_attributes(dt_source = reference_db, dt_dest=template)
  return(template)
}

#' Function that joins two databases together. It replaces rbind as a much more carefull and thoughtfull alternative.
#'
#' If all columns in both databases have exactly the same format, this function is equivalent to rbind.
#' All its magic begins, when there are slight diffrences in data types among the columns.
join_dbs<-function(webdb, xlsdb, reference_db=NULL, reportClass, type='join_db') {
  #joined_df<-rbind(webdb, xlsdb, fill=TRUE)
  if('character' %in% class(reference_db)) {
    checkmate::assert_string(reference_db, null.ok = FALSE)
    joined_df<-read_ref(row_length = nrow(xlsdb)+nrow(webdb), reference_source = reference_db, flag_ALSFRS_as_integers=flag_ALSFRS_as_integers)
  } else {
    joined_df<-gen_blank_df(reference_db, row_length = nrow(webdb)+nrow(xlsdb))
  }
  to_delete<-c(colnames(joined_df)[which(stringr::str_detect(colnames(joined_df), pattern=stringr::regex('^\\.')))])
  for(cname in to_delete) {
    data.table::set(joined_df, NULL, cname, NULL)
  }
  for(i in seq_along(colnames(joined_df))) {
    colname<-colnames(joined_df)[[i]]
    if(colname=='q_4') {
     # browser()
    }
    cat(paste0(colname, '\n'))
    var1<-webdb[[colname]]
    var2<-xlsdb[[colname]]
    var<-joined_df[[colname]]
    if(paste(sort(class(var1)), collapse = ' ')!=paste(sort(class(var)), collapse = ' ')) {
      if('integer' %in% class(var1) & 'factor' %in% class(var) ) {
        attributes(var1)<-attributes(var)
      } else if('numeric' %in% class(var1) & 'factor' %in% class(var) ) {
        var1<-as.integer(var1)
        attributes(var1)<-attributes(var)
      } else if('integer' %in% class(var1) & 'labelled' %in% class(var) ) {
        browser()
        var1<-as.numeric(var1)
        attributes(var1)<-attributes(var)
      } else if('numeric' %in% class(var1) & 'labelled' %in% class(var) ) {
        attributes(var1)<-attributes(var)
      } else if('labelled' %in% class(var1) & 'factor' %in% class(var) ) {
        var2<-var[1:2]
        var2[[1]]<-NA
        var2<-rep(var2[[1]], nrow(xlsdb))
      } else if ( 'factor' %in% class(var1) && 'labeleed' %in% class(var)) {
        var1<-labelled::to_factor(var1)
        if (danesurowe::GetLabelsString_1(var)!=danesurowe::GetLabelsString_1(var1)) {
          browser()
        }
        attributes(var1)<-attributes(var)
      } else if ( 'integer' %in% class(var1) && 'numeric' %in% class(var)) {
        var1<-as.numeric(var1)
      } else if ( 'numeric' %in% class(var1) && 'integer' %in% class(var)) {
        var1<-as.integer(var1)
      } else if ( 'integer' %in% class(var1) && 'character' %in% class(var)) {
        if(all(is.na(var1))) {
          var1<-var[1:2]
          var1[[1]]<-NA
          var1<-rep(var1[[1]], nrow(webdb))
        } else {
          browser()
        }
      } else if ( 'character' %in% class(var1) && 'factor' %in% class(var)) {
        if(all(is.na(var1))) {
          var1<-var[1:2]
          var1[[1]]<-NA
          var1<-rep(var1[[1]], nrow(webdb))
        } else {
          browser()
        }
      } else if("NULL" %in% class(var1)) {
        var1<-var[1:2]
        var1[[1]]<-NA
        var1<-rep(var1[[1]], nrow(webdb))
      } else if ( 'factor' %in% class(var1) && 'character' %in% class(var)) {
        var1<-as.character(var1)
      } else if ( 'Date' %in% class(var1) && 'POSIXct' %in% class(var)) {
        var1<-as.POSIXct(var1)
      } else if ( 'numeric' %in% class(var1) && 'character' %in% class(var)) {
        var1<-as.character(var1)
      } else if ( 'numeric' %in% class(var1) &&  'POSIXct' %in% class(var)) {
        #        browser()
        var1<-as.POSIXct(conv_to_Date_from_serial(var_in = var1, var_name = colname, reportClass = reportClass))
      } else {
        browser()
      }
    }
    if(paste(sort(class(var2)), collapse = ' ')!=paste(sort(class(var)), collapse = ' ')) {
      if("NULL" %in% class(var2)) {
        var2<-var[1:2]
        var2[[1]]<-NA
        var2<-rep(var2[[1]], nrow(xlsdb))
      } else if ( 'factor' %in% var2 && 'labeled' %in%class(var)) {
        var2<-labelled::to_labelled(var2)
        nalabs<-danesurowe::GetNALevels(var)
        if(length(nalabs)>0) {
          for(j in seq_along(nalabs)) {
            nalabel<-names(nalabs)[[j]]
            navalue<-nalabs[[j]]
            var2[var2==nalabel]<-haven::tagged_na(navalue)
          }
        }
        attributes(var2)<-attributes(var)
      } else if ( 'integer' %in% class(var2) && 'numeric' %in%class(var)) {
        #browser()
        var2<-conv_to_integer(var_in = var2, var_name = colname, reportClass = reportClass, type = 'to_integer', par = '')
      } else if ( 'numeric' %in% class(var2) && 'integer' %in%class(var)) {
        var2<-as.numeric(var2)
      } else if ( 'numeric' %in% class(var2) &&  'Date' %in%class(var)) {
        var2<-conv_to_Date_from_serial(var_in = var2, var_name = colname, reportClass = reportClass)
      } else if ( 'numeric' %in% class(var2) &&  'POSIXct' %in% class(var)) {
#        browser()
        var2<-as.POSIXct(conv_to_Date_from_serial(var_in = var2, var_name = colname, reportClass = reportClass))
      } else if ( 'Date' %in% class(var2) && 'POSIXct' %in% class(var)) {
        var2<-as.POSIXct(var2)
      } else if ( 'numeric' %in% class(var2) && 'character' %in% class(var)) {
        var2<-as.character(var2)
      } else if ( 'factor' %in% class(var2) && 'character' %in% class(var)) {
        var2<-as.character(var2)
      } else {

        browser()
      }
    }
    if(any(c('factor', 'labelled') %in% class(var1))) {
      var1_labels<-danesurowe::GetLabelsString_1(var1)
    } else {
      var1_labels=''
    }
    if(any(c('factor', 'labelled') %in% class(var2))) {
      var2_labels<-danesurowe::GetLabelsString_1(var2)
    } else {
      var2_labels=''
    }
    if(any(c('factor', 'labelled') %in% class(var))) {
      var_labels<-danesurowe::GetLabelsString_1(var)
    } else {
      var_labels=''
    }
    if(var1_labels!=var_labels) {
      browser()
      labels<-names(danesurowe::GetLevels(out_factor, flag_recalculate = FALSE))
      labels_list<-setNames(as.list(labels), labels)

      ans<-identify_patterns(patterns_dic=labels_list, invar=in_char, invar_uniques=input_uniques, invar_labels=labels,
                             outvar=out_factor,
                             reportClass=reportClass, type=type, colname=colname,
                             str_regex_prefix=str_regex_prefix, str_regex_suffix=str_regex_suffix)
      out_factor<-ans$var
      not_matched<-ans$not_matched

    }
    if(var2_labels!=var_labels && var2_labels!='') {
      label_existances<-setdiff(as.character(unique(var2)),NA) %in% danesurowe::GetLabels(var, flag_recalculate = FALSE)
      if(length(label_existances)>0 && !any(label_existances)) {
        #Some labels are incompatible!
        browser()
      }
    }
    a<-attributes(var)
    var<-c(var1, var2)
    attributes(var)<-a
    if('list' %in% class(var)) {
      browser()
    }
    data.table::set(joined_df, NULL, colname, var)
  }
  return(joined_df)
}
