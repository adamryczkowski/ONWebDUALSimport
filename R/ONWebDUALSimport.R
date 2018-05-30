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
    onwebduals.dbtemplate="DBTemplate.xlsm", #Reference database. Only structure, no cases.
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
importWebDatabase<-function(filename=NULL, flag_ALSFRS_as_integers=TRUE) {
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
  ref<-fill_template(in_dt = dtall, out_dt = ref, dict = dict)

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
importXLSDatabases<-function(filename=NULL, path_prefix=NULL, flag_ALSFRS_as_integers=TRUE) {
  if(is.null(path_prefix)) {
    path_prefix<-'Excel'
  }
  db_als<-joinExcels(prefix = path_prefix, flag_control = FALSE)
  db_ctrl<-joinExcels(prefix = path_prefix, flag_control = TRUE)

  als_ctrl_dic_filename<-system.file(getOption('onwebduals.als_ctrl_dic'),package='ONWebDUALSimport')
  als_ctrl_dic<-getALS_control_dic(als_ctrl_dic_filename)

  joined_db<-joinALS_Ctrl(db_als = db_als, db_ctrl = db_ctrl, als_ctrl_dic)

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


importAllDatabases<-function(path_prefix=NULL, flag_ALSFRS_as_integers=TRUE) {
  webdb<-importWebDatabase(flag_ALSFRS_as_integers = flag_ALSFRS_as_integers)
  xlsdb<-importXLSDatabases(flag_ALSFRS_as_integers = flag_ALSFRS_as_integers)
  dic_filename<-system.file(getOption('onwebduals.xls2xls_dic'),package='ONWebDUALSimport')
  dict<-get_dict(dic_filename)


  dbtemplate_filename<-system.file(getOption('onwebduals.dbtemplate'),package='ONWebDUALSimport')
  ref<-read_ref(row_length = nrow(xlsdb), reference_source = dbtemplate_filename, flag_ALSFRS_as_integers=flag_ALSFRS_as_integers)

  xlsdb_copy<-data.table::copy(xlsdb)
  ref_copy<-data.table::copy(ref)

  ans<-fill_template(in_dt = xlsdb_copy, out_dt = ref_copy, dict = dict, rownames_colname = 'q_0')
  ref<-ans$dt
  ONWebDUALSimport:::compare_dfs(webdb, ref, flag_structure_only = TRUE)
  reportClass<-ans$report

  #debugonce(dbcasereport::compile_report)
  doc<-ReportGatherer::doc_Document$new(author = 'Adam Ryczkowski',title = 'DB consistency report')

#  debugonce(dbcasereport::compile_report)
  report_composer<-gen_report_composer(in_dt = xlsdb, out_dt = ref)
  dbcasereport::compile_report(reportClass = reportClass, fn_hasher = dbcasereport::general_hash_fn, doc = doc, report_headers_list = report_chapters, report_composer = report_composer)
  a<-pander::Pandoc$new()
  doc$render(a)
  a$export('/tmp/report', open=FALSE, options='+RTS -K100000000 -RTS --filter pandoc-fignos --filter pandoc-tablenos -M "tablenos-caption-name:Tabela" -M "fignos-caption-name:Rycina"')

  joined_df<-rbind(webdb, ref, fill=TRUE)

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

generateNewVariables<-function(db) {
  db$age_als <-as.numeric(db$q_11 - db$q_5)/365.25
  db$age_als[db$age_als<0]<-NA
  setattr(db$age_als, 'label', "Age on 1st symptoms")
  setattr(db$age_als, 'units', "years")

  db$age <-as.numeric(db$q_4 - db$q_5)/365.25
  db$age[db$age<20]<-NA
  db$age[db$age>92]<-NA
  setattr(db$age, 'label', "Age on consulation")
  setattr(db$age, 'units', "years")

  db$als_duration <-as.numeric(db$q_4 - db$q_11)/365.25*12
  db$als_duration[db$als_duration<0]<-NA
  setattr(db$als_duration, 'label', "Disease duration")
  setattr(db$als_duration, 'units', "months")

  db$life_span <-as.numeric(db$q_15 - db$q_5)/365.25
  db$life_span[db$life_span<0]<-NA
  setattr(db$life_span, 'label', "Life span")
  setattr(db$life_span, 'units', "years")

  als_start<-which(colnames(db)=='q_51_1.1')
  als_end<-which(colnames(db)=='q_51_1.12')
  new_ALS1<-rowSums(db[seq(als_start, als_end)], na.rm=FALSE)
  db$q_51_1.score[seq_len(nrow(db))]<-new_ALS1
  db$q_51_1.rate[seq_len(nrow(db))]<-(48-db$q_51_1.score)/db$als_duration
}


na.replace <- function (x, to_what=0L) {
  x[is.na(x)] <- to_what
  return(x)
}
