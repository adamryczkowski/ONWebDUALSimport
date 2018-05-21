children<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  vals<-as.character(in_dt[[in_colnames]])
  vals[vals=='No']<-0
  vals_out<-conv_to_numeric(var_in = vals, var_name = in_colnames, reportClass = reportClass, type='children_numeric', additional_nas='NA')

  vals_out<-upper_bound_numeric(var_in = vals_out, var_name = in_colnames, reportClass = reportClass, type = 'children_upper_bound', upper_bound = 20)

  attributes(vals_out)<-attributes(out_dt[[out_colnames]])
  out_dt[,(out_colnames):=vals_out]
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
  if(length(out_colnames)==1) {
    browser()
  }
  levels<-danesurowe::GetLevels(out_dt[[out_colnames[[1]] ]], flag_recalculate = FALSE)

  for(in_colname in in_colnames) {
    val_in<-as.integer(in_dt[[in_colname]])
    levs<-seq(min(val_in, na.rm=TRUE), max(val_in, na.rm = TRUE))
    if(length(levs)>length(out_colnames)) {
      browser() #Too many levels
    }
    for(i in seq_along(levs)) {
      outval<-out_dt[[out_colnames[[i]] ]]
      lev<-levs[[i]]
      if('factor' %in% class(outval)) {
        new_levels<-danesurowe::GetLevels(outval, flag_recalculate = FALSE)
        assertthat::are_equal(levels, new_levels)
        outval[val_in==lev]<-names(levels)[[2]]
        outval[val_in!=lev & is.na(outval)]<-names(levels)[[1]]
        out_dt[,(out_colnames[[i]]):=outval]
      } else {
        browser()
      }
    }
  }

  out_dt
}

to_report<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  for(in_colname in in_colnames) {
    in_val<-as.character(in_dt[[in_colname]])
    reportClass$add_element(type = 'to_report', case = which(is.na(in_val)), var = in_colname)
  }
  #Do nothing
  out_dt
}

parse_list_as_list<-function(pars_in) {
  values<-list()
  for(i in seq_along(pars_in)) {
    value<-names(pars_in)[[i]]
    flag_report<-FALSE
    if(stringr::str_sub(value,1,1)=='!') {
      value<-stringr::str_sub(value,2)
      flag_report<-TRUE
    }
    values<-c(values, setNames(rep(list(list(value, flag_report)), length(pars_in[[i]])), pars_in[[i]]))
  }
  return(values)
}


parse_char_as_list<-function(pars_in) {
  pars<-stringr::str_split(pars_in, pattern=stringr::fixed(";"))[[1]]
  keys<-character(length(pars))
  values<-rep(list(list()),length(pars))
  for(i in seq_along(pars)) {
    par<-pars[[i]]
    m<-stringr::str_match(par, pattern=stringr::regex('^(.*)->(.*)$'))
    if(length(m)!=3) {
      browser()
    }
    key<-m[[2]]
    value<-m[[3]]
    flag_report<-FALSE
    if(stringr::str_sub(value,1,1)=='!') {
      value<-stringr::str_sub(value,2)
      flag_report<-TRUE
    }
    if(value=='NA' || value=='') {
      value<-NA
    }
    keys[[i]]<-key
    values[[i]]<-list(value, flag_report)
  }
  ans<-setNames(values,keys)
  return(ans)
}

manual_text<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass, type='manual_text') {
#  browser()
  if(length(in_colnames)>1) {
    browser()
  }
  if(length(out_colnames)>1) {
    browser()
  }
  #browser()
  in_val<-in_dt[[in_colnames]]
  out_val<-out_dt[[out_colnames]]

#  if(in_colnames=='q_153') browser()
  if(!is.na(par)) {
    par_l<-parse_char_as_list(par)
  } else {
    par_l<-list()
  }

  ans<-convert_manual_text(in_char=in_val, colname=in_colnames, out_factor=out_val, factor_dict=par_l, reportClass, type=type)
  out_val<-ans$var
  not_matched<-ans$not_matched

  for(m in not_matched) {
 #   browser()
    which_cases<-which(stringr::str_detect(in_val, stringr::fixed(m, ignore_case = TRUE)))
    reportClass$add_element(type=type, case=which_cases, var = in_colnames)
  }


  data.table::set(out_dt,NULL,out_colnames, out_val)
  out_dt
}

