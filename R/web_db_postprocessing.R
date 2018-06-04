#' Various fixes to the web databse after it has been downloaded and put into the reference
post_processing_for_webdb<-function(dbout) {
  # # 1. Usuń walidacje
  # newnames<-colnames(dbout)
  # todel<-rev(which(stringr::str_detect(newnames, pattern = stringr::regex("^\\."))))
  # for(colnr in todel) {
  #   cat(paste0("removing ", colnr, "..."))
  #   data.table::set(dbout, j=colnr, value=NULL )
  # }
  #
  # 1. Kolumnę ALS/control przenieść na początek


  new_order<-c('group','centr_id')
  neworder<-c(new_order, setdiff(colnames(dbout), new_order))

#2  dbout<-data.table(as_tibble(dbout)[neworder])
  data.table::setcolorder(x = dbout, neworder)

  # 2. Jeśli pole odpowiedzi w kolumnie 'Relation...' jest puste, to należy zamienić na 'No relation'
#browser()
#  dbout$q_3a[is.na(dbout$q_3a)]<-'Not related'
  dbout[is.na(dbout$q_3a),q_3a:='Not related']

  # 3. Dla kontroli wykasować wszystkie odpowiedzi na pytania od 11 do 72.
  startvar<-'q_11'
  startpos<-which(colnames(dbout)==startvar)
  endvar<-'q_72'
  endpos<-which(colnames(dbout)==endvar)

  for(colnr in seq(startpos, endpos)) {
    cn<-colnames(dbout)[[colnr]]
    dbout[dbout$group=='Control', (cn):=NA]
  }

  # 	2.	Facility_id (zmienić na Clinic):
  #		1	Hannover
  # 	2	Jena
  # 	3	Lisbon
  # 	4	Warsaw
  # 	21	Antalya
  # 	24	Pisa
  labels<-c("'1'='Hannover';'2'='Jena';'3'='Lisbon';'4'='Warsaw';'21'='Antalya';'24'='Pisa'")
  dbout$facility_id<-car::recode(dbout$facility_id, recodes = labels, as.factor = TRUE)


  # 	3.	Person_id: Nazwisko lekarza:
  # 		3	Susanne Petri-Mals
  # 	6	Mamede de Carvalho
  # 	14	B Stubbendorf
  # 	18	K Szacka
  # 	19	Hilmi Uysal
  # 	22	Annalisa Logerfo
  labels<-c("'3'='Susanne Petri-Mals';'6'='Mamede de Carvalho';'14'='B Stubbendorf';'18'='K Szacka';'19'='Hilmi Uysal';'22'='Annalisa Logerfo'")
  dbout$person_id<-car::recode(dbout$person_id, recodes = labels, as.factor = TRUE)

  return(dbout)
}

fix_centr_id<-function(jf) {
  jf$group[jf$group=="1"]<-"als"
  jf$group[jf$group=="2"]<-"als"
  jf$group<-as.factor(jf$group)

  jf$centr_id[jf$centr_id=='Hann']<-'HANN'
  jf$centr_id[jf$centr_id=='J']<-'JENA'
  jf$group[jf$centr_id=='ANTC']<-'control'
  jf$centr_id[jf$centr_id=='ANTC']<-'ANTA'

  jf$group[jf$centr_id=='Con']<-'control'
  jf$centr_id[jf$centr_id=='Con']<-'HANN'

  centr_by_type<-list('Patienten Tabelle 1-01-2017.xlsx'='HANN',
                      'Excel questionnaire_20160902 Jena.xlsx'='JENA',
                      'Excel questionnaire Patient v14_LISB.xlsx'='LISB',
                      'OnWeb WARS patients.xlsx'='WAWA',
                      'Kontrollpersonen Tabelle 1.xlsx'='HANN',
                      'Excel questionnaire Jena Control_20170531.xlsx'='JENA',
                      'OnWeb WAWA control 10.01.2017_FIX.xlsx'='WAWA',
                      'ANTA patients all 111.xlsx'='ANTA',
                      'Patienten Tabelle 2.xlsx'='HANN',
                      'Excel questionnaire Jena Patient_20170531.xlsx'='JENA',
                      'LISB (1-Patient)_Marta.xlsm'='LISB',
                      'Excel questionnaire_ANTControl_2017(Warsaw).xlsx'='ANTA',
                      'Kontrollpersonen Tabelle 2.xlsx'='HANN',
                      'LISB (2-Control)_Marta.xlsm'='LISB')
  centr=rep('', nrow(jf))
  findstr<-basename(jf$filename)
  for(i in seq_along(centr_by_type)) {
    to_find<-names(centr_by_type)[[i]]
    to_replace<-centr_by_type[[i]]
    centr[findstr==to_find]<-to_replace
  }
  checkmate::assert_true(all(centr == jf$centr_id, na.rm = TRUE))



}
