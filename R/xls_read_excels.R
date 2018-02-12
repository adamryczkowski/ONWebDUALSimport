read_ANTA<-function(prefix, flag_control=FALSE) {
	if(flag_control) {
		ref_file <- file.path(prefix, 'control/ANTA/Excel questionnaire_ANTControl_2017(Warsaw).xlsx')
		ans<-read_file(ref_file)
	} else {
		ref_file <- file.path(prefix, 'ALS/ANTA/ANTA patients all 111.xlsx')
		ans<-read_file(ref_file)
	}
	return(convertANTA(ans$df, flag_control=flag_control))
}

read_HANN<-function(prefix, flag_control=FALSE) {
	if(flag_control) {
		ref_file1 <- file.path(prefix, 'control/HANN/Kontrollpersonen Tabelle 1.xlsx')
		ref1<-read_file(ref_file1)
		ref1$q_0<-stringr::str_replace(toupper(ref1$q_0), pattern=stringr::regex("^HANN([0-9]+)$"), replacement="HANN0\\1")

		ref_file2 <- file.path(prefix, 'control/HANN/Kontrollpersonen Tabelle 2.xlsx')
		ref2<-read_file(ref_file2)
		ref2$q_0<-stringr::str_replace(toupper(ref2$q_0), pattern=stringr::regex("^HANN([0-9]+)$"), replacement="HANN0\\1")

		ans<-rbind(ref1$df, ref2$df)
	} else {
		ref_file1 <- file.path(prefix, 'ALS/HANN/Patienten Tabelle 1-01-2017.xlsx')
		ref1<-read_file(ref_file1)
		ref_file2 <- file.path(prefix, 'ALS/HANN/Patienten Tabelle 2.xlsx')
		ref2<-read_file(ref_file2)
		ans<-rbind(ref1$df, ref2$df)
	}
	ans<-data.table(copy_dt_attributes(ref1$df, ans))
	ans<-convertHANN(ans, flag_control)
	return(ans)
}

read_JENA<-function(prefix, flag_control=FALSE) {
	if(flag_control) {
		ref_file<-file.path(prefix, 'control/JENA/Excel questionnaire Jena Control_20170531.xlsx')
		ans<-read_file(ref_file)
		return(convertJENA(ans$df, flag_control))
	} else {
		ref_file1<-file.path(prefix, 'ALS/JENA/Excel questionnaire Jena Patient_20170531.xlsx')
		ref1<-read_file(ref_file1)$df
		ref1<-convertJENA(ref1, flag_control, 'Excel questionnaire Jena Patient_20170531.xlsx')
		ref_file2<-file.path(prefix, 'ALS/JENA/Excel questionnaire_20160902 Jena.xlsx')
		ref2<-read_file(ref_file2)$df
		ref2<-convertJENA(ref2, flag_control, 'Excel questionnaire_20160902 Jena.xlsx')
		delcase<-which(ref2$q_0=='JENA0073')
		ref2<-ref2[-delcase,]

		return(rbind(ref2, ref1))

	}
}

read_LISB<-function(prefix, flag_control=FALSE) {
	if(flag_control) {
		ref_file <- file.path(prefix, 'control/LISB/LISB (2-Control)_Marta.xlsm')
		ans<-danesurowe::readDaneSurowe(ref_file)
		return(convertLISB(ans, flag_control))
	} else {
		ref_file <- file.path(prefix, 'ALS/LISB/als (2)_Lisbon reviewed_marta_3april.xlsm')
		ans<-danesurowe::readDaneSurowe(ref_file)
		return(convertLISB(ans, flag_control))
	}
}