#Converts set of input columns into an equivalent but different format that mimics a nested table in relation one-to-many.
#
#Suppose the nested table has 7 rows with id A, B, C, D, E, F and G and two columns: Value1 and Value2.
#
#in_colnames_one_cat_array:
#Value1_A Value1_B  Value1_C Value1_D
#Value2_A Value2_B  Value2_C Value2_D
#
#in_colnames_other_cat:
#Cat1 Cat2
#
#in_colnames_value_array:
#Value1_Cat1 Value1_Cat2
#Value2_Cat1 Value2_Cat2
#
#out_factor is a character vector: LETTERS[1:7]
#
#Nested table doesn't have to have any value columns. In this case existance will be preserved.
#
#This function assumes there are no values in the nested table. Only existence.
convert_wide_to_narrow_simple<-function(in_dt, in_colnames_one_cat, in_colnames_one_cat_factor, in_colnames_other_cat=character(0),
                                        out_dt=NULL, out_factor, out_colnames, reportClass, cat_dup_type='wide2narrow', bad_cat_type='bad_category',
                                        factor_dic=list()) {
  # in_dt=data.table::data.table(Value_B=c(0,0,0,1,0,1,1,1,0,0,0,0), Value_A1=c(1,1,1,1, 1,1,1,1, 1,1,1,1), Value_A2=c(0,1,0,0, NA,NA,NA,NA, NA,NA,NA,NA),
  #                              Other1=c(1,NA,NA,NA, 2,NA,NA,NA, 3,3,1,2), Other2=c(NA,1,NA,NA, 2,NA,NA,NA, 1,2,3,4))
  # in_colnames_one_cat<-c('Value_B', 'Value_A1', 'Value_A2')
  # in_colnames_one_cat_factor<-c('B', 'A', 'A')
  # in_colnames_other_cat<-c('Other1', 'Other2')
  # out_factor=LETTERS[1:5]
  # out_colnames=as.character(t(matrix(c(paste0('OutCat', 1:5), paste0('OutVal', 1:5)), c(5,2))))
  #
  # reportClass<-ReportClass$new()
  # cat_dup_type<-'wide2narrow'


  checkmate::assertClass(in_dt, 'data.frame')

  checkmate::assertCharacter(in_colnames_one_cat)
  checkmate::assertSubset(in_colnames_one_cat, colnames(in_dt))

  checkmate::assertCharacter(in_colnames_other_cat)
  checkmate::assertSubset(in_colnames_other_cat, colnames(in_dt))

  #checkmate::assertCharacter(in_colnames_one_cat_factor, unique=TRUE)
  checkmate::assertTRUE(length(in_colnames_one_cat)==length(in_colnames_one_cat_factor))

  checkmate::assertCharacter(out_factor, unique = TRUE)
  checkmate::assertSubset(in_colnames_one_cat_factor, out_factor)

  checkmate::assertCharacter(out_colnames)
  if(length(out_factor)!=length(out_colnames)) {
    #checkmate::assertTRUE(2*length(out_factor)==length(out_colnames))

    out_colnames<-matrix(out_colnames, c(2,length(out_colnames)/2))
    out_valnames<-out_colnames[2,]
    out_colnames<-out_colnames[1,]
  } else {
    out_valnames<-character(0)
  }


  #Initialize the database. First we initialize with the wide format, with a dedicated column to each level
  out_dt_tmp<-data.table::data.table(.to.delete=seq_len(nrow(in_dt)))
  out_dt_tmp[,(paste0('var_',out_factor)):=0L]
  data.table::set(out_dt_tmp, NULL, '.to.delete',NULL)

  #First we fill all the dedicated factors
  for(i in seq_along(unique(in_colnames_one_cat_factor))) {
    one_factor<-in_colnames_one_cat_factor[[i]]
    one_cat_factor_poses<-which(in_colnames_one_cat_factor == one_factor)
    out_pos<-which(one_factor == out_factor)
    out_var<-paste0('var_', one_factor)
    val_var<-na.replace(out_dt_tmp[[out_var]])
    for(one_cat_factor_pos in one_cat_factor_poses) {
      one_cat_colname<-in_colnames_one_cat[[one_cat_factor_pos]]
      one_cat_factor<-in_colnames_one_cat_factor[[one_cat_factor_pos]]
      in_val<-in_dt[[one_cat_colname]]
      if('factor' %in% class(in_val)) {
        flevels<-danesurowe::GetLevels(in_val, flag_recalculate = FALSE)
        if(length(intersect(c('Yes', 'No'), names(flevels)))==2) {
          tmp<-integer(nrow(in_dt))
          tmp[in_val=='Yes']<-1
        } else {
          browser()
        }
        in_val<-tmp
      }
      val_var<-na.replace(in_val) + val_var
      data.table::set(out_dt_tmp,NULL, out_var, val_var)
    }
  }

  #Then we fill all the "other" columns
  for(i in seq_along(in_colnames_other_cat)) {
#    cat(paste0('i=', i, '\n'))
    in_colname<-in_colnames_other_cat[[i]]
    many_factors<-in_dt[[in_colname]]
    if('numeric' %in% class(many_factors) || 'integer' %in% class(many_factors) ) {
      many_factors<-factor(many_factors, levels=seq_along(out_factor), labels=out_factor)
    }
    many_factors<-as.character(many_factors)
    err_records<-which(many_factors %in% in_colnames_one_cat_factor )
    #Each element of err_records points to a case, when a duplicate entry exists in the dedicated columns part of the dt
    for(err_record in err_records) {
      one_factor<-many_factors[[err_record]]
      one_cat_factor_poses<-which(in_colnames_one_cat_factor == one_factor)
      for(one_cat_factor_pos in one_cat_factor_poses) {
        dup_column<-in_colnames_one_cat[[one_cat_factor_pos]]
        reportClass$add_element(type = cat_dup_type, case = err_record, var = in_colname, par1 = dup_column)
      }
    }
    many_factors[err_records]<-NA_character_
    many_factors[many_factors=='NA']<-NA_character_
    non_empties<-which(!is.na(many_factors))
    for(non_empty_row in non_empties) {
#      if(i==3 && non_empty_row==606) browser()
#      cat(paste0('non_empty_nr=',non_empty_row, '\n'))
      value=1L
      one_factor<-many_factors[[non_empty_row]]
      one_cat_factor_pos<-which(tolower(out_factor) == tolower(one_factor))
      if(length(one_cat_factor_pos)==0) {
        if(one_factor=='five aunts') {
          value=5L
        }
        translated_name<-factor_dic[tolower(one_factor)]
        if(is.null(translated_name[[1]])) {
          browser()
          one_cat_factor_pos<-NA
        } else if (is.na(translated_name[[1]])) {
          one_cat_factor_pos<-NA
        } else if ( translated_name[[1]]=='!') {
          reportClass$add_element(type = bad_cat_type, case = non_empty_row, var = in_colname, par1=NA)
          one_cat_factor_pos<-NA
        } else {
          one_cat_factor_pos<-which(tolower(out_factor) == tolower(translated_name[[1]]))
        }
      }
      if(length(one_cat_factor_pos)==0) browser()
      if(!is.na(one_cat_factor_pos)) {
        one_factor<-out_factor[[one_cat_factor_pos]]
        target_column<-paste0('var_', one_factor)

        if(out_dt_tmp[[target_column]][[non_empty_row]]==1) {
          reportClass$add_element(type = cat_dup_type, case = non_empty_row, var = in_colname)
        } else {
          data.table::set(out_dt_tmp, non_empty_row, target_column, value)
        }
      }
    }
  }
  #Now it is a time to convert this wide format into a narrow
  colnames(out_dt_tmp)<-out_factor
  out_dt_tmp<-data.matrix(out_dt_tmp)
  out_dt_list<-plyr::alply(out_dt_tmp, 1, function(x) which(x>0))

  out_dt_tmp<-data.table::data.table(.to.delete=seq_len(nrow(in_dt)))
  if(length(out_valnames)==0) {
    out_dt_tmp[,(out_colnames):=factor(rep(NA, nrow(in_dt)), levels = out_factor)]
  } else {
    for(i in seq_along(out_colnames)) {
      out_dt_tmp[,(out_colnames[[i]]):=factor(rep(NA, nrow(in_dt)), levels = out_factor)]
      out_dt_tmp[,(out_valnames[[i]]):=0L]
    }
  }
  data.table::set(out_dt_tmp, NULL, '.to.delete',NULL)

  for(rownr in as.integer(seq_along(out_dt_list))) {
    l<-out_dt_list[[rownr]]
    for(col_nr in as.integer(seq_along(l))) {
      factor_id<-names(l)[[col_nr]]
      factor_nr<-which(out_factor==factor_id)
      data.table::set(out_dt_tmp, rownr, out_colnames[[col_nr]], factor_id)
      if(length(out_valnames)==0) {
        if(l[[col_nr]]>1) {
          reportClass$add_element(type = cat_dup_type, case = rownr)
        }
      } else {
        data.table::set(out_dt_tmp, rownr, out_valnames[[col_nr]], l[[col_nr]])
      }
    }
  }

  for(cn in colnames(out_dt_tmp)) {
    v<-out_dt[[cn]]
    set(out_dt, NULL, cn, out_dt_tmp[[cn]])
    out_dt<-danesurowe::copy_var_attributes(v, cn, out_dt)
  }
  return(out_dt)
}

