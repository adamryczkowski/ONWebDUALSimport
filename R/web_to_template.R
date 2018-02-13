

#Loads the template with the database read from the web, using the web_xls_dic.xlsx dictionary
fill_template<-function(in_dt, out_dt, dict, debug_n=100000){
	options(warn=2)

  ref_out_dt<-data.table::copy(out_dt) #Copy for the reference

  i<-1
  flag_end<-FALSE
  while(!flag_end) {
		#We iterate over columns

    if(!is.na(dict$convtype1[[i]])) {
      if(dict$convtype1[[i]]=='cont') {
        browser()
      }
    }

		in_colnames<-dict$in_colname[[i]]
		if(stringr::str_detect(in_colnames, stringr::fixed(':'))) {
		  ans<-stringr::str_match(in_colnames, stringr::regex('^(.*):(.*)$') )
		  var_start<-ans[[2]]
		  var_end<-ans[[3]]
		  pos_start<-which(colnames(in_dt)==var_start)
		  if(length(pos_start)!=1) {
		    browser()
		  }
		  pos_end<-which(colnames(in_dt)==var_end)
		  if(length(pos_end)!=1) {
		    browser()
		  }
		  in_colnames<-colnames(in_dt)[seq(pos_start, pos_end)]
		} else {
		  if(!in_colnames %in% colnames(in_dt)) {
		    browser() #Dodn't find the web_colname in dtall
		  }
		}

		#if(colnr>=361) browser()

    if(is.na(dict$convtype1[[i]])) {
      flag_cont<-FALSE
    } else {
      if(dict$convtype1[[i]]=='cont') {
        flag_cont<-TRUE
      } else {
        flag_cont<-FALSE
      }
    }
		if(flag_cont) {
		  j<-i
      while(dict$convtype1[[j]]=='cont') {
        if(! out_colname[[j]] %in% colnames(out_dt)) {
          browser()
        }
        out_colname<-c(out_colname, dict$out_colname[[j]])
        if(j<nrow(dict)) {
          j<-j+1
        } else {
          j<-j+1
          break
        }
      }
		  next_i<-j-1
		} else {
		  out_colnames<-dict$out_colname[[i]]
		  if(! out_colnames %in% colnames(out_dt)) {
		    browser()
		  }
		  next_i <- i + 1
		}

		cat(paste0("Interpreting row ", i, ": (",
		           paste0(in_colnames, collapse=', '), ")->(",
		           paste0(out_colnames, collapse=', '), ')\n'))


		if(!is.na(dict$convtype1[[i]])) {
			funname<-dict$convtype1[[i]]
			par<-dict$par1[[i]]
			if(i>=debug_n) {
				browser()
			}

			fun<-eval(parse(text=funname))
			out_dt<-fun(in_dt, in_colnames, out_dt, out_colnames, par, i>=debug_n)
			if(i>=debug_n) {
				browser()
			}

			if(!is.na(dict$convtype2[[i]])) {
			  browser()
			  funname<-dict$convtype2[[i]]
			  par<-dict$par2[[i]]
			  if(i>=debug_n) {
			    browser()
			  }

			  fun<-eval(parse(text=funname))
			  out_dt<-fun(in_dt, in_colnames, out_dt, out_colnames, par, i>=debug_n)
			  if(i>=debug_n) {
			    browser()
			  }
			}

		} else {
		  if(length(out_colnames)==1 && length(in_colnames)==1) {
		    var<-ref_out_dt[[out_colnames]]
		    in_type<-danesurowe::class2vartype_str(class(var))
		    out_type<-danesurowe::class2vartype_str(class(out_dt[[out_colnames]]))
		    if(out_type != in_type) {
		      type_comb<-paste0(out_type, in_type)
		      #cat(paste0(type_comb, '\n'))
		      if(type_comb=='SN') {
		        var2<-as.numeric(stringr::str_replace(stringr::str_replace_all(var, ',', '.'),
		                                              pattern = stringr::regex('^NA$'), NA_character_))
		      } else if (out_type %in% c('F', 'L')) {
		        uq<-setdiff(unique(var), NA)
		        r<-setdiff(uq, c(NA, seq(length(uq))))
		        if(length(r)>0) {
		          if(i>=debug_n) {
		            browser()
		          }
		        }
		        var2<-as.integer(var)
		      } else if (out_type %in% c('I')) {
		        var2<-as.integer(var)
		      } else {
		        browser()
		      }
		      var<-var2
		    }
		    if(in_type != out_type && !type_comb %in% c('IF', 'NL', 'IL')) {
		      browser()
		    } else {
		      suppressWarnings(set(x = out_dt, i=seq(length.out=nrow(out_dt)), j = out_colnames, value = var))
		    }

		  } else {
		    browser()
		  }
		}

		if(i>=debug_n) {
			browser()
		}

		if(i==nrow(dict)) {
		  flag_end<-TRUE
		} else {
		  i<-next_i
		}

	}
	return(out_dt)
}

factor_by_value<-function(in_dt, in_varname, out_dt, out_varname, pars_in, do_debug) {
  var_from<-in_dt[[in_varname]]
  var_target<-out_dt[[out_varname]]
	dic_from<-sort(unique(as.integer(var_from)))
	dic_from_left<-dic_from
	dic_to<-dic_from

	if('integer' %in% class(var_from) || 'numeric' %in% class(var_from)) {
		browser()
	}

	if(is.na(pars_in)) {
	  out_dt[,(out_varname):=as.integer(var_from)]
	  return(out_dt)
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
		} else if(par=='')  {
			# do nothing
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
	out_dt[,(out_varname):=var_out]
#	return(var_out)
	return(out_dt)
}

yesno_by_integer<-function(in_dt, in_varname, out_dt, out_varname, pars_in, do_debug) {
  var_from<-in_dt[[in_varname]]
#  var_target<-out_dt[[out_varname]]

  out_dt[,(out_varname):=as.integer(var_from+1)]
  #	return(var_out)
  return(out_dt)
}


Date_by_value<-function(in_dt, in_varname, out_dt, out_varname, pars_in, do_debug) {
  var_from<-in_dt[[in_varname]]
  var_target<-out_dt[[out_varname]]
  dt<-lubridate::parse_date_time(var_from, 'Y!m!*dH!M!S!z!*')
  out_dt[,(out_varname):=as.Date(round(dt, 'day'))]
  #	return(var_out)
  return(out_dt)

}