read_WAWA<-function(prefix, flag_control=FALSE) {
	if(flag_control) {
		ref_file1 <- file.path(prefix, 'control/WAWA/OnWeb WAWA control 10.01.2017_FIX.xlsx')
		ref1<-read_file(ref_file1)
#		ref_file2 <- 'WAWA/entry format/control/OnWeb WARS control.xlsx'
#		ref2<-read_file(ref_file2)
#		ans<-rbind(ref1$df, ref2$df)
#		ans<-data.table(copy_dt_attributes(ref1$df, ans))
		ans<-convertWAWA(ref1$df, TRUE)
		return(ans)
	} else {
		ref_file <- file.path(prefix, 'ALS/WAWA/OnWeb WARS patients.xlsx')
		ans<-read_file(ref_file)
		return(convertWAWA(ans$df, FALSE))
	}
}

read_excel_db<-function(prefix, src, flag_control=FALSE) {
	if(src=='ANTA') {
		db<-read_ANTA(prefix = prefix, flag_control)
	} else if (src=='HANN') {
		db<-read_HANN(prefix = prefix, flag_control)
	} else if (src=='JENA') {
		db<-read_JENA(prefix = prefix, flag_control)
	} else if (src=='LISB') {
		db<-read_LISB(prefix = prefix, flag_control)
	} else if (src=='WAWA') {
		db<-read_WAWA(prefix = prefix, flag_control)
	} else {
		stop("Unknown source")
	}
}

# compare_two_excels<-function(src1, src2, flag_control=FALSE) {
# 	db1<-read_excel_db(src1, flag_control)
# 	db2<-read_excel_db(src2, flag_control)
# 	comp<-df_difference(db1, db2, flag_compare_data = FALSE, flag_compare_structure = TRUE, return_format = 'md')
# 	make_pdf(md_content = comp, filename = paste0('cmp/',src1,'_',src2), title = paste0('Comparison ', src1, ' -> ', src2), flagOpen=FALSE )
# }
#
#
# compare_all_excels<-function(flag_control=FALSE) {
# 	all_excel_classes<-c('ANTA','HANN','JENA','LISB','WAWA')
# 	all<-expand.grid(all_excel_classes,all_excel_classes)
# 	for(i in seq(nrow(all))) {
# 		if(all[i,1]!=all[i,2]) {
# 			cat(paste0("Comparing ", all[i,1], ' to ', all[i,2], '...'))
# 			compare_two_excels(all[i,1], all[i,2], flag_control)
# 		}
# 	}
# }


convertANTA<-function(db, flag_control) {
	if(flag_control) {
		db<-q23add_control(df=db)
	} else {
		db<-q49relabel_als(df = db)
		#	browser()
		db<-q85add_als(df=db)
		#	db<-q110conv_als(df = db)
		db<-q105text_als(df = db)
		db<-q106text_als(df = db)
		#	db<-q85delete_als(df = db)
		db<-conv_to_DateTime(df = db)
		db<-q52_add_take_2(df=db)
		db<-q99convert_als(df=db, 11)
	}
	return(db)
}

convertHANN<-function(db, flag_control) {
	if(flag_control) {
#		db<-q23delete_control(df = db)
	} else {
#		db<-q110conv_als(df = db)
		db<-q49relabel_als(df = db)
		db<-q105text_als(df = db)
		db<-q106text_als(df = db)
		db<-q110txt_als(df = db)
		db<-conv_to_DateTime(df = db)
		db<-q52_add_take_2(df=db)
		db<-q99convert_als(df=db, 11)
	}
	return(db)
}

convertJENA<-function(db, flag_control, file) {
	if (flag_control) {
#		db<-q23add_control(df = db)
	} else {
		if(file=='Excel questionnaire Jena Patient_20170531.xlsx') {
			db<-q49relabel_als(df = db)
			db<-q52_add_take_2(df=db)
			db<-q110txt_als(df=db)
			db<-conv_to_DateTime(df = db)
			db<-q99convert_als(df=db, 11)
		} else if (file=='Excel questionnaire_20160902 Jena.xlsx') {
			options(wanr=2)
			db<-q49relabel_als(df = db)
#			db<-q105text_als(df = db)
#			db<-q106text_als(df = db)
			db<-q3add_als(df=db)
			db<-q17conv_als(df=db)
			db<-q48add_als(df = db)
			db<-q110conv_als(df=db)
			db<-q16conv_als(df=db)
			db<-conv_to_DateTime(df = db)
			db<-q85add_als(df=db)
			db<-q99convert_als(df = db)
			db<-q149relabel_als(df=db)
			db<-q152relabel_als(df=db)
			db<-q156relabel_als(df=db)
			db<-q60relabel_als(df=db)
			#		db<-q85delete_als(df = db)
			db<-q52_add_take_2(df=db)
		} else {
			browser()
		}
	}
	return(db)
}

