

#Loads the template with the database read from the web, using the web_xls_dic.xlsx dictionary
fill_template<-function(in_dt, out_dt, dict, debug_n=100000){
  reportClass<-ReportClass$new()
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

		out_colnames<-dict$out_colname[[i]]
		if(stringr::str_detect(out_colnames, stringr::fixed(':'))) {
		  ans<-stringr::str_match(out_colnames, stringr::regex('^(.*):(.*)$') )
		  var_start<-ans[[2]]
		  var_end<-ans[[3]]
		  pos_start<-which(colnames(out_dt)==var_start)
		  if(length(pos_start)!=1) {
		    browser()
		  }
		  pos_end<-which(colnames(out_dt)==var_end)
		  if(length(pos_end)!=1) {
		    browser()
		  }
		  out_colnames<-colnames(out_dt)[seq(pos_start, pos_end)]
		} else {
		  if(!out_colnames %in% colnames(out_dt)) {
		    browser() #Dodn't find the web_colname in dtall
		  }
		}

		# if(i==85) browser()

		if(i<nrow(dict)) {
		  if(is.na(dict$convtype1[[i+1]])) {
		    flag_cont<-FALSE
		  } else {
		    if(dict$convtype1[[i+1]]=='cont') {
		      flag_cont<-TRUE
		    } else {
		      flag_cont<-FALSE
		    }
		  }
		}

		if(flag_cont) {
		  j<-1
		  in_colnames<-dict$in_colname[[i]]
      while(dict$convtype1[[j+i]]=='cont') {
        if(! in_colnames[[j]] %in% colnames(in_dt)) {
          browser()
        }
        in_colnames<-c(in_colnames, dict$in_colname[[j+i]])
        if(j<nrow(dict)) {
          j<-j+1
        } else {
          j<-j+1
          break
        }
      }
		  next_i<-i+j
		} else {
		  in_colnames<-dict$in_colname[[i]]
		  if(! in_colnames %in% colnames(in_dt)) {
		    browser()
		  }
		  next_i <- i + 1
		}
		# if(identical(out_colnames, 'q_143a')) {
		#   browser()
		# }

		cat(paste0("Interpreting row ", i, ": (",
		           paste0(in_colnames, collapse=', '), ")->(",
		           paste0(out_colnames, collapse=', '), ')\n'))


		if(!is.na(dict$convtype1[[i]])) {
			funname<-dict$convtype1[[i]]
			#if(funname=='pattern_of_spreading') browser()
			par<-dict$par1[[i]]
			if(i>=debug_n) {
				browser()
			}

			fun<-eval(parse(text=funname))
			out_dt<-fun(in_dt, in_colnames, out_dt, out_colnames, par, i>=debug_n, reportClass)
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
			  out_dt<-fun(in_dt, in_colnames, out_dt, out_colnames, par, i>=debug_n, reportClass)
			  if(i>=debug_n) {
			    browser()
			  }
			}

		} else {
		  if(length(out_colnames)==1 && length(in_colnames)==1) {
		    var<-in_dt[[in_colnames]]
		    in_type<-danesurowe::class2vartype_str(class(var))
		    out_type<-danesurowe::class2vartype_str(class(out_dt[[out_colnames]]))
		    if(out_type != in_type) {
		      type_comb<-paste0(out_type, in_type)
		      #cat(paste0(type_comb, '\n'))
		      if(type_comb=='SN') {
		        var2<-as.numeric(stringr::str_replace(stringr::str_replace_all(var, ',', '.'),
		                                              pattern = stringr::regex('^NA$'), NA_character_))
		      } else if(type_comb=='FS') {
		        uvalues<-setdiff(unique(var), c(NA, 'NA'))
		        a<-setdiff(uvalues, levels(out_dt[[out_colnames]]))
		        if(length(a)>0) {
		          browser()
		        }
		        var2<-which(var %in% levels(out_dt[[out_colnames]]))
		      } else if (out_type %in% c('F', 'L')) {
		        uq<-setdiff(unique(var), NA)
		        r<-setdiff(uq, c(NA, seq(length(uq))))
		        if(length(r)>0) {
		          if(i>=debug_n) {
		            browser()
		          }
		        }
		        var2<-as.integer(var)
		      } else if (type_comb=='NS') {
		        var2<-as.character(var)
		      } else if (out_type %in% c('I')) {
		        var2<-suppressWarnings(as.integer(var))
		      } else   {
		        browser()
		      }
		      var<-var2
		    }
		    if(in_type != out_type) {
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

factor_by_value<-function(in_dt, in_varname, out_dt, out_varname, pars_in, do_debug, reportClass) {
  # if(out_varname=='group') {
  #   browser()
  # }
  out_varname<-out_varname[[1]]
  var_from<-in_dt[[in_varname]]
  var_target<-out_dt[[out_varname]]
  dic_from<-sort(unique(as.integer(var_from)))
	dic_from_left<-dic_from
	dic_to<-dic_from

	# if('integer' %in% class(var_from) || 'numeric' %in% class(var_from)) {
	# 	browser()
	# }

	if(is.na(pars_in)) {
	  var_out=var_from
	  a <- attributes(var_target)

	  if('factor' %in% a$class) {
	    out_dt[,(out_varname):=as.integer(var_out)]
	  } else {
	    out_dt[,(out_varname):=var_out]
	  }
	  for(aname in names(a)) {
	    setattr(out_dt[[out_varname]], aname, a[[aname]])
	  }
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

	type_str<-paste0(danesurowe::class2vartype(var_from),
	                 danesurowe::class2vartype(var_target))

	if(type_str == 'FF') {
	  var_out<-as.integer(var_out)
	} else if(type_str == 'LL') {
	  var_out<-as.numeric(var_out)
	} else if(type_str =='LF') {
	  xlevels<-danesurowe::GetLevels(var_target, flag_recalculate = FALSE)
	  xlevels<-xlevels[order(xlevels)]
	  if(!identical(sort(as.integer(xlevels)), seq_along(xlevels))) {
	    browser()
	  } else  {
	    if(sum(!var_out %in% seq_along(xlevels) & !is.na(var_out) & var_out!=0)>0) {
	      var_out[!var_out %in% seq_along(xlevels) & !is.na(var_out) & var_out!=0]
	      browser()
	    }
	    var_out[!var_out %in% seq_along(xlevels)]<-NA
	    var_out<-factor(var_out, levels = xlevels, labels = names(xlevels))
	  }
	} else if(type_str == 'FL') {
	  xlevels<-danesurowe::GetLevels(var_target, flag_recalculate = FALSE, flag_include_NA=TRUE)
	  var_out<-haven::labelled(x=var_out,labels = xlevels)
#	  browser()
	} else if(type_str == 'FI') {
	  browser()
	}
	else if(type_str == 'SF') {
	  xlevels<-danesurowe::GetLevels(var_target, flag_recalculate = FALSE)
	  if(length(setdiff(unique(var_out), xlevels))==0) {
	    var_out<-factor(var_out, levels = xlevels, labels = names(xlevels))
	  } else if (length(setdiff(unique(var_out), names(xlevels)))==0) {
	    browser()
	    var_out<-factor(var_out, levels = names(xlevels))
	  } else {
	    browser()
	  }
	}	else {

	  browser()
	}
	var_out<-danesurowe::copy_obj_attributes(obj_source = var_target, obj_dest = var_out)

  out_dt[,(out_varname):=var_out]
	# } else {
	#   out_dt[,(out_varname):=var_out]
	# }
	# for(aname in names(a)) {
	#   setattr(out_dt[[out_varname]], aname, a[[aname]])
	# }

#	out_dt<-danesurowe::copy_var_attributes(var_source = var_from, dt_dest = out_dt, var_dest_name = out_varname)
	#	return(var_out)
	return(out_dt)
}

yesno_by_integer<-function(in_dt, in_varname, out_dt, out_varname, pars_in, do_debug, reportClass) {
  browser()
  var_from<-in_dt[[in_varname]]
#  var_target<-out_dt[[out_varname]]

  var_out<-as.integer(var_from+1)
  var_target<-out_dt[[out_varname]]
  var_out<-danesurowe::copy_obj_attributes(obj_source = var_target, obj_dest = var_out, force_include_cols = 'levels')
  out_dt[,(out_varname):=var_out]
  #	return(var_out)
  return(out_dt)
}


Date_by_value<-function(in_dt, in_varname, out_dt, out_varname, pars_in, do_debug, reportClass) {
  browser()
  var_from<-in_dt[[in_varname]]
  var_target<-out_dt[[out_varname]]
  dt<-lubridate::parse_date_time(var_from, 'Y!m!*dH!M!S!z!*')
  var_out<-as.Date(round(dt, 'day'))
  var_out<-danesurowe::copy_obj_attributes(obj_source = var_target, obj_dest = var_out)
  out_dt[,(out_varname):=var_out]

  #	return(var_out)
  return(out_dt)

}
