#' Various fixes to the web databse after it has been downloaded and put into the reference
post_processing_for_webdb<-function(dbout) {
  # 1. Usuń walidacje
  newnames<-colnames(dbout)
  todel<-rev(which(stringr::str_detect(newnames, pattern = stringr::regex("^\\."))))
  for(colnr in todel) {
    cat(paste0("removing ", colnr, "..."))
    data.table::set(dbout, j=colnr, value=NULL )
  }

  # 1. Kolumnę ALS/control przenieść na początek

  neworder<-c('group', setdiff(colnames(dbout), 'group'))

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
  dbout$facility_id<-car::recode(dbout$facility_id, recodes = labels, as.factor.result = TRUE)

  # 	3.	Person_id: Nazwisko lekarza:
  # 		3	Susanne Petri-Mals
  # 	6	Mamede de Carvalho
  # 	14	B Stubbendorf
  # 	18	K Szacka
  # 	19	Hilmi Uysal
  # 	22	Annalisa Logerfo
  labels<-c("'3'='Susanne Petri-Mals';'6'='Mamede de Carvalho';'14'='B Stubbendorf';'18'='K Szacka';'19'='Hilmi Uysal';'22'='Annalisa Logerfo'")
  dbout$person_id<-car::recode(dbout$person_id, recodes = labels, as.factor.result = TRUE)

  return(dbout)
}
