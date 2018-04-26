children<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  #Do nothing
  out_dt
}

pattern_of_spreading<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  #Do nothing
  #browser()
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

multiple_variants<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  #Do nothing
  out_dt
}

to_report<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  #Do nothing
  out_dt
}


manual_text<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  #Do nothing
  out_dt
}


disease_in_family<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  #Do nothing
  out_dt
}

disease_in_family_other<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  #Do nothing
  out_dt
}

famlily_death<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  #Do nothing
  out_dt
}

birth_order<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  #Do nothing
  out_dt
}

sport_activity<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
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

units<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  #par - oddzielne średnikiem zamiany jednych jednostek na inne, zupełnie jak przy rekodowaniu, ale ze stringami
  if(!is.na(par)) {
    konwersje<-stringr::str_split(par, pattern=';')[[1]]
    konwersje<-stringr::str_split(konwersje, pattern='->', n=2)
    konwersje<-objectstorage::lists_to_df(konwersje)
    names(konwersje)<-c('from', 'to')
  } else {
    konwersje<-tibble(from=character(0), to=character(0))
    browser()
  }

  units_col<-out_colnames[[length(out_colnames)]]
  expected_units<-names(danesurowe::GetLevels(out_dt[[units_col]], flag_recalculate = FALSE))
  units_col<-in_colnames[[length(in_colnames)]]
#  base_units<-c('1', 'U', 'l', 's', 'kat', 'mol', 'g')
#  prefixes<-c('µ', 'm', 'k', '')

  # parse_units<-function(units) {
  #   divs<-stringr::str_split(units, '/')
  #   lns<-purrr::map_int(divs, length)
  #   divs[lns>2]<-"ERR"
  #   divs<-objectstorage::lists_to_df(divs)
  #   mults1<-stringr::str_split(divs[[1]], '·')
  #   mults2<-stringr::str_split(divs[[2]], '·')
  #   mults1<-objectstorage::lists_to_df(mults1)
  #   mults2<-objectstorage::lists_to_df(mults2)
  #   parse_units<-function(u, colname){
  #     if(is.na(u)) {
  #       ans<-list(unit=NA_character_, prefix=NA_character_)
  #     } else {
  #       var<-which(purrr::map_lgl(base_units, ~stringr::str_detect(u, pattern=paste0('^[', paste0(prefixes, collapse=''), ']?', ., '$'))))
  #       if(length(var)>1) {
  #         browser()
  #       }
  #       if(length(var)==0) {
  #         ans<-list(unit='ERR', prefix='ERR')
  #       } else {
  #         unit_str<-base_units[[var]]
  #         prefix<-stringr::str_sub(u, start = 1, end = nchar(u)-nchar(unit_str))
  #         ans<-list(unit=unit_str, prefix=prefix)
  #       }
  #     }
  #     df<-as_tibble(list(ans=list(ans)))
  #     names(df)<-colname
  #     return(df)
  #   }
  #   units_df<-purrr::map_dfr(mults1[[1]], parse_units, colname='mults1_1')
  #
  #   for(i in setdiff(seq_len(ncol(mults1)),1)) {
  #     df<-purrr::map_dfr(mults1[[i]], parse_units, colname=paste0('mults1_', i))
  #     units_df<-cbind(units_df, df)
  #   }
  #   for(i in seq_len(ncol(mults2))) {
  #     df<-purrr::map_dfr(mults2[[i]], parse_units, colname=paste0('mults2_', i))
  #     units_df<-cbind(units_df, df)
  #   }
  #   return(unists_df)
  #   # cbind(,
  #   #
  #   # purrr::map_dfr(base_units, ~tmpfn(m=mults2[[2]], b=., colname='mults2')))
  # }

  encountered_units<-unique(in_dt[[units_col]])
  konwersje<-as_tibble(rbind(konwersje, tibble(from='NA', to=NA)))

  not_matched<-setdiff(encountered_units, c(NA, expected_units, konwersje$from))
  if(any(stringr::str_detect(not_matched, pattern = stringr::fixed("*")))) {
    str_from<-not_matched[which(stringr::str_detect(not_matched, pattern = stringr::fixed("*"))),drop=FALSE]
    str_to<-stringr::str_replace(str_from, pattern=stringr::fixed("*"), replacement="·")
    konwersje<-as_tibble(rbind(konwersje, tibble(from=str_from, to=str_to)))
  }
  not_matched<-setdiff(encountered_units, c(NA, expected_units, konwersje$from))
  units_vect<-in_dt[[units_col]]

  for(bad_unit in not_matched) {
    bad_units_rows<-which(units_vect == bad_unit)
    reportClass$add_element(type = 'units', case = bad_units_rows, var = in_colnames[[4]], par1 = bad_unit)
    rows<-which(in_dt[[units_col]]==bad_unit)
    data.table::set(out_dt, i =  rows, j = out_colnames[[1]], value = NA)
    data.table::set(out_dt, i =  rows, j = out_colnames[[2]], value = NA)
    data.table::set(out_dt, i =  rows, j = out_colnames[[3]], value = NA)
    data.table::set(out_dt, i =  rows, j = out_colnames[[4]], value = NA)
  }
  encountered_units<-setdiff(encountered_units, NA)


  for(good_unit in setdiff(encountered_units, not_matched)) {
    pos<-which(konwersje$from==good_unit)
    if(length(pos)>0) {
      into_unit<-konwersje$to[[pos]]
    } else {
      into_unit<-good_unit
    }
    rows<-which(in_dt[[units_col]]==into_unit)
    data.table::set(out_dt, i =  rows, j = out_colnames[[4]], value = into_unit)
    in_value<-in_dt[[in_colnames[[1]] ]][rows]
    out_value<-conv_to_numeric(var_in =in_value, var_name = in_colnames[[1]], reportClass = reportClass,
                               type = 'units_value', additional_nas = c('NF', 'NR', 'NA'))
    data.table::set(out_dt, i =  rows, j = out_colnames[[1]], value = out_value)

    in_value<-in_dt[[in_colnames[[2]] ]][rows]
    out_value<-conv_to_numeric(var_in =in_value, var_name = in_colnames[[2]], reportClass = reportClass,
                               type = 'units_upper', additional_nas = c('NF', 'NR', 'NA'))
    data.table::set(out_dt, i =  rows, j = out_colnames[[2]], value = out_value)

    in_value<-in_dt[[in_colnames[[3]] ]][rows]
    out_value<-conv_to_numeric(var_in =in_value, var_name = in_colnames[[3]], reportClass = reportClass,
                               type = 'units_lower', additional_nas = c('NF', 'NR', 'NA'))
    data.table::set(out_dt, i =  rows, j = out_colnames[[3]], value = out_value)

  }
  NULL
  return(out_dt)
}

