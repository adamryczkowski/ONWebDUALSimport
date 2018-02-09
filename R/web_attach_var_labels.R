
get_dictionary<-function(webaddress, cat_id) {
	if(is.na(cat_id)) {
		browser()
	}

	if(is.na(suppressWarnings(as.numeric(cat_id)))) {
		dicttab<-stringr::str_match(cat_id, stringr::regex("(A001_)?(.*)$"))[[3]]

		pars<-list(a=1)
		dict_cat_id<-NA
	} else {
		dicttab<-'DictSelect'
		pars<-list(p_dict_cat_id=as.numeric(cat_id))
	}

  cat(paste0("Fetching dictionary from ", webaddress, ", id=", cat_id, " with the API call ", dicttab, "...\n"))

	SOAP_Call(webaddress = webaddress, funcname=dicttab, pars=pars)
}

get_dictionary_memoized<-memoise::memoise(get_dictionary)

is_field_bitfield<-function(question_name, app_dict) {
	pos<-which(app_dict$field_name_api==question_name)
	if(length(pos)!=1) {
		return(FALSE)
	}
	field_info<-app_dict[pos,]
	return(field_info$multiple)
}


attach_dictionaries<-function(value_table, app_dict, dt, webaddress) {
	adnr<-1
	maxadnr<-nrow(app_dict)

	while(adnr <= maxadnr) {
		#if(adnr==5) browser()
#		cat(paste0("adnr: ",adnr, "\n"))
		if(is.null(app_dict$field_name_api)) {
			field_name_api<-app_dict$field_name[[adnr]]
			field_name_vt<-field_name_api
		} else {
			field_name_api<-app_dict$field_name_api[[adnr]]
			field_name_vt<-app_dict$field_name_vt[[adnr]]
		}
		field_type<-app_dict$field_type[[adnr]]
		cat_id<-app_dict$cat_id[[adnr]]
		pos<-which(names(value_table) %in% field_name_vt)
		if(length(pos)==0) {
			pos<-which(names(value_table) %in% stringr::str_to_lower(field_name_vt))
			if(length(pos)==0) {
				browser()
				field_name_vt=NA
			} else {
				field_name_vt<-stringr::str_to_lower(field_name_vt)
			}
		}
		if(!is.na(field_name_vt)) {
			cat_id<-dplyr::coalesce(cat_id,'')
			if(cat_id=='') {
				#Do nothing. Or maybe just verify the field type

				dt[,(field_name_vt):=value_table[[field_name_vt]] ]
				data.table::setattr(dt[[field_name_vt]], 'field_type', field_type)
			} else {
				dict<-get_dictionary_memoized(webaddress=webaddress, cat_id=cat_id)
				if(nrow(dict)==0) {
					browser()
				}
				if(is_field_bitfield(field_name_api, app_dict)) {
					#browser()
					if( ! ('value' %in% names(dict))) {
						browser()
					}
					max_bit<-log(max(as.integer(dict$value)),2)
					if(length(setdiff(dict$value, 2^seq(0, max_bit)))!=0) {
						browser()
					}
					int2bit<-Vectorize(FUN = function(x) if(is.na(x)) rep(NA_integer_, max_bit+1) else as.integer(intToBits(x)[seq(1, max_bit+1)]))
					new_fields<-t(int2bit(value_table[[field_name_vt]]))
					new_powers<-2^seq(0, max_bit)
					dic_powers<-as.integer(dict$value)
					to_check<-setdiff(new_powers, dic_powers)
					poss<-log(to_check,2)+1
					if(length(poss)>0) {
						for(pos in poss) {
							if(length(which(new_fields[,pos]!=0))>0) {
								warning(paste0("There is no label for level ", poss, " in bitfield for rows ", paste0(which(new_fields[,pos]!=0), col=' ')))
								#browser()
							}
						}
						new_fields<-new_fields[,-to_check]
					}
					new_names<-paste0(field_name_vt, '_', 1+log(dic_powers, 2))
					for(i in seq_along(new_names)) {
						dt[,(new_names[[i]]):=new_fields[,i] ]
						setattr(dt[[new_names[[i]] ]], 'label', paste0(app_dict$qname[[adnr]], ' - ', dict$name[[i]]))
					}
				} else {
					values_db<-unique(value_table[[field_name_vt]])
					values_db<-values_db[!is.na(values_db)]
					if('value' %in% names(dict)) {
						values_cat<-dict$value
					} else {
						values_cat<-dict$id
					}
					if(length(unique(values_cat))!=length(values_cat)){
						warning(paste0("Dictionary for field ", field_name_api, " has non-unique values"))
					}
					if(length(setdiff(values_db, values_cat))) {

						warning(paste0("In field ", field_name_api, " (", app_dict$qname[[adnr]], ") there are ", length(setdiff(values_db, values_cat)),
													 " levels, that doesn't have dictionary entry: ", paste0(setdiff(values_db, values_cat), collapse = " "),
													 ". First entry is missing for the following respondents: ",
													 paste0(value_table$uid[which(value_table[[field_name_vt]]==setdiff(values_db, values_cat)[[1]])], collapse=", ")))
						data.frame(table(value_table[[field_name_vt]]))
						#browser()
					}
					if(length(setdiff(values_db, values_cat))==0) {
						#Jeśli wszystkie wartości są w słowniku...
						if(length(setdiff(values_cat, seq(nrow(dict))))==0) {
							#Jeśli słownik jest liczbami naturalnymi...
							dt[, (field_name_vt):=factor(value_table[[field_name_vt]], levels = seq(nrow(dict)), labels = dict$name)]
						} else {
							dt[,(field_name_vt):=labelled::labelled(value_table[[field_name_vt]], setNames(values_cat, dict$name))]
						}
					} else {
						values_db_no_NA<-values_db[!is.na(values_db)]
						values_db_no_NA<-stringr::str_replace(string = values_db_no_NA, pattern = stringr::fixed(','), replacement = '.')
						values_db_no_NA[values_db_no_NA=='NA']<-NA
						values_db_no_NA<-values_db_no_NA[!is.na(values_db_no_NA)]
						if (suppressWarnings(all(!is.na(as.numeric(values_db_no_NA))))) {
							#Wszystkie wartości konwertują się do numeric
							vec<-value_table[[field_name_vt]]
							vec<-stringr::str_replace(string = vec, pattern = stringr::fixed(','), replacement = '.')
							vec[vec=='NA']<-NA
							field_name_out<-field_name_api
							field_name_nr<-1
							while(field_name_out %in% colnames(dt)) {
								field_name_out<-paste0(field_name_vt,"_", field_name_nr)
							}
#							browser()
							dt[,(field_name_out):=labelled::labelled(as.numeric(vec), setNames(as.numeric(values_cat), dict$name))]
						} else {
							browser() #Słownik dla pól tekstowych!
						}
					}
				}
			}
			qlabel<-app_dict$qname[[adnr]]
			if(!is.null(qlabel)) {
				#				browser()
				if(!is.null(dt[[field_name_vt]])) {
					data.table::setattr(dt[[field_name_vt]], 'label', qlabel)
				}
			}

		}
		adnr<-adnr+1
	}
	return(dt)
}