convertLISB<-function(db, flag_control) {
	if (flag_control) {
		db<-lisb_numeric_control(db)
		db<-lisb_text_control(db)
		db<-lisb_add_lp(db)
		db<-q23add_control(db)
	} else {
		db<-q3text_als(df = db)
		db<-q36text_als(df = db)
		db<-q45text_als(df = db)
		db<-q47text_als(df = db)
		db<-q48add_als(df = db)
		db<-q49relabel_als(df = db)
		db<-q52types_als(df = db)
		db<-q53text_als(df = db)
		db<-q66text_als(df = db)

		db<-q71text_als(df = db)
		db<-q85add_als(df = db)
		db<-q88text_als(df = db)

		db<-q99text_als(df = db)
		db<-q99convert_als(df=db, 11)

		db<-q105text_als(df = db)
		db<-q106text_als(df = db)
#		db<-q110add_als(df=db)
#		db<-q110text_als(df = db)
		db<-q112text_als(df = db)

		db<-q149text_als(df = db)
		db<-q151text_als(df = db)

		db<-q154text_als(df = db)
		db<-lisb_numeric_als(df = db)
		db<-conv_to_DateTime(df = db)

	}

	return(db)
}

convertWAWA<-function(db, control) {
	if(control) {
		db<-q48conv_control(df=db)
		db<-q23add_control(df=db)
	} else {
		db<-q49relabel_als(df = db)
		db<-q3relabel_als(df = db)
		db<-q110conv_als(df = db)
		db<-q105text_als(df = db)
		db<-q106text_als(df = db)
		db<-conv_to_DateTime(df = db)
		db<-q85add_als(df = db)
		db<-q52_add_take_2(df=db)
		db<-q99convert_als(df=db, 11)

	}
	return(db)
}


joinExcels<-function(prefix, flag_control)  {
	ANTAdb<-read_excel_db(prefix=prefix, src = 'ANTA', flag_control = flag_control)
	db<-ANTAdb

	HANNdb<-read_excel_db(prefix=prefix, src = 'HANN', flag_control = flag_control)
	if(length(setdiff(colnames(db), colnames(HANNdb)))>0) {
		browser()
	}
	if(length(setdiff(colnames(HANNdb),colnames(db)))>0) {
		browser()
	}
	db<-rbind(db, HANNdb)
	db<-danesurowe::copy_dt_attributes(ANTAdb, db)

	JENAdb<-read_excel_db(prefix=prefix, src = 'JENA', flag_control = flag_control)
	if(length(setdiff(colnames(db), colnames(JENAdb)))>0) {
		browser()
	}
	if(length(setdiff(colnames(JENAdb),colnames(db)))>0) {
		browser()
	}

	db<-rbind(db, JENAdb)
	db<-danesurowe::copy_dt_attributes(ANTAdb, db)


	LISBdb<-read_excel_db(prefix=prefix, src = 'LISB', flag_control = flag_control)
	if(length(setdiff(colnames(db), colnames(LISBdb)))>0) {
		browser()
	}
	if(length(setdiff(colnames(LISBdb),colnames(db)))>0) {
		browser()
	}
	db<-rbind(db, LISBdb)
	db<-danesurowe::copy_dt_attributes(ANTAdb, db)

	WAWAdb<-read_excel_db(prefix=prefix, src = 'WAWA', flag_control = flag_control)
	if(length(setdiff(colnames(db), colnames(WAWAdb)))>0) {
		browser()
	}
	if(length(setdiff(colnames(WAWAdb),colnames(db)))>0) {
		browser()
	}
	db<-rbind(db, WAWAdb)
	db<-copy_dt_attributes(LISBdb, db)

	return(db)
}

