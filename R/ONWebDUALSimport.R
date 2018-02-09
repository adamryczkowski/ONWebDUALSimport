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
  dict<-get_web_2_xls_dict(dic_filename)

  # Fill the reference database with the web entries after they are
  # transcoded according to the dict. ref gets updated by reference.
  ref<-fill_template(dtall=dtall, dict = dict, ref = ref)

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
}

#' Recodes ALSFRS into integers
recode_ALSFRS<-function(db) {
  vars <-
    c("q_51_1.1", "q_51_1.2", "q_51_1.3", "q_51_1.4", "q_51_1.5",
      "q_51_1.6", "q_51_1.7", "q_51_1.8", "q_51_1.9", "q_51_1.10",
      "q_51_1.11", "q_51_1.12", "q_51_2.1", "q_51_2.2", "q_51_2.3",
      "q_51_2.4", "q_51_2.5", "q_51_2.6", "q_51_2.7", "q_51_2.8", "q_51_2.9",
      "q_51_2.10", "q_51_2.11", "q_51_2.12")
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
importXLSDatabases<-function(filename=NULL, path_prefix=NULL) {
  if(is.null(path_prefix)) {
    path_prefix<-'/home/Adama-docs/Adam/MyDocs/praca/masia@ibib/ALSdatabase'
  }
  db_als<-joinExcels(prefix = path_prefix, flag_control = FALSE)
  db_ctrl<-joinExcels(prefix = path_prefix, flag_control = TRUE)

  als_ctrl_dic_filename<-system.file(getOption('onwebduals.als_ctrl_dic'),package='ONWebDUALSimport')
  als_ctrl_dic<-getALS_control_dic(als_ctrl_dic_filename)

  joined_db<-joinALS_Ctrl(db_als = db_als, db_ctrl = db_ctrl, als_ctrl_dic)


  if(!is.null(filename)) {
    savedb(db = joined_db, filename = filename)
  }
  return(joined_db)
}
