#' Returns empty reference database that is ready to accept new rows
#'
#' @param row_length The database may come pre-filled with the
#'        \code{row_length} empty rows. All data will be \code{NA}
#' @param reference_source Path to the reference source. Defaults
#'        to the reference shipped with the library.

read_ref<-function(row_length=0, reference_source=NULL) {
  if(is.null(reference_source)) {
    reference_source<-system.file(getOption('onwebduals.dbtemplate'),package='ONWebDUALSimport')
  }

#	debugonce(danesurowe::readDaneSurowe4)
	tmpl<-danesurowe::readDaneSurowe4(reference_source)
	template<-tmpl[integer(0),]
	template<-danesurowe::copy_dt_attributes(dt_source = tmpl, dt_dest=template)
	if(row_length>0) {
		template<-rbind(template, lp=seq(length.out=row_length), fill=TRUE)
		template<-danesurowe::copy_dt_attributes(dt_source = tmpl, dt_dest=template)
	}

	return(template)
}

#' Gets the structure of the reference database (The One That Can Store Them All)
#' @param outputfile Where the structure shall be saved (in Excel format)
#' @param reference_source Path to the reference source. Defaults
#'        to the reference shipped with the library.
#' @return Nothing
get_reference_structure<-function(outputfile='webstruct.xlsx', reference_source=NULL) {
  if(is.null(reference_source)) {
    reference_source<-system.file(getOption('onwebduals.dbtemplate'),package='ONWebDUALSimport')
  }
  dtall_struct<-danesurowe::create_df_from_df_structure(dtall)
	savedb(dtall_struct,'webstruct.xlsx')
}