convert_wide_to_narrow<-function(in_dt, in_colnames_one_cat_array, in_colnames_other_cat=character(0), in_colnames_value_array=character(0), out_factor) {
  checkmate::assertClass(in_dt, 'data.frame')

  checkmate::assertCharacter(in_colnames_one_cat_array)
  checkmate::assertSubset(in_colnames_one_cat_array, colnames(in_dt))

  checkmate::assertCharacter(in_colnames_other_cat)
  checkmate::assertSubset(in_colnames_other_cat, colnames(in_dt))

  checkmate::assertCharacter(in_colnames_value_array)
  checkmate::assertSubset(in_colnames_value_array, colnames(in_dt))
  if(is.null(dim(in_colnames_one_cat_array))) {
    dim(in_colnames_one_cat_array)<-c(1,length(in_colnames_one_cat_array))
  }

  if(nrow(in_colnames_one_cat_array)>1) {
    flag_has_values=TRUE
  } else {
    flag_has_values=FALSE
  }

  checkmate::assertCharacter(out_factor)
  checkmate::assertTRUE(ncol(in_colnames_one_cat_array)==length(out_factor))

}

convert_specialist<-function(in_char, colname, out_factor, reportClass, type, flag_return_other=FALSE, other_char=NULL) {
  pars<-list('General Practitioner'=c('GP','general practicioner','general pracitioner','general and familiar medicine (gp)',
                                      'general practioner', 'general practicer', 'practitioner', 'family doctor', 'PRACTİTİONER',
                                      'general parctitioner'),
             '!'=c('ftr','lor','41913', '42036', 'clinic','first','second','mhh','hospital','university hostpital desden','yes', 'NA Y', 'Y',
                   '42248','1','ENO N'),
             'NA'=c('nf','no', 'N', 'no other','no diagnosis till consultation'),
             'Cardiologist'=c('kardiologist'),
             'Ear-Nose-Throat Doctor (ENT)'=c('ent','phoniatrist/ent','ear nose troat doctor','ear-nose-throat-doctor','ent-doctor',
                                              'ear-nose-troat-doctor','otorhinolaryngology (ent)', 'otolarygologist','Ear Nose Troat Doctor clinic'),
             '!Ear-Nose-Throat Doctor (ENT)'=c('laryngologist','phoniater,no','otolaryngologist'),
             'General surgeon'=c('surgeon'),
             '!General surgeon'=c('vascular surgeon','surgeon /ent'),
             'Internal Medicine'=c('internal medicen','internal medixcine','interna medicine', 'İnternal medicine','İnterna medicine',
                                   'İnternal medixcine','Internal c N','internist'),
             'Neurosurgeon'=c('neurosurgen','neurosurgery'),
             'Neurologist'=c('neurology', 'neruology', 'second neurologist','neurologist clinic','neurologist (hospital)','first neurology',
                             'first neurologist','neurologisy','neruologist','neurlogist','neurologist (clinic)','neurologist/N',
                             'neurologist c','second neurology','neurologist in clinic','neurologist 8th specialist', 'NEUROLOGİST',
                             'thrid neurology','third neurologist','third neurology','secod neurology','hospital (neurology)','2.neurology',
                             'neurologist Y 2015-04-01','neurologist','fourth neurology','2. neurology'),
             'Orthopaedist'=c('ortopedist', 'orthopadist', 'orthopedic surgeon','orthopedist hospital','orthopediest','ortopaedist',
                              'orthopedist','orthopedic','ortophedist', 'ORTOPEDİST','orthopaedic surgeon','orthopaedist','orthopeadist'),
             'Pneumologist'=c('pneumolog','PNEUMOLOGİST'),
             '!Pneumologist'=c('pulmonologist'),
             'Psychiatrist'=c('physiatrist','pm&r (physiatrist)','pm&r'),
             'Rehabilitation specialist'=c('rehabilitation','physical medicine and rehabilitation'),
             'Rheumatologist'=c('rheumathologist','reumathologist','reumatologist','Rheumatolpgist'))
  others<-list('!Other'=c('physiotherayist','dentist','hematologist','psychologist','orthodontist','gastroenterologist','convalescent home',
                          'doctor physiotherapist','endocrinologist'))
  if(flag_return_other) {
    if(is.null(other_char)) {
      other_char<-rep(NA_character_,length(out_factor))
    }
    other_l<-setNames(others[[1]],others[[1]])
  } else {
    pars<-c(pars, others)
    others<-list()
  }
  par_l<-parse_list_as_list(pars)
  #  par_l<-parse_char_as_list(pars)
  ans<-convert_manual_text(in_char=in_char, colname=colname, out_factor=out_factor, factor_dict=par_l, reportClass=reportClass, type=type,
                           str_regex_suffix = '([, /]+((no?)|(y(es)?)))?', str_regex_prefix='[\r\n ]*')
  not_matched<-ans$not_matched
  out<-ans$var
  if(flag_return_other) {
    ans<-identify_patterns(patterns_dic=other_l, invar=in_char, invar_uniques=not_matched, invar_labels=character(0),
                           outvar=other_char,
                           reportClass=reportClass, type=type, colname=colname,
                           str_regex_prefix='[\r\n ]*', str_regex_suffix='([, ]+((no?)|(y(es)?)))?')
    not_matched<-ans$not_matched
    other_char<-ans$var
  }
  for(m in not_matched) {
    browser()
    which_cases<-stringr::str_detect(in_char, stringr::fixed(m, ignore_case = TRUE))
    reportClass$add_element(type=type, case=which_cases, var = colname)
  }
  if(flag_return_other) {
    return(list(factor_out=out, other_out=other_char))
  } else {
    return(out)
  }
}

