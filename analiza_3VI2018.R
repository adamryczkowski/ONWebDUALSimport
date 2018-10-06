a<-function(joined_df) {
  jf<-joined_df
  table(jf$q_6, jf$group)

  table(jf$q_23, jf$group)
  table(jf$q_23, jf$source_web)

  table(jf$q_5, jf$centr_id)

  #W pliku "Excel/control/HANN/Kontrollpersonen Tabelle 1.xlsx", rekord nr 3 ma złe daty.
  # q_4 powinno być 7/22/2016 a jest 2086-07-24 (serial date wyszło 42573 - zgadza się)
  # q_5 powinno być 2/24/1953 a jest 2023-02-26
  # różnica jednak się zgadza. Powinna być 63.405 i tyle samo jest.

}
