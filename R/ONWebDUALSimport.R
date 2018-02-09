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
    onwebduals.webdocs="app_dictionaries.xlsx",
    onwebduals.web2xls_dic="web_xls_dic.xlsx",
    onwebduals.dbtemplate="DBTemplate.xlsm"
  )
  toset	<-	!(names(op.onwebduals)	%in%	names(op))
  if(any(toset))	options(op.onwebduals[toset])
  invisible()
}
# nocov end


#' Imports the web-based database via its SOAP API.
#' @param flag_ALSFRS_as_integers If set (the default) the ALSFRS questionnaire
#'        gets output as integers, not labelled data.
#' @return Returns data.table version of the database.
#' @export
importWebDatabase<-function(flag_ALSFRS_as_integers=TRUE) {
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

  savedb(db = dbout, filename = 'db_so_far.xlsx')
  debugonce(post_processing_for_webdb)
  dbpp<-post_processing_for_webdb(dbout)
  savedb(db = dbpp, filename = 'db_als_web.xlsx')

  return(dbout)
}