#Function that takes character vector, empty factor and optionally dictionary of substutitions to convert a character string into a factor.
#Values "NA" are converted into a NA silently
convert_manual_text_old<-function(in_char, colname, out_factor, factor_dict=list(), reportClass, type, str_regex_suffix='', str_regex_prefix='', others=list()) {
  #  browser()
  #  if(colname=='q_153') browser()
  #if(colname=='q_99.1a') browser()


  in_char[in_char=='NA']<-NA
  input_uniques<-setdiff(unique(in_char), NA)
  if(str_regex_suffix=='') {
    dict_patterns<-stringr::regex(paste0('^', names(factor_dict), '$'), ignore_case = TRUE)
  } else {
    dict_patterns<-stringr::regex(paste0('^', str_regex_prefix, names(factor_dict), str_regex_suffix, '$'), ignore_case = TRUE)
  }
  #browser()

  if('factor' %in% class(out_factor)) {
    labels<-names(danesurowe::GetLevels(out_factor, flag_recalculate = FALSE))
    label_patterns<-stringr::regex(paste0('^',str_regex_prefix, tolower(labels), str_regex_suffix, '$'), ignore_case = TRUE)
    iu_matches<-purrr::map_lgl(input_uniques,~sum(stringr::str_detect(., label_patterns))>0)
    iu_matched<-input_uniques[iu_matches]
    not_matched<-input_uniques[!iu_matches]

    for(ium in iu_matched) {
      which_pattern<-which(stringr::str_detect(ium, label_patterns))
      if(length(which_pattern)!=1) {
        browser()
      }
      pattern<-label_patterns[[which_pattern]]
      attributes(pattern)<-attributes(label_patterns)
      which_cases<-na.replace(stringr::str_detect(in_char, pattern), FALSE)
      out_factor[which_cases]<-labels[[which_pattern]]
    }

    iu_matches<-purrr::map_lgl(not_matched,~sum(stringr::str_detect(., dict_patterns))>0)
    iu_matched<-not_matched[iu_matches]
    not_matched<-not_matched[!iu_matches]

    for(ium in iu_matched) {
      #      if(ium=='neruology,No') browser()
      #      if(ium=='\r\npsychiatrist N') browser()
      which_pattern<-which(stringr::str_detect(ium, dict_patterns))
      if(length(which_pattern)!=1) {
        browser()
      }
      pattern<-dict_patterns[[which_pattern]]
      attributes(pattern)<-attributes(label_patterns)
      which_cases<-which(na.replace(stringr::str_detect(in_char, pattern), FALSE))

      matched_label<-factor_dict[[which_pattern]][[1]]
      if(is.na(matched_label)) {
        matched_label<-''
      }
      if(matched_label=='NA') {
        matched_label<-''
      }
      flag_report<-factor_dict[[which_pattern]][[2]]
      if(matched_label!='') {
        which_label<-which(stringr::str_detect(matched_label, stringr::fixed(labels, ignore_case = TRUE)))
        if(length(which_label)!=1) {
          browser()
        }
        out_factor[which_cases]<-labels[[which_label]]
      } else {
        out_factor[which_cases]<-NA
      }

      if(flag_report) {
        reportClass$add_element(type=type, case=which_cases, var = colname)
      }

    }
    for(m in not_matched) {
      browser()
      which_cases<-stringr::str_detect(in_char, stringr::fixed(m, ignore_case = TRUE))
      reportClass$add_element(type=type, case=which_cases, var = colname)
    }
  } else {
    broswer()
  }
  return(out_factor)
}
#Function that takes character vector, empty factor and optionally dictionary of substutitions to convert a character string into a factor.
#Values "NA" are converted into a NA silently
convert_manual_text<-function(in_char, colname, out_factor, factor_dict=list(), reportClass, type, str_regex_suffix='', str_regex_prefix='') {
  in_char[in_char=='NA']<-NA
  input_uniques<-setdiff(unique(in_char), NA)
  dict_patterns<-names(factor_dict)



  if('factor' %in% class(out_factor)) {
    labels<-names(danesurowe::GetLevels(out_factor, flag_recalculate = FALSE))
    labels_list<-setNames(as.list(labels), labels)

    ans<-identify_patterns(patterns_dic=labels_list, invar=in_char, invar_uniques=input_uniques, invar_labels=labels,
                           outvar=out_factor,
                           reportClass=reportClass, type=type, colname=colname,
                           str_regex_prefix=str_regex_prefix, str_regex_suffix=str_regex_suffix)
    out_factor<-ans$var
    not_matched<-ans$not_matched

    if(length(factor_dict)>0) {
      ans<-identify_patterns(patterns_dic=factor_dict, invar=in_char, invar_uniques=not_matched, invar_labels=labels,
                             outvar=out_factor,
                             reportClass=reportClass, type=type, colname=colname,
                             str_regex_prefix=str_regex_prefix, str_regex_suffix=str_regex_suffix)
      out_factor<-ans$var
      not_matched<-ans$not_matched
    }
  } else {
    broswer()
  }
  return(list(var=out_factor, not_matched=not_matched))
}

