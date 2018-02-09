A001_PatientSelect<-function(webaddress, patient_id=0, patient_uid=NULL) {
	pars<-list(p_patient_id=patient_id)
	pars$p_patient_uid<-patient_uid
	ans<-SOAP_Call(webaddress = webaddress, funcname = 'PatientSelect', pars=pars)
}

A001_Patient_x_Select<-function(webaddress, patient_id=0, tablename) {
	pars<-list(p_patient_id=patient_id)
	ans<-tryCatch(
		SOAP_Call(webaddress, tablename, pars=pars),
		error=function(e) e)
}



patient_table_x<-function(webaddress, db, tablename) {
	cat(paste0("Reading from ", webaddress, " with API call ", tablename, '...\n'))
	ids<-db$patient_id
	tabs<-parallel::mclapply(ids, function(x) A001_Patient_x_Select(webaddress=webaddress,
	                                                                patient_id=as.numeric(x),
	                                                                tablename=tablename),
	                         mc.cores=25)
	pos<-which(plyr::laply(tabs, function(x) ! "data.frame" %in% class(x)))
	if(length(pos)>0) {
		msg<-paste0("Patients ", paste0(db$uid[pos], collapse = ", "), " could not have been retrieved")
		#stop(msg)
		warning(msg)
		missing_patients<-db$uid[pos]
#		browser()
		pos<-which(plyr::laply(tabs, function(x) "data.frame" %in% class(x)))
		tabs<-tabs[pos]
		ids<-ids[pos]
	} else {
		missing_patients<-character(0)
	}

	all_names<-unique(do.call(c, plyr::llply(tabs, names)))

	other_fields<-purrr::map(tabs, ~ attr(., 'other_fields'))
	non_used_fields<-Reduce(intersect, other_fields)

	types_tmp<-purrr::map(tabs,
	                      ~data.table::data.table(
	                        tibble::as_tibble(
	                          purrr::map(., ~if(is.null(attr(., "sqltype"))) NA else attr(., "sqltype")))
	                        )
	                      )
	typesdb<-Reduce(function(...) rbind(..., fill=TRUE), types_tmp)
	types<-purrr::map_chr(as.list(typesdb), function(x) {
		x<-as.character(unclass(na.omit(unique(x))))
		if(length(x)==0) {
			NA
		} else {
			x
		}
	})



	all_types<-unique(unlist(plyr::llply(tabs, function(x) plyr::laply(x, class))))
	if(length(all_types)>1) {
		browser()
	}

	cols<-tibble::as_tibble(setNames(rep(list(character(0)), length(all_names)), all_names))

	ans<-do.call(plyr::rbind.fill, tabs)
	for(i in seq(ans)) {
		pos<-which(names(types)==colnames(ans)[[i]])
		attr(ans[[i]], 'sqltype')<-types[[pos]]
	}
	attr(ans, 'missing_patients')<- missing_patients
	ans
}

load_all_patient_tables<-function(webaddress) {
	patient_ids<-A001_PatientSelect(webaddress = webaddress)
	tabs<-purrr::map(seq(11), ~patient_table_x(webaddress = webaddress , db = patient_ids,
	                                    tablename = paste0('Patient_', stringr::str_pad(., 2, pad="0"), '_Select')))

	a<-Reduce(function(...) dplyr::full_join(..., by = c(".id", "patient_id")), tabs)

#	missings<-map(tabs, ~attr(.,'missing_patients'))


	return(a)
}
