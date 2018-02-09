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
    onwebduals.web2xls_dic="web_xls_dic.xlsx"
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
  vtable_not_deleted<-value_table[value_table$is_deleted!='true',]
  vtable_not_test<-vtable_not_deleted[stringr::str_sub(vtable_not_deleted$uid,1, 3)!='TES',]
  value_table<-vtable_not_test[!is.na(vtable_not_test$patient_id),]

  # Using the web documentaion (in separate file) we associate

  # dictionaries with the questions, and read in nested questionnaires.
  dtall<-suppressWarnings(read_through_dicts2(value_table), webaddress=getOption('onwebduals.webaddress'))

  # Read the reference format for the database.
  # The format is present in the separate Excel file.
  # In this reference file there are all necessary meta-data, including
  # validation info
  docs_filename<-system.file(getOption('onwebduals.webdocs'),package='ONWebDUALSimport')
  ref<-read_ref(row_length = nrow(dtall), webDocumentation=docs_filename)

  # Read the dictionary that translates the layout of the web database
  # to the layout of the Excel file. It is stored in a separate file
  dic_filename<-system.file(getOption('onwebduals.webdocs'),package='ONWebDUALSimport')
  dict<-get_dict(dic_filename)

  # Fill the reference database with the web entries after they are
  # transcoded according to the dict. ref gets updated by reference.
  fill_template(dtall=dtall, dict = dict, ref = ref)

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