#Performs replacement on invar using the patterns_dic and outputs them onto the outvar, returning it. Replacements that starts with '!' are reported.
#patterns_dic has a format: pattern -> replcement.
#If outvar is a factor, all replacements must be an existing level
identify_patterns<-function(patterns_dic, invar, invar_uniques, invar_labels, outvar, reportClass, type, colname, str_regex_prefix='', str_regex_suffix='') {
  patterns<-stringr::regex(paste0('^',str_regex_prefix, stringr::str_replace_all(names(patterns_dic), "(\\W)", "\\\\\\1"), str_regex_suffix, '$'), ignore_case = TRUE)
  iu_matches<-purrr::map_lgl(invar_uniques,~sum(stringr::str_detect(., patterns))>0)
  iu_matched<-invar_uniques[iu_matches]
  not_matched<-invar_uniques[!iu_matches]
  invar_labels_patterns<-paste0('^',str_regex_prefix, stringr::str_replace_all(invar_labels, "(\\W)", "\\\\\\1"),str_regex_suffix,'$')

  for(ium in iu_matched) {
    #      if(ium=='neruology,No') browser()
    #      if(ium=='\r\npsychiatrist N') browser()
    which_pattern<-which(stringr::str_detect(ium, patterns))
    if(length(which_pattern)!=1) {
      browser()
    }
    pattern<-patterns[[which_pattern]]
    attributes(pattern)<-attributes(patterns)
    which_cases<-which(na.replace(stringr::str_detect(invar, pattern), FALSE))

    tmp<-patterns_dic[[which_pattern]]
    if(length(tmp)==2) {
      matched_label<-tmp[[1]]
      flag_report<-tmp[[2]]
    } else {
      matched_label<-tmp
      flag_report<-FALSE
    }
    if(is.na(matched_label)) {
      matched_label<-''
    }
    if(matched_label=='NA') {
      matched_label<-''
    }
    if(matched_label!='') {
      if(length(invar_labels)>0) {
        which_label<-which(stringr::str_detect(matched_label, stringr::regex(invar_labels_patterns, ignore_case = TRUE)))
        if(length(which_label)!=1) {
          browser()
        }
        outvar[which_cases]<-invar_labels[[which_label]]
      } else {
        outvar[which_cases]<-matched_label
      }
    } else {
      outvar[which_cases]<-NA
    }

    if(flag_report) {
      reportClass$add_element(type=type, case=which_cases, var = colname)
    }

  }
  return(list(var=outvar, not_matched=not_matched))
}

