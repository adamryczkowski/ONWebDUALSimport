children<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
  out_dt
}

pattern_of_spreading<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
  out_dt
}

multiple_variants<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
  out_dt
}

to_report<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
  out_dt
}


manual_text<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
  out_dt
}


disease_in_family<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
  out_dt
}

disease_in_family_other<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
  out_dt
}

famlily_death<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
  out_dt
}

birth_order<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
  out_dt
}

sport_activity<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
  out_dt
}

manual_factor<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
  out_dt
}

specialist<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
  out_dt
}

to_factor<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  # if(out_colnames=='q_51_1.rate') {
  #   browser()
  # }
  if(is.na(par)){
    par<-''
  }
  if(length(in_colnames)>1) {
    browser()
  }
  if(length(out_colnames)>1) {
    browser()
  }
  var_in<-in_dt[[in_colnames]]
  var_in[var_in=='NA']<-NA

  labs<-danesurowe::GetLevels(out_dt[[out_colnames]], flag_include_NA = TRUE, flag_recalculate = FALSE)
  unval<-unique(var_in)

  if(length(setdiff(unval, names(labs)))>0) {
    browser()
  } else {
    var_out<-factor(var_in, levels = names(labs))
  }

  var_target<-out_dt[[out_colnames]]
  var_out<-danesurowe::copy_obj_attributes(obj_source = var_target, obj_dest = var_out)
  out_dt[,(out_colnames):=var_out]

  return(out_dt)
}

to_integer<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  if(is.na(par)){
    par<-''
  }
  if(length(in_colnames)>1) {
    browser()
  }
  if(length(out_colnames)>1) {
    browser()
  }


  var_in<-in_dt[[in_colnames]]
  var_in[var_in=='NA']<-NA
  where_repl<-stringr::str_detect(var_in, stringr::regex('^-?\\d*,\\d*$'))
  where_repl[is.na(where_repl)]<-FALSE
  if(sum(where_repl)>0) {
    var_in[where_repl]<-stringr::str_replace(var_in[where_repl], pattern = stringr::fixed(','), replacement = '.')
  }
  nas<-is.na(var_in)

  var_num<-suppressWarnings(as.numeric(var_in))
  num_nas<-is.na(var_num)
  var_out<-as.integer(var_num)
  num_nint<-(var_out != var_num)

  nans<-setdiff(which(num_nas), which(nas))
  if(length(nans)>0) {
    if(par=='NaN' || par=='NaN,Nint' || par=='NaN,Int') {
      #do nothing. NAs already inserted
    } else if (par%in%c('','Nint','Int')) {
      var_in[nans]
      browser() #There are some non-numeric cases.
    } else {
      browser() #Unkown par
    }
  }
  num_nint[num_nas]<-FALSE
  nint<-which(num_nint)
  if(length(nint)>0) {
    if(par%in%c('Nint', 'NaN,Nint')) {
      var_num[nint]<-NA
    } else if (par%in%c('Int','Nan,Int')) {
      #Do nothing, already rounded
    } else {
      var_num[nint]
      browser()
    }
  }
  var_target<-out_dt[[out_colnames]]
  var_out<-danesurowe::copy_obj_attributes(obj_source = var_target, obj_dest = var_out)
  out_dt[,(out_colnames):=var_out]

  return(out_dt)
}

to_numeric<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  # if(out_colnames=='q_51_1.rate') {
  #   browser()
  # }
  if(is.na(par)){
    par<-''
  }
  if(length(in_colnames)>1) {
    browser()
  }
  if(length(out_colnames)>1) {
    browser()
  }
  var_in<-in_dt[[in_colnames]]
  var_in[var_in=='NA']<-NA
  where_repl<-stringr::str_detect(var_in, stringr::regex('^-?\\d*,\\d*$'))
  where_repl[is.na(where_repl)]<-FALSE
  if(sum(where_repl)>0) {
    var_in[where_repl]<-stringr::str_replace(var_in[where_repl], pattern = stringr::fixed(','), replacement = '.')
  }
  nas<-is.na(var_in)

  var_out<-suppressWarnings(as.numeric(var_in))
  num_nas<-is.na(var_out)

  nans<-setdiff(which(num_nas), which(nas))
  if(length(nans)>0) {
    if(par=='NA') {
      #do nothing. NAs already inserted
    } else if (par=='') {
      var_in[nans]
      browser() #There are some non-numeric cases.
    } else {
      #      browser()
      labs<-danesurowe::GetLevels(out_dt[[out_colnames]], flag_include_NA = TRUE)
      if(par %in% names(labs)) {
        var_out[num_nas]<-labs[par]
      } else {
        browser() #"Unkown NA level par"
      }
    }
  }
  var_target<-out_dt[[out_colnames]]

  var_out<-danesurowe::copy_obj_attributes(obj_source = var_target, obj_dest = var_out)
  out_dt[,(out_colnames):=var_out]

  return(out_dt)
}

Date_by_serial<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  if(length(in_colnames)>1) {
    browser()
  }
  if(length(out_colnames)>1) {
    browser()
  }

  var_target<-out_dt[[out_colnames]]
  var_out<-as.Date(in_dt[[in_colnames]], origin = "1899-12-30")
  var_out<-danesurowe::copy_obj_attributes(obj_source = var_target, obj_dest = var_out)
  out_dt[,(out_colnames):=var_out]

  return(out_dt)

}
