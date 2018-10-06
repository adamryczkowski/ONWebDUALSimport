czyszczenie_danych<-function() {
  #TODO: przeparsuj q_0 i dodaj kraj.


  #saveRDS(joined_df, file = 'joined_db.rds')
  joined_df<-readRDS('joined_db.rds')
  group<-joined_df$group
  group[group=='1']<-'als'
  group[group=='2']<-'control'
  group<-as.factor(group)
  data.table::set(joined_df, NULL, 'group', group)
  #Usunięcie duplikatów
  rows<-!duplicated(joined_df$q_0)
  joined_df<-joined_df[rows,]

  no_ume<-!stringr::str_detect(joined_df$q_0, pattern=stringr::fixed('UME'))
  joined_df<-joined_df[no_ume,]

  a<-as.numeric((joined_df$q_4-joined_df$q_5)/365)

  filter_date<-((joined_df$q_4<as.Date("2012-01-01") |  joined_df$q_4>as.Date("2018-01-01")))
  data.table::set(joined_df, which(filter_date), 'q_4', NA) #Consultation date
  sort(joined_df$q_4)
  sort((joined_df %>% filter(group=='control'))$q_4)

#  joined_df<-joined_df[filter_date,]4
  nrow(joined_df)


  filter_date<-(joined_df$q_5<as.Date("1927-01-01") |  joined_df$q_5>as.Date("1998-01-01"))
  data.table::set(joined_df, which(filter_date), 'q_5', NA) #Birth day
  sort(joined_df$q_5)

  filter_date<-(joined_df$q_11<as.Date("1991-01-01") |  joined_df$q_11>as.Date("2018-01-01")) & joined_df$group=='als'
  data.table::set(joined_df, which(filter_date), 'q_11', NA) #Data 1szych objawów
  sort(joined_df$q_11)

  filter_date<-(joined_df$q_13<as.Date("1992-01-01") |  joined_df$q_13>as.Date("2018-01-01")) & joined_df$group=='als'
  data.table::set(joined_df, which(filter_date), 'q_13', NA) #Data diagnozy
  sort(joined_df$q_13)
  sort((joined_df %>% filter(group=='control'))$q_13)

  filter_date<-(joined_df$q_15<as.Date("1992-01-01") |  joined_df$q_15>as.Date("2018-01-01")) & joined_df$group=='als'
  data.table::set(joined_df, which(filter_date), 'q_15', NA) #Data śmierci
  sort(joined_df$q_15)

  sort(joined_df$q_51_1.date)

  data.table::set(joined_df, NULL, 'age', (joined_df$q_4 - joined_df$q_5)/365.24)
  sort(joined_df$age)
  table(joined_df$group)

  joined_df %>% group_by(group) %>%  summarise(median(age, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(mean(age, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(sd(age, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(min(age, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(max(age, na.rm = TRUE))

  joined_df$q_110a
  joined_df$q_23[joined_df$q_23=='2']<-'Right'
  joined_df$q_23[joined_df$q_23=='1']<-'Left'
  joined_df$q_23[joined_df$q_23=='3']<-'Ambidextrous'

  table(joined_df$q_23)

  sum(joined_df$q_26=='2',na.rm=TRUE)
  table((joined_df %>% filter(group=='control'))$q_23)

  table((webdb %>% filter(group=='als'))$q_8b)

  table((webdb %>% filter(group=='als'))$q_114b)
  joined_df$q_114b

  convert_yesno<-function(colname) {
    var<-joined_df[[colname]]
    var[var=='1']<-'No'
    var[var=='2']<-'Yes'
    var[is.na(var)]<-'No'
    data.table::set(joined_df, NULL, colname, var)
  }
  convert_yesno('q_114a')
  table((joined_df %>% filter(group=='als'))$q_114a)
  table((joined_df %>% filter(group=='control'))$q_114a)
  convert_yesno('q_114b')
  table((joined_df %>% filter(group=='als'))$q_114b)
  table((joined_df %>% filter(group=='control'))$q_114b)
  convert_yesno('q_114c')
  table((joined_df %>% filter(group=='als'))$q_114c)
  table((joined_df %>% filter(group=='control'))$q_114c)
  convert_yesno('q_114d')
  table((joined_df %>% filter(group=='als'))$q_114d)
  table((joined_df %>% filter(group=='control'))$q_114d)
  convert_yesno('q_114e')
  table((joined_df %>% filter(group=='als'))$q_114e)
  table((joined_df %>% filter(group=='control'))$q_114e)
  convert_yesno('q_114f')
  table((joined_df %>% filter(group=='als'))$q_114f)
  table((joined_df %>% filter(group=='control'))$q_114f)
  convert_yesno('q_114g')
  table((joined_df %>% filter(group=='als'))$q_114g)
  table((joined_df %>% filter(group=='control'))$q_114g)
  convert_yesno('q_114h')
  table((joined_df %>% filter(group=='als'))$q_114h)
  table((joined_df %>% filter(group=='control'))$q_114h)

  table((joined_df %>% filter(group=='als'))$q_73)
  table((joined_df %>% filter(group=='control'))$q_73)

  table((joined_df %>% filter(group=='als'))$q_74)
  table((joined_df %>% filter(group=='control'))$q_74)

  table((joined_df %>% filter(group=='als'))$q_75)
  table((joined_df %>% filter(group=='control'))$q_75)

  table((joined_df %>% filter(group=='als'))$q_76)
  table((joined_df %>% filter(group=='control'))$q_76)

  table((joined_df %>% filter(group=='als'))$q_77)
  table((joined_df %>% filter(group=='control'))$q_77)

  table((joined_df %>% filter(group=='als'))$q_78)
  table((joined_df %>% filter(group=='control'))$q_78)

  table((joined_df %>% filter(group=='als'))$q_79)
  table((joined_df %>% filter(group=='control'))$q_79)

  table((joined_df %>% filter(group=='als'))$q_80)
  table((joined_df %>% filter(group=='control'))$q_80)

  table((joined_df %>% filter(group=='als'))$q_81)
  table((joined_df %>% filter(group=='control'))$q_81)

  table((joined_df %>% filter(group=='als'))$q_82)
  table((joined_df %>% filter(group=='control'))$q_82)

  table((joined_df %>% filter(group=='als'))$q_83)
  table((joined_df %>% filter(group=='control'))$q_83)

  table((joined_df %>% filter(group=='als'))$q_84)
  table((joined_df %>% filter(group=='control'))$q_84)

  konwertuj_cancer<-function(colname) {
    var<-joined_df[[colname]]
    var[var=='1']<-'No'
    var[var=='2']<-'Yes'
    var[is.na(var)]<-'No'
    data.table::set(joined_df, NULL, colname, factor(var))
    colname
  }

  purrr::map(colnames(joined_df)[236:254], konwertuj_cancer)

  cancers<-plyr::aaply(data.matrix((joined_df[,236:254]))-1,1,sum)
  sum(cancers[joined_df$group=='als'])
  sum(cancers[joined_df$group=='control'])

  joined_df$q_85a_4

  sum(joined_df$group=='als')

  table((joined_df %>% filter(group=='als'))$q_89a)
  table((joined_df %>% filter(group=='control'))$q_89a)

  table((joined_df %>% filter(group=='als'))$q_90a)
  table((joined_df %>% filter(group=='control'))$q_90a)

  table((joined_df %>% filter(group=='als'))$q_92a)
  table((joined_df %>% filter(group=='control'))$q_92a)

  table((joined_df %>% filter(group=='als'))$q_93a)
  table((joined_df %>% filter(group=='control'))$q_93a)

  table((joined_df %>% filter(group=='als'))$q_94a)
  table((joined_df %>% filter(group=='control'))$q_94a)

  table((joined_df %>% filter(group=='als'))$q_95a)
  table((joined_df %>% filter(group=='control'))$q_95a)

  table((joined_df %>% filter(group=='als'))$q_96a)
  table((joined_df %>% filter(group=='control'))$q_96a)


  table((joined_df %>% filter(group=='als'))$q_115)
  table((joined_df %>% filter(group=='control'))$q_115)
  table((joined_df %>% filter(group=='als'))$q_116)
  table((joined_df %>% filter(group=='control'))$q_116)

  purrr::map(colnames(joined_df)[458:473], konwertuj_cancer)

  table((joined_df %>% filter(group=='als'))$q_117a)
  table((joined_df %>% filter(group=='control'))$q_117a)
  table((joined_df %>% filter(group=='als'))$q_118a)
  table((joined_df %>% filter(group=='control'))$q_118a)

  table((joined_df %>% filter(group=='als'))$q_117b)
  table((joined_df %>% filter(group=='control'))$q_117b)
  table((joined_df %>% filter(group=='als'))$q_118b)
  table((joined_df %>% filter(group=='control'))$q_118b)

  table((joined_df %>% filter(group=='als'))$q_117c)
  table((joined_df %>% filter(group=='control'))$q_117c)
  table((joined_df %>% filter(group=='als'))$q_118c)
  table((joined_df %>% filter(group=='control'))$q_118c)

  table((joined_df %>% filter(group=='als'))$q_119a)
  table((joined_df %>% filter(group=='control'))$q_119a)
  table((joined_df %>% filter(group=='als'))$q_120a)
  table((joined_df %>% filter(group=='control'))$q_120a)

  table((joined_df %>% filter(group=='als'))$q_119b)
  table((joined_df %>% filter(group=='control'))$q_119b)
  table((joined_df %>% filter(group=='als'))$q_120b)
  table((joined_df %>% filter(group=='control'))$q_120b)

  table((joined_df %>% filter(group=='als'))$q_119c)
  table((joined_df %>% filter(group=='control'))$q_119c)
  table((joined_df %>% filter(group=='als'))$q_120c)
  table((joined_df %>% filter(group=='control'))$q_120c)

  table((joined_df %>% filter(group=='als'))$q_120a)
  table((joined_df %>% filter(group=='control'))$q_120a)
  table((joined_df %>% filter(group=='als'))$q_121a)
  table((joined_df %>% filter(group=='control'))$q_121a)

  table((joined_df %>% filter(group=='als'))$q_120b)
  table((joined_df %>% filter(group=='control'))$q_120b)
  table((joined_df %>% filter(group=='als'))$q_121b)
  table((joined_df %>% filter(group=='control'))$q_121b)


  purrr::map(colnames(joined_df)[474:489], konwertuj_cancer)

  table((joined_df %>% filter(group=='als'))$q_123)
  table((joined_df %>% filter(group=='control'))$q_123)
  table((joined_df %>% filter(group=='als'))$q_124)
  table((joined_df %>% filter(group=='control'))$q_124)

  table((joined_df %>% filter(group=='als'))$q_125)
  table((joined_df %>% filter(group=='control'))$q_125)
  table((joined_df %>% filter(group=='als'))$q_126)
  table((joined_df %>% filter(group=='control'))$q_126)

  table((joined_df %>% filter(group=='als'))$q_127)
  table((joined_df %>% filter(group=='control'))$q_127)
  table((joined_df %>% filter(group=='als'))$q_128)
  table((joined_df %>% filter(group=='control'))$q_128)

  table((joined_df %>% filter(group=='als'))$q_129)
  table((joined_df %>% filter(group=='control'))$q_129)
  table((joined_df %>% filter(group=='als'))$q_130)
  table((joined_df %>% filter(group=='control'))$q_130)

  table((joined_df %>% filter(group=='als'))$q_131)
  table((joined_df %>% filter(group=='control'))$q_131)
  table((joined_df %>% filter(group=='als'))$q_132)
  table((joined_df %>% filter(group=='control'))$q_132)

  table((joined_df %>% filter(group=='als'))$q_133)
  table((joined_df %>% filter(group=='control'))$q_133)
  table((joined_df %>% filter(group=='als'))$q_134)
  table((joined_df %>% filter(group=='control'))$q_134)

  table((joined_df %>% filter(group=='als'))$q_135)
  table((joined_df %>% filter(group=='control'))$q_135)
  table((joined_df %>% filter(group=='als'))$q_136)
  table((joined_df %>% filter(group=='control'))$q_136)

  table((joined_df %>% filter(group=='als'))$q_137)
  table((joined_df %>% filter(group=='control'))$q_137)
  table((joined_df %>% filter(group=='als'))$q_138)
  table((joined_df %>% filter(group=='control'))$q_138)


  joined_df$q_138

  diag_delay<-as.numeric(joined_df$q_13-joined_df$q_11)/365.25

  diag_delay[diag_delay<=0 | diag_delay>20 | is.na(joined_df$q_36a) ]<-NA
  data.table::set(joined_df,NULL,'diag_delay',diag_delay*12)
  sort(diag_delay)

  sum(!is.na(diag_delay))
  joined_df %>% group_by(group) %>%  summarise(median(diag_delay, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(mean(diag_delay, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(sd(diag_delay, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(min(diag_delay, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(max(diag_delay, na.rm = TRUE))


  specialists<-data.matrix(!is.na(joined_df[,c('q_154a_1', 'q_154a_2', 'q_154a_3', 'q_154a_4', 'q_154a_5', 'q_154a_6', 'q_154a_7')]))
  joined_df$q_154d_1[[682]]
  specialists<-plyr::aaply(specialists, 1, sum)
  joined_df$q_154a_2
  specialists[specialists==0]<-NA
  data.table::set(joined_df, NULL, 'which_specialist_diag', specialists)
  sum(!is.na(specialists))
  joined_df %>% group_by(group) %>%  summarise(median(which_specialist_diag, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(mean(which_specialist_diag, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(sd(which_specialist_diag, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(min(which_specialist_diag, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(max(which_specialist_diag, na.rm = TRUE))

  age1sympt<-(joined_df$q_11-joined_df$q_5)/365.25
  age1sympt[age1sympt<25]<-NA
  data.table::set(joined_df, NULL, 'age1sympt', age1sympt)

  sum(!is.na(age1sympt[joined_df$group=='als']))
  sum(!is.na(age1sympt[joined_df$group=='control']))

  sort(age1sympt)
  sum(!is.na(age1sympt))

  joined_df %>% group_by(group) %>%  summarise(median(age1sympt, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(mean(age1sympt, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(sd(age1sympt, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(min(age1sympt, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(max(age1sympt, na.rm = TRUE))

  joined_df$q_16c

  dis_dur<-(joined_df$q_4 - joined_df$q_11)/365.25*12
  data.table::set(joined_df, NULL, 'dis_dur', dis_dur)
  sort(dis_dur)
  sum(!is.na(dis_dur))

  joined_df %>% group_by(group) %>%  summarise(median(dis_dur, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(mean(dis_dur, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(sd(dis_dur, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(min(dis_dur, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(max(dis_dur, na.rm = TRUE))


  life_span<-(joined_df$q_15 - joined_df$q_5)/365.25
  data.table::set(joined_df, NULL, 'life_span', dis_dur)
  sort(life_span)
  sum(!is.na(life_span))

  joined_df %>% group_by(group) %>%  summarise(median(life_span, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(mean(life_span, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(sd(life_span, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(min(life_span, na.rm = TRUE))
  joined_df %>% group_by(group) %>%  summarise(max(life_span, na.rm = TRUE))

}