manual_factor<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  #Do nothing
  out_dt
}

specialist<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  #Do nothing
  out_dt
}

to_factor<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug) {
  browser()
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

to_integer<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
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
  num_nint[is.na(num_nint)]<-FALSE
  if(sum(num_nint)>0) {
    browser()
    which_nint<-which(num_nint)
    for(i in seq_along(which_nint)) {
      reportClass$add_element(type = 'to_integer', case = which_nint[[i]], var = in_colnames)
    }
  }

  nans<-setdiff(which(num_nas), which(nas))
  if(length(nans)>0) {
    browser()
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

conv_to_numeric<-function(var_in, var_name, reportClass, type, additional_nas=character(0)) {
  if(length(additional_nas)>0) {
    additional_nas<-stringr::str_split(additional_nas, pattern=stringr::fixed(";"))[[1]]
  }
#  additional_nas<-c('NA', additional_nas)
  where_repl<-stringr::str_detect(var_in, stringr::regex('^-?\\d*,\\d*$'))
  where_repl[is.na(where_repl)]<-FALSE
  if(sum(where_repl)>0) {
    var_in[where_repl]<-stringr::str_replace(var_in[where_repl], pattern = stringr::fixed(','), replacement = '.')
  }
  nas<-is.na(var_in)

  var_out<-suppressWarnings(as.numeric(var_in))
  num_nas<-is.na(var_out)

  nans<-setdiff(which(num_nas), which(nas))
  unique_nans<-unique(nans)
  for(unique_nan in unique_nans) {
    if(!unique_nan %in% additional_nas) {
      reportClass$add_element(type = type, case = which(var_in == unique_nan), var = var_name, par1 = unique_nan )
    }
  }
  return(var_out)
}

to_numeric<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  # if(out_colnames=='q_51_1.rate') {
  #   browser()
  # }
  if(is.na(par)){
    par<-character(0)
  }
  if(length(in_colnames)>1) {
    browser()
  }
  if(length(out_colnames)>1) {
    browser()
  }
  var_in<-in_dt[[in_colnames]]
  var_out<-conv_to_numeric(var_in = var_in, var_name = in_colnames, reportClass = reportClass, type = 'to_numeric', additional_nas = par)

  var_target<-out_dt[[out_colnames]]

  var_out<-danesurowe::copy_obj_attributes(obj_source = var_target, obj_dest = var_out)
  out_dt[,(out_colnames):=var_out]
  return(out_dt)
}

Date_by_serial<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  if(length(in_colnames)>1) {
    browser()
  }
  if(length(out_colnames)>1) {
    browser()
  }
  if(is.na(par)) {
    par="1936-2019"
  }
  range<-as.numeric(stringr::str_split(par, pattern="-")[[1]])
#  browser()


  var_target<-out_dt[[out_colnames]]
  var_num<-conv_to_numeric(var_in = in_dt[[in_colnames]], var_name = in_colnames, type = 'Date_by_serial_numeric', reportClass = reportClass)
  low_range<-which(var_num>=range[[1]] & var_num<=range[[2]])
  high_range<-setdiff(seq_along(var_target), c(low_range, which(is.na(var_num))))
  low_range_int<-low_range[var_num[low_range]%%1==0]
  low_range_frac<-setdiff(low_range, low_range_int)

  var_target[low_range_frac]<-as.Date(lubridate::date_decimal(var_num[low_range_frac]))
  var_target[low_range_int]<-as.Date(lubridate::date_decimal(var_num[low_range_int]+0.5))
  var_high_range<-as.Date(var_num[high_range], origin = "1899-12-30")
  bad_dates<-lubridate::decimal_date(var_high_range)
  bad_dates<-high_range[which(bad_dates<range[[1]] | bad_dates>range[[2]])]
  reportClass$add_element(type = "Date_by_serial_range", case = bad_dates, var = in_colnames)
  var_target[high_range]<-var_high_range
  var_target[bad_dates]<-NA

  out_dt[,(out_colnames):=var_target]

  return(out_dt)

}
