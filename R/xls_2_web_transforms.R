children<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
  out_dt
}

pattern_of_spreading<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  #Do nothing
#  browser()
  vals<-as.character(in_dt[[in_colnames]])
  sufixes<-stringr::str_sub(vals, nchar(vals))
  prefixes<-stringr::str_sub(vals, 1, nchar(vals)-1)
  dict<-c('1', '2', '2a', '2b', '3', '3a', '3b', '4', '4a', '4b', '5', '5a', '5b', '6', '7', '8', '9')
  #1="1>";2="1/";3="2>";4="2/";5="2a>";6="2a/";7="2b>";8="2b/";9="3>";10="3/";11="3a>";
  #12="3a/";13="3b>";14="3b/";15="4>";16="4/";17="4a>";18="4a/";19="4b>";20="4b/";21="5>";
  #22="5/";23="5a>";24="5a/";25="5b>";26="5b/";27="6>";28="6/";29="7>";30="7/";31="8>";32="8/";33="9>";34="9/"
  valr<-map_int(prefixes, function(prefix) {
    pos<-which(dict %in% prefix)
    if(length(pos)==0) {
      return(NA_integer_)
    } else {
      pos
    }
  })
  if(length(out_colnames)==1) {
    out_col_r=out_colnames
    out_col_t=NA
  } else {
    out_col_r=out_colnames[[1]]
    out_col_t=out_colnames[[2]]
  }
  if(!is.na(out_col_r)) {
    v<-out_dt[[out_col_r]]
    attributes(valr)<-attributes(v)
    out_dt[,(out_col_r):=valr]
  }
  if(!is.na(out_col_t)) {
    valr<-as.integer(factor(sufixes))
    v<-out_dt[[out_col_t]]
    attributes(valr)<-attributes(v)
    out_dt[,(out_col_r):=valr]
  }
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

all_units=list(
  'µkat/l'=list(
    'U/l'=list(inref=16.67*10^(-9),
               synonims=c('U/L')),
    'µmol/l·s'=list(inref=1,
                    synonims=c('µmol/l*s', 'ukat/l' ))
  ),
  'mg/dl'=list(
    'mg/dl'=list(inref=1, synonims=character(0))))

get_units_conv<-function(all_units) {
  df=tibble(ref_unit=character(0), synonim=character(0), syninref=character(0))
  all_units
}

units<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  units_col<-out_colnames[[length(out_colnames)]]
  expected_units<-names(danesurowe::GetLevels(out_dt[[units_col]], flag_recalculate = FALSE))
  units_col<-in_colnames[[length(in_colnames)]]

  encountered_units<-unique(in_dt[[units_col]])

  conv<-list(

  )

  dict<-list(
    'U/L'=list(unit='U/l', factor=1),

  )

  browser()
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
