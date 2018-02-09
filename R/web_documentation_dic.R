#' Reads the web documentation from the external file.
#'
#' The documentation of the web service has very machine unfriendly format.
#' It as an Excel table, but the rows represent either entries, or heading.
#' And sometimes the text inside the cells has more than one line, in which case
#' there are more than 1 entry for each Excel row.
#'
#' @return Excel documentation in the form of the data.frame
#' @export

read_dictionaries_xlsx<-function(file_path='app_dictionaries.xlsx') {
  library(dplyr)
  library(purrr)
  library(data.table)

  tbl<-readxl::read_excel(file_path)
  colnames(tbl)<-c('Nr', 'Pos', 'DictCatId', 'Bit', 'info')
  tbl$info<-stringr::str_replace(tbl$info, stringr::fixed('varchar(50)'), replacement = 'varchar50')

  tbl$DictCatId<-stringr::str_replace_all(tbl$DictCatId, stringr::regex('[\r\t]'), '')
  tbl$info<-stringr::str_replace_all(tbl$info, stringr::regex('[\r\t]'), '')

  rowcnt1<-sum(pmax(1, dplyr::coalesce(stringr::str_count(tbl$DictCatId, '\n'),0L)))
  rowcnt2<-sum(pmax(1, dplyr::coalesce(stringr::str_count(tbl$info, '\n'),0L)))
  rowcnt<-max(rowcnt1, rowcnt2)

  tb<-data.table(ID=rep(NA_integer_, rowcnt),
                 Nr=rep('', rowcnt),
                 qname=rep('', rowcnt),
                 DictCatId=rep('', rowcnt),
                 multiple=rep(as.logical(NA), rowcnt),
                 info=rep('', rowcnt),
                 tblid=rep(NA_integer_, rowcnt),
                 tabname=rep('', rowcnt),
                 cat_id=rep('', rowcnt),
                 field_name_api=rep('', rowcnt),
                 field_name_vt=rep('', rowcnt),
                 field_type=rep('', rowcnt),
                 webservice=rep('', rowcnt),
                 webservice_par=rep('', rowcnt),
                 webservice_value=rep('', rowcnt)
                 #								 webservice_dic=rep('',rowcnt)
  )
  rownr<-1L
  nnr<-1L
  qnr<-0L
  tabnr<-0L
  tabname<-''
  outnr<-1L
  while(rownr<=nrow(tbl)) {
    #if(rownr==63) browser()
    if(is.na(tbl$info[[rownr]])) {
      tabnr<-tabnr+1L
      tabname<-tbl$Nr[[rownr]]
    } else {
      #			cat(paste0('rownr=', rownr, '; outnr=', outnr, '\n'))
      qnr<-qnr+1L
      #if(outnr>212) browser()
      catids<-tbl$DictCatId[[rownr]]
      #			catids<-stringr::str_replace_all(catids, stringr::fixed('\r'), '')
      infos<-tbl$info[[rownr]]
      #			infos<-stringr::str_replace_all(infos, stringr::fixed('\r'), '')

      if(stringr::str_count(infos, stringr::fixed('WebService:'))>0) {
        # infos_el<-stringr::str_match(infos, stringr::regex('WebService:\n([^\\(^\\)^\n]+)\n([^\\(^\\)^\n]+)\n([^@^=^\n]+)\n?.*'))
        # if(sum(is.na(infos_el))==0) {
        # 	if(infos_el[[2]]=="A001_Sports") {
        # 		webservice_dic<-infos_el[[2]]
        # 		infos<-paste0("WebService:\n", infos_el[[3]],'\n\n', infos_el[[4]])
        # 	} else {
        # 		browser()
        # 	}
        # } else {
        # 	webservice_dic<-NA
        # }
        infos_el<-stringr::str_match(infos, stringr::regex('WebService:\n(([^\n@\ ]+) ?(@?([^ ^=]+) ?= ?([^\n]+))?)\n*((.*\n?)+)$'))
        webservice<-infos_el[[3]]
        webservice_par<-infos_el[[5]]
        webservice_value<-infos_el[[6]]
        infos<-paste0('\n\n', infos_el[[7]])

      } else {
        webservice<-NA
        webservice_par<-NA
        webservice_value<-NA
        #				webservice_dic<-NA
      }
      catids<-stringr::str_split(catids, stringr::fixed('\n'))[[1]]
      infos<-stringr::str_split(infos, stringr::fixed('\n'))[[1]]

      for(i in seq(length(infos))) {
        info <- stringr::str_match_all(infos[[i]], stringr::regex("([^(^)]+)\\(([^(^)]+)\\)"))[[1]][,-1]
        if(i<=length(catids)) {
          catid<-catids[[i]]
        } else {
          catid<-NA
        }
        if(is.na(catid)) catid<-''
        if(length(info)>0 )  {
          field_name<-stringr::str_trim(info[[1]])
          field_name<-stringr::str_match(stringr::str_trim(field_name),stringr::regex('"?([^"]+$)'))[[2]]
          field_type<-info[[2]]

          set(tb, outnr, 1L, qnr)
          set(tb, outnr, 2L, tbl$Nr[[rownr]])
          set(tb, outnr, 3L, tbl$Pos[[rownr]])
          set(tb, outnr, 4L, tbl$DictCatId[[rownr]])
          if(is.na(tbl$Bit[[rownr]]) || stringr::str_trim(tbl$Bit[[rownr]])=='' ) {
            set(tb, outnr, 5L, FALSE)
          } else if (tbl$Bit[[rownr]]=='T') {
            set(tb, outnr, 5L, TRUE)
          } else {
            browser()
          }
          set(tb, outnr, 6L, tbl$info[[rownr]])
          set(tb, outnr, 7L, tabnr)
          set(tb, outnr, 8L, tabname)
          set(tb, outnr, 9L, catid)
          set(tb, outnr, 10L, field_name)
          set(tb, outnr, 11L, field_name)
          set(tb, outnr, 12L, field_type)
          set(tb, outnr, 13L, webservice)
          set(tb, outnr, 14L, webservice_par)
          set(tb, outnr, 15L, webservice_value)
          #					set(tb, outnr, 15L, webservice_dic)
          outnr<-outnr+1L

        } else if (! is.null(nrow(info))) {
          if(nrow(info)>0 && catid!='') {
            browser()
          }
        }
      }
    }
    rownr<-rownr+1L
  }
  tb<-tb[seq(outnr-1L),]
  #	browser()
  dupdf<-dplyr::filter(tibble::as_tibble(table(tb$field_name_vt)), n>1)
  dupnames<-dupdf[[1]]
  dupcounts<-dupdf$n
  if(nrow(dupdf)>0) {
    for(i in seq(1, nrow(dupdf))) {
      dupname<-dupnames[[i]]
      #browser()
      dupcount<-dupcounts[[i]]
      poses<-which(tb$field_name_api == dupname)
      for(j in seq_along(poses)) {
        pos<-poses[[j]]
        sufix<-paste0("_", stringr::str_pad(string = j, pad = '0', width = floor(log10(dupcount))))
        new_field_name<-paste0(dupname, sufix)
        set(tb, pos, 'field_name_vt', new_field_name)
      }
    }
  }

  return(tb)
}
