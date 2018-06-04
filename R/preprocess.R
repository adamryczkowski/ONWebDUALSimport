#Functions in this script preprocess the data after reading them into the common format.
#Part of the preprocessing is data validation

parse_id<-function(joined_df) {
  q_0<-joined_df$q_0

  ans<-stringr::str_match(q_0, pattern=stringr::regex('^([A-Z]+)[ \\-]?([0-9]+)$'))
  centr_id<-ans[,2]
  id<-ans[,3]
  max_dig<-ceiling(log10(max(as.integer(id), na.rm = TRUE)))+1
  id<-stringr::str_pad(as.integer(id), width = 5, pad = '0')
  dict<-list(ANTC='ANTA',
             CON='HANN',
             WAW='WAWA')
  centr_id<-do_replaces(centr_id, dict)


  xlsdict_var<-basename(joined_df$filename)
  xlsdict_var<-do_replaces(xlsdict_var, xlsdict)

#  joined_df$facility_id<-as.factor(joined_df$facility_id)

  d_centr_id<-as.character(joined_df$facility_id)
  centr_id_dict<-list('Antalya'='ANTA', 'Hannover'='HANN', 'Jena'='JENA','Lisbon'='LISB', 'Pisa'='PISA', 'Warsaw'='WAWA' )
  d_centr_id<-do_replaces(d_centr_id, centr_id_dict)
  # 4 ways to input centr_id:
  # a) by parsing q_0 (xlsdict_var)
  # b) by centr_id
  # c) by filename
  # d) by facility_id

  a_centr_id<-centr_id
  b_centr_id<-as.character(joined_df$centr_id)
  c_centr_id<-stringr::str_sub(xlsdict_var, 1, 4)
  d_centr_id<-d_centr_id

  checkmate::assert_true(length(which(a_centr_id!=b_centr_id))==0)
  checkmate::assert_true(length(which(a_centr_id!=c_centr_id))==0)
  checkmate::assert_true(length(which(a_centr_id!=d_centr_id))==0)
  checkmate::assert_true(length(which(b_centr_id!=c_centr_id))==0)
  checkmate::assert_true(length(which(b_centr_id!=d_centr_id))==0)
  checkmate::assert_true(length(which(c_centr_id!=d_centr_id))==0)

  centrs<-cbind(a_centr_id, b_centr_id, c_centr_id, d_centr_id)

  centr_id<-plyr::aaply(centrs, 1, function(x) unique(na.omit(x)))

  centr_id<-do_replaces(centr_id, invert_charlist(centr_id_dict))

  joined_df$centr_id<-centr_id


  # 3 ways to input group:
  # a) by group
  # b) by filename

  a_group<-as.character(joined_df$group)
  b_group<-do_replaces(stringr::str_sub(xlsdict_var, 6, 7), list('C'='control', 'A'='als'))
  checkmate::assert_true(length(which(a_group!=b_group))==0)
  groups<-cbind(a_group, b_group)
  group<-plyr::aaply(groups, 1, function(x) unique(na.omit(x)))
  joined_df$group<-as.factor(group)

  return(joined_df)
}

do_replaces<-function(var, replaces) {
  for(i in seq_along(replaces)) {
    to_find<-names(replaces)[[i]]
    to_replace<-replaces[[i]]
    var[var==to_find]<-to_replace
  }
  var
}

invert_charlist<-function(list) {
  return(setNames(names(list), list))
}

generateNewVariables<-function(joined_df) {
  joined_df<-parse_id(joined_df)

  db<-joined_df
  db$age_als <-as.numeric(db$q_11 - db$q_5)/365.25
  db$age_als[db$age_als<0]<-NA
  setattr(db$age_als, 'label', "Age on 1st symptoms")
  setattr(db$age_als, 'units', "years")

  filter_date<-((db$q_4<as.Date("2012-01-01") |  db$q_4>as.Date("2018-01-01")))
  data.table::set(db, which(filter_date), 'q_4', NA) #Consultation date

  filter_date<-(db$q_5<as.Date("1927-01-01") |  db$q_5>as.Date("1998-01-01"))
  browser()
  data.table::set(db, which(filter_date), 'q_5', NA) #Birth day

  db$age <-as.numeric(db$q_4 - db$q_5)/365.25
  db$age[db$age<20]<-NA
  db$age[db$age>92]<-NA
  setattr(db$age, 'label', "Age on consulation")
  setattr(db$age, 'units', "years")


  filter_date<-(db$q_11<as.Date("1991-01-01") |  db$q_11>as.Date("2018-01-01")) & db$group=='als'
  data.table::set(db, which(filter_date), 'q_11', NA) #Data 1szych objawów
  db$als_duration <-as.numeric(db$q_4 - db$q_11)/365.25*12

  db$als_duration[db$als_duration<0]<-NA
  setattr(db$als_duration, 'label', "Disease duration")
  setattr(db$als_duration, 'units', "months")

  filter_date<-(db$q_13<as.Date("1992-01-01") |  db$q_13>as.Date("2018-01-01")) & db$group=='als'
  data.table::set(db, which(filter_date), 'q_13', NA) #Data diagnozy

  filter_date<-(db$q_15<as.Date("1992-01-01") |  db$q_15>as.Date("2018-01-01")) & db$group=='als'
  data.table::set(db, which(filter_date), 'q_15', NA) #Data śmierci
  db$life_span <-as.numeric(db$q_15 - db$q_5)/365.25
  db$life_span[db$life_span<0]<-NA
  setattr(db$life_span, 'label', "Life span")
  setattr(db$life_span, 'units', "years")



  als_start<-which(colnames(db)=='q_51_1.1')
  als_end<-which(colnames(db)=='q_51_1.12')
  alsfrs<-data.matrix(data.table:::subset.data.table(db, TRUE, seq(als_start, als_end)))
  #table(plyr::aaply(alsfrs, 1, function(x)sum(is.na(x))))

  new_ALS1<-rowSums(alsfrs, na.rm=FALSE)
#  data.table::set(db, which(!is.na(new_ALS1)), 'q_51_1.score', as.integer(new_ALS1[!is.na(new_ALS1)]))
  data.table::set(db, seq_len(nrow(db)), 'q_51_1.score', as.integer(new_ALS1))
#  db$q_51_1.score[seq_len(nrow(db))]<-new_ALS1
  data.table::set(db, seq_len(nrow(db)), 'db$q_51_1.rate', (48-db$q_51_1.score)/db$als_duration)
#  db$q_51_1.rate[seq_len(nrow(db))]<-(48-db$q_51_1.score)/db$als_duration

  db$source_web <- factor(is.na(jf$filename)*1, levels=c(0,1), labels=c('xls','web'))
  setattr(db$source_web, 'label', "General source of the record")


  return(db)
}