read_through_dicts2<-function(value_table, app_dict, webaddress) {
	#value_table<-load_all_patient_tables()
	dt<-data.table(uid=value_table$uid)

	adnr<-1
	maxadnr<-nrow(app_dict)

	#Algorytm:
	# Najpierw idziemy wiersz-po-wierszu przez słownik app_dict. Zadanie nasze to szukać pól
	# typu webservice, które musimy zamienić na płaską (nie-zagnieżdżoną) bazę danych.
	#
	# Efektem pracy jest rozpiasana tabela app_dict oraz surowa baza danych wartości
	#
	# Następnie wołamy dt<-attach_dictionary(flat_app_dict, my_value_table, dt), która
	# iteruje po wszystkich rekordach falt_app_dict dodając słownik i zwraca dt.



	while(adnr <= maxadnr) {
		cat(paste0('Executing chunk that starts with question number ',adnr,'...\n'))
#		browser()
#		if(adnr>=188) browser()

		webservice<-dplyr::coalesce(app_dict$webservice[[adnr]],'')
		if(!is.na(app_dict$webservice_par[[adnr]])) {
			webservice<-paste0(webservice, " ", app_dict$webservice_par[[adnr]], "=", app_dict$webservice_value[[adnr]])
		}
		old_webservice<-webservice

		start_adnr=adnr
		while(webservice==old_webservice) {
			#We simply iterate over all subsequent rows with the same webservice.
			adnr<-adnr+1
			if(adnr>maxadnr) break
			webservice<-dplyr::coalesce(app_dict$webservice[[adnr]],'')
			if(!is.na(app_dict$webservice_par[[adnr]])) {
				webservice<-paste0(webservice, " ", app_dict$webservice_par[[adnr]], "=", app_dict$webservice_value[[adnr]])
			}

		}
		#adnr points to the next record
		webservice<-dplyr::coalesce(app_dict$webservice[[start_adnr]],'')
		#browser()
		if(webservice=='') {
			my_app_dict<-app_dict[start_adnr:(adnr-1),]
			my_value_table<-value_table
		} else {
			#browser()
			webservice_name<-stringr::str_match(webservice, stringr::regex("(A001_)?(.*)$"))[[3]]
			webservice_par<-app_dict$webservice_par[[start_adnr]]
			webservice_value<-app_dict$webservice_value[[start_adnr]]
			field_names_vt<-app_dict$field_name_vt[start_adnr:(adnr-1)] #Tyle elementów, ile jest ma być pól w połączonej bazie danych
			field_names_api<-app_dict$field_name_api[start_adnr:(adnr-1)] #Tyle elementów, ile jest ma być pól w połączonej bazie danych
			field_types<-app_dict$field_type[start_adnr:(adnr-1)]
			field_catids<-app_dict$cat_id[start_adnr:(adnr-1)]

			#We read in the nested database, row by row
			cat(paste0("Reading nested rows from ", webaddress, " with API call ", webservice, '...\n'))
			tabs<-parallel::mclapply(value_table$patient_id, function(patient_id) {
				patient_id<-as.integer(patient_id)
				pars<-list(p_patient_id=patient_id)
				if(!is.na(webservice_par)){
					pars[[webservice_par]]<-webservice_value
				}
				SOAP_Call(webaddress=webaddress, funcname=webservice_name,pars=pars)
			}, mc.cores=25) #We use many more cores than availabel, because the function is internet-bound, not cpu-bound
			# tabs<-lapply(value_table$patient_id, function(patient_id) {
			# 	patient_id<-as.integer(patient_id)
			# 	pars<-list(p_patient_id=patient_id)
			# 	if(!is.na(webservice_par)){
			# 		pars[[webservice_par]]<-webservice_value
			# 	}
			# 	cat(paste0("patient_id=",patient_id,'\n'))
			# 	SOAP_Call(webaddress=webaddress, funcname=webservice_name,pars=pars)
			# })


			rec_count<-max(purrr::map_int(tabs, ~nrow(.)))
			all_field_names<-unique(unlist(purrr::map(tabs, ~if(nrow(.)>0) colnames(.) else (NULL) )))
			if (rec_count>0) {
				digit_count<-floor(log10(rec_count))+1
				my_value_table<-data.table::data.table(uid=value_table$uid)

				extra_fields<-setdiff(all_field_names, c('patient_id', '.id', 'id', field_names_api))
				if(length(extra_fields)>0) {
					warning(paste0("API ", webservice, " returned extra fields not used by us: ",
												 paste0(extra_fields, collapse = ', ')))
#					browser()
				}


				for(recnr in seq(1, rec_count)) {
					for(colnr in seq_along(field_names_vt)) {
						field_name_vt<-field_names_vt[[colnr]]
						newfield_name_vt<-paste0(field_name_vt,"_", stringr::str_pad(recnr,digit_count+1,side='left', pad='0'))
						newfield_name_api<-field_names_api[[colnr]]
						if(!newfield_name_api %in% all_field_names) {
							warning(paste0("Field ", newfield_name_api, " was never returned by the web database. "))
							browser()
						}
						tmpdb<-app_dict[start_adnr+colnr-1,]
						tmpdb$field_name_vt<-newfield_name_vt
						if(colnr==1 && recnr==1) {
							my_app_dict<-tmpdb
						} else {
							my_app_dict<-rbind(my_app_dict,tmpdb)
						}

						vec<-purrr::map_chr(tabs, function(tab, field_name_api, recnr) {
							if(nrow(tab)>0) {
								if(field_name_api %in% names(tab)){
									tmp<-tab[[field_name_api]]
									if(length(tmp)<recnr) {
										return(NA)
									} else {
										return(tmp[[recnr]])
									}
								} else {
									return(NA)
								}
							} else {
								return(NA)
							}
						}, field_name_api=newfield_name_api, recnr=recnr)
						my_value_table[,(newfield_name_vt):=vec]
					}
				}
			#	data.table::setnames(my_app_dict, 'field_name', 'field_name_api')
			} else {
				warning(paste0("Nikt do tej pory nie wypełnił tabeli ", webservice))
				my_app_dict<-NULL
				my_value_table<-NULL
			}
		}
		#browser()
		if(!is.null(my_app_dict) && !is.null(my_value_table)) {
			dt<-attach_dictionaries(value_table = my_value_table, app_dict=my_app_dict, dt=dt, webaddress=webaddress)
		}
	}
	return(dt)
}