disease_in_family<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
  if(length(in_colnames)!=10) {
    browser()
  }
  if(length(out_colnames)!=8) {
#    browser()
  }
#  browser()


  convert_wide_to_narrow_simple(in_dt = in_dt, in_colnames_one_cat = in_colnames[2:7],
                                in_colnames_other_cat = in_colnames[seq(8, length(in_colnames))], reportClass = reportClass,
                                in_colnames_one_cat_factor = c('Mother', 'Father', 'Brother', 'Homozygous twin', 'Sister', 'Homozygous twin'),
                                out_dt = out_dt, out_factor = names(danesurowe::GetLevels(out_dt[[out_colnames[[1]] ]])), out_colnames = out_colnames,
                                factor_dic=list('uncle'='Uncle unknown line', 'yes'='!', 'no'='!', 'yes, sister'='Sister',
                                                'uncle (brother of father)'='Uncle paternal',
                                                'grandmother (questionable )'='Grandmother unknown line',
                                                'grandmother (questionable)'='Grandmother unknown line',
                                                'grandmother (?)'='Grandmother unknown line',
                                                'grandfather (?)'='Grandfather unknown line',
                                                'maybe great-grandmother?'='Grandmother unknown line',
                                                'maybe sister ?'='Sister',
                                                'uncle (mother´s brother)'='Uncle paternal',
                                                'grandmother'='Grandmother unknown line',
                                                'second cousin'='!',
                                                'patient'=NA,
                                                'yes, aunt maternal'='Aunt maternal',
                                                'uncle father side'='Uncle paternal',
                                                'maternal grandmother'='Grandmother maternal',
                                                'aunt father side'='Aunt  paternal',
                                                'aunt'='Aunt unknown line',
                                                'grandfather'='Grandfather unknown line',
                                                'grandmother'='Grandmother unknown line',
                                                'niece'='Niece unknown line',
                                                'dsughter'='Daughter',
                                                'grandaunt'='Aunt unknown line',
                                                'great-uncle'='Uncle unknown line',
                                                'cousin'='!',
                                                'aunt'='Aunt unknown line',
                                                'alzheimer disease'='!',
                                                'grandma (father site)'='Grandmother paternal',
                                                'maternal aunt'='Aunt maternal',
                                                'grandfather (father of mother)'='Grandfather paternal',
                                                'grandmother (maternal)'= 'Grandmother maternal',
                                                'aunt (paternal)'='Aunt  paternal',
                                                "father's sister"='Aunt  paternal',
                                                'aunt (father´s sister)'='Aunt  paternal',
                                                'aunt (father sister)'='Aunt  paternal',
                                                'grandmother mother side' = 'Grandmother maternal',
                                                "father's brother"='Uncle paternal',
                                                "father's mother"='Grandfather maternal',
                                                "father's father"='Grandfather paternal',
                                                'five aunts'='Aunt unknown line',
                                                "uncle's granddaughter"='Niece maternal',
                                                'great uncle'='Uncle unknown line'))
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