# db_als<-joinExcels(FALSE)
# db_ctrl<-joinExcels(TRUE)

joinALS_Ctrl<-function(db_als, db_ctrl, als_control_dic) {
  if(is.null(db_ctrl)) {
    db_ctrl<-joinExcels(TRUE)
    db_ctrl<-convert_Numeric_to_Date(db_ctrl, '^q_[45]$')
    db_ctrl<-try_to_enforce_numeric(db_ctrl, '^q_26[bde]$')
  }
  if(is.null(db_als)) {
    db_als<-joinExcels(FALSE)
  }
  db_ctrl$group<-"control"
  db_als$group<-"als"
  slo<-als_control_dic
  #slo<-getALS_control_dic(als_control_dic_filename)
  if(length(setdiff(colnames(db_als), slo$als))>0) {
    browser()
    stop(paste0("The following ALS columns are missing from the als_control dictionary: ",
                paste0(setdiff(colnames(db_als), slo$als), collapse = ', ')))
  }
  if(length(setdiff(slo$als, colnames(db_als)))>0) {
#    browser()
    pos<-which(!slo$als %in% setdiff(slo$als, colnames(db_als)))
    slo<-slo[pos,]
#    stop(paste0("The following ALS columns are superfluous in the als_control dictionary: ",
#                paste0(setdiff(slo$als, colnames(db_als)), collapse = ', ')))
  }




  if(length(setdiff(colnames(db_ctrl), slo$ctrl))>0) {
    browser()
    stop(paste0("The following Control columns are missing from the als_control dictionary: ",
                paste0(setdiff(colnames(db_ctrl), slo$ctrl), collapse = ', ')))
  }
  if(length(na.omit(setdiff(slo$ctrl, colnames(db_ctrl))))>0) {
#    browser()
    pos<-which(! slo$ctrl %in% na.omit(setdiff(slo$ctrl, colnames(db_ctrl))))
    slo<-slo[pos,]
#    stop(paste0("The following Control columns are superfluous in the als_control dictionary: ",
#                paste0(setdiff(slo$ctrl, colnames(db_ctrl)), collapse = ', ')))
  }

  for(i in rev(seq(nrow(slo)))) {
    #		cat(paste0(i,'\n'))
    #		if(i==519) browser()
    ctrl_id<-slo$ctrl[[i]]
    als_id<-slo$als[[i]]
    if(!is.na(ctrl_id)) {
      db_ctrl<-rename_variable_name(df = db_ctrl, inputvar = ctrl_id, newvarname = als_id)
    } else {
      if(!is.na(als_id)) {
        #browser()
        var<-db_als[[als_id]]
        var[[1]]<-NA
        db_ctrl[[als_id]]<-rep(var[[1]], nrow(db_ctrl))
        db_ctrl<-copy_var_attributes(var_source =  var, dt_dest = db_ctrl, var_dest_name = als_id)
      }
    }
  }
  setattr(db_als,'label', 'ALS')
  setattr(db_ctrl,'label', 'Control')
  #	a<-danesurowe::df_difference(db_als, db_ctrl, df1_key='q_0', df2_key='q_0', flag_compare_data=FALSE, return_format = 'md')
#  browser()


  db<-rbind(db_als, db_ctrl, fill=TRUE)
  db$centr_id<-findid(db$q_0)[,2]
  db<-danesurowe::copy_dt_attributes(db_als, db)
  return(db)
}

getALS_control_dic<-function(dicpath=NULL) {
  if(is.null(dicpath)) {
    dicpath<-system.file(getOption('onwebduals.als_ctrl_dic'),package='ONWebDUALSimport')
  }
  slo<-xlsx::read.xlsx(dicpath,1)
  slo$als<-as.character(slo$als)
  slo$ctrl<-as.character(slo$ctrl)
  slo$ctrl[slo$ctrl==""]<-NA
  return(slo)
}
