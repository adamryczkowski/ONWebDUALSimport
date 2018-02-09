#Loads the template with the database read from the web, using the web_xls_dic.xlsx dictionary
fill_template<-function(dtall, ref, dict, debug_n=100000){
	options(warn=2)

	for(colnr in seq(length.out=nrow(dict))) {
		#We iterate over columns
		if(!danesurowe::IsVariableValidation(dt = dtall, varnr = colnr)){
			web_colname<-dict$web_colname[[colnr]]
			target_colname<-dict$target_colname[[colnr]]

			cat(paste0("Inserting variable nr ", colnr, ": ", web_colname, "->", target_colname, '\n'))
			#if(colnr>=361) browser()

			if(!web_colname %in% colnames(dtall)) {
				browser() #Dodn't find the web_colname in dtall
			}
			var<-dtall[[web_colname]]
			if(!target_colname %in% colnames(ref)) {
				browser() #Cannot find target_colname in target dic!
			}
			if(!is.na(dict$convtype1[[colnr]])) {
				funname<-dict$convtype1[[colnr]]
				par<-dict$par1[[colnr]]
				if(colnr>=debug_n) {
					browser()
				}

				fun<-eval(parse(text=funname))
				var2<-fun(var, ref[[target_colname]], par, colnr>=debug_n)
				if(colnr>=debug_n) {
					browser()
				}
				var<-var2
			}
			if(!is.na(dict$convtype2[[colnr]])) {
				browser()
				funname<-dict$convtype2[[colnr]]
				par<-dict$par2[[colnr]]
				if(colnr>=debug_n) {
					browser()
				}

				fun<-eval(parse(text=funname))
				var2<-fun(var, ref[[target_colname]], par, colnr>=debug_n)
				if(colnr>=debug_n) {
					browser()
				}
				var<-var2
			}
			web_type<-danesurowe::class2vartype_str(class(var))
			target_type<-danesurowe::class2vartype_str(class(ref[[target_colname]]))
			if(web_type != target_type) {
				type_comb<-paste0(web_type, target_type)
				#cat(paste0(type_comb, '\n'))
				if(type_comb=='SN') {
					var2<-as.numeric(stringr::str_replace(stringr::str_replace_all(var, ',', '.'), pattern = stringr::regex('^NA$'), NA_character_))
				} else if (target_type %in% c('F', 'L')) {
					uq<-setdiff(unique(var), NA)
					r<-setdiff(uq, c(NA, seq(length(uq))))
					if(length(r)>0) {
						if(colnr>=debug_n) {
							browser()
						}
					}
					var2<-as.integer(var)
				} else if (target_type %in% c('I')) {
					var2<-as.integer(var)
				} else {
					browser()
				}
				var<-var2
			}
			web_type<-danesurowe::class2vartype_str(class(var))
			target_type<-danesurowe::class2vartype_str(class(ref[[target_colname]]))
			type_comb<-paste0(web_type, target_type)
			if(web_type != target_type && !type_comb %in% c('IF', 'NL', 'IL')) {
				browser()
			} else {
				suppressWarnings(set(x = ref, i=seq(length.out=nrow(dtall)), j = target_colname, value = var))
			}
			if(colnr>=debug_n) {
				browser()
			}

		}
	}
	return(ref)
}

factor_by_value<-function(var_from, var_target, pars_in, do_debug) {
	dic_from<-sort(unique(as.integer(var_from)))
	dic_from_left<-dic_from
	dic_to<-dic_from

	if('integer' %in% class(var_from) || 'numeric' %in% class(var_from)) {
		browser()
	}

	if(is.na(pars_in)) {
		return(as.integer(var_from))
	} else {
		pars<-stringr::str_split(pars_in, pattern=stringr::fixed(";"))[[1]]
	}

	for(par in pars) {
		if(stringr::str_detect(par, pattern=stringr::fixed('->'))) {
			m<-stringr::str_match(par, pattern=stringr::regex('^(.*)->(.*)$'))
			par_from<-as.integer(m[[2]])
			par_to<-m[[3]]
			if(is.na(par_from)) {
				browser()
			}

			if(is.na(suppressWarnings(as.numeric(par_to)))) {
				par_to_value<-danesurowe::LabelToValue(var_target, par_to)
				if(is.null(par_to_value)) {
					if(par_to=='NA') {
						par_to_value<-NA
					} else {
						browser()
					}
				}
			} else {
				par_to_value<-as.numeric(par_to)
			}
			if(par_from %in% dic_from){
				pos<-which(par_from == dic_from)
				if(is.na(dic_from_left[[pos]])) {
					browser()
					#This was already used!
				}
				dic_to[[pos]]<-par_to_value
				dic_from_left[[pos]]<-NA #Mark, that this value is taken
			} else {
				if(do_debug) {
					browser() #It seems, that there are no cases with par_from. No need to do anything.
				}

			}
		} else if (stringr::str_detect(par, pattern=stringr::regex('^[+-]\\d+$'))) {
			m<-stringr::str_match(par, pattern=stringr::regex('^([+-])(\\d+)$'))
			par_sign<-m[[2]]
			par_value<-as.integer(m[[3]])
			for(i in seq_along(dic_from_left)) {
				if(!is.na(dic_from_left[[i]])) {
					if(par_sign=="-") {
						dic_to[[i]]<-dic_to[[i]]-par_value
					} else {
						dic_to[[i]]<-dic_to[[i]]+par_value
					}
				}
			}
		} else {
			browser() #Unknown pattern
		}
	}
	#Now we have two arrays that make a replacement dictionary.
	df<-tibble::tibble(dic_from=dic_from, dic_to=dic_to, dic_from_left=dic_from_left)
	if(do_debug) {
		browser() #We should check both arrays
	}

	if(length(intersect(c('labelled', 'numeric'), class(var_from)))==0) {
		var_out<-as.integer(var_from)
	} else {
		var_out<-as.numeric(var_from)
	}
	for(i in seq_along(dic_from)) {
		if(!identical(dic_from[[i]], dic_to[[i]])) {
			var_out[as.integer(var_from)==dic_from[[i]] ]<-dic_to[[i]]
		}
	}
	return(var_out)
}

yesno_by_integer<-function(var_from, var_target, pars_in, do_debug) {
	as.integer(var_from+1)
}


Date_by_value<-function(var_from, var_target, pars_in, do_debug) {
	dt<-lubridate::parse_date_time(var_from, 'Y!m!*dH!M!S!z!*')
	return(as.Date(round(dt, 'day')))
}