manual_factor<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass, type='manual_factor') {
  if(length(in_colnames)>1) {
    browser()
  }
  if(length(out_colnames)>1) {
    browser()
  }
  if(in_colnames=='centr_id') {
#    browser()
  }
  #browser()
  in_val<-in_dt[[in_colnames]]
  out_val<-out_dt[[out_colnames]]

  #  if(in_colnames=='q_153') browser()
  if(!is.na(par)) {
    par_l<-parse_char_as_list(par)
  } else {
    par_l<-list()
  }

  ans<-convert_manual_text(in_char=as.character(in_val), colname=in_colnames, out_factor=out_val, factor_dict=par_l, reportClass, type=type)
  out_val<-ans$var
  not_matched<-ans$not_matched

  for(m in not_matched) {
    #   browser()
    which_cases<-which(stringr::str_detect(in_val, stringr::fixed(m, ignore_case = TRUE)))
    reportClass$add_element(type=type, case=which_cases, var = in_colnames)
  }

  data.table::set(out_dt,NULL,out_colnames, out_val)
  out_dt
}

one_specialist<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
#  browser()
  if(length(in_colnames)>1) {
    browser()
  }
  if(length(out_colnames)>1) {
    browser()
  }
  #browser()
  in_val<-in_dt[[in_colnames]]
  out_val<-out_dt[[out_colnames]]
  #browser()
  #Do nothing
  spec_fact<-convert_specialist(in_char = in_val, colname = in_colnames, out_factor = out_val,
                                reportClass = reportClass, type = 'specialist')

  data.table::set(out_dt,NULL,out_colnames, spec_fact)
}

specialist<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
#  browser()
  #Do nothing
  for(spec_nr in seq_along(in_colnames)) {
    in_colname<-in_colnames[[spec_nr]]
    ans<-convert_specialist(in_char = in_dt[[in_colname]], colname = in_colname, out_factor = out_dt[[out_colnames[[2]]]],
                                  reportClass = reportClass, type = 'specialist', flag_return_other=TRUE)
    spec_fact<-ans$factor_out
    other_out<-ans$other_out
    nona<-!is.na(spec_fact) | !is.na(other_out)
    val<-rep(NA_integer_, nrow(in_dt))
    val[nona]<-spec_nr
    data.table::set(out_dt, NULL, out_colnames[[(spec_nr-1)*4+1]], val)
    data.table::set(out_dt, NULL, out_colnames[[(spec_nr-1)*4+2]], spec_fact)
    data.table::set(out_dt, NULL, out_colnames[[(spec_nr-1)*4+3]], other_out)
  }

  out_dt
}

to_factor<-function(in_dt, in_colnames, out_dt, out_colnames, par,  do_debug, reportClass) {
#  browser()
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

upper_bound_numeric<-function(var_in, var_name, reportClass, type, upper_bound) {
  upper_exceed<-which(var_in>upper_bound)
  for(val_exceed in upper_exceed) {
    reportClass$add_element(type = type, case = val_exceed, var = var_name)
  }
  var_in[upper_exceed]<-NA
  return(var_in)
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

