q3relabel_als<-function(df)
{
	relabel_variable(df=df,
									 inputvar = 'q_3a',
									 newlabel = 'Relation to control subject',
									 oldlabel = c('Relation to a patient','Relation to a control subject'))
	relabel_variable(df=df,
									 inputvar = 'q_3b',
									 newlabel = 'Control subject code',
									 oldlabel = c('Patient code'))
	return(df)
}

q3add_als<-function(df)
{
	flabels<-c('Relative', 'Spouse', 'Not related')
	var<-factor(rep(NA_integer_, nrow(df)), levels=seq_along(flabels), labels = flabels)

	df[,q_3a:=var]
	setattr(df$q_3a, 'label', 'Relation to control subject')

	df[,q_3b:=rep(NA_character_, nrow(df))]
	setattr(df$q_3b, 'label', 'Control subject code')
	return(df)
}

q3relabel_als2<-function(df)
{
	relabel_variable(df=df,
									 inputvar = 'q_3a',
									 newlabel = 'Relation to control subject',
									 oldlabel = c('Relation to a patient','Relation to a control subject'))
	relabel_variable(df=df,
									 inputvar = 'q_3b',
									 newlabel = 'Control subject code',
									 oldlabel = c('Control code'))
	return(df)
}

q3relabel_control<-function(df)
{
	relabel_variable(df=df,
									 inputvar = 'q_3a',
									 newlabel = 'Relation to patient',
									 oldlabel = 'Relation to control subject')
	relabel_variable(df=df,
									 inputvar = 'q_3b',
									 newlabel = 'Patient code',
									 oldlabel = 'Control code')
	return(df)
}

q16conv_als<-function(df)
{
	varname<-'q_16'

	map<-list('1' = c('q_16a', 'Limbs onset'),
						'2' = c('q_16b', 'Bulbar onset'),
						'3' = c('q_16c', 'Neck onset'),
						'4' = c('q_16d', 'Thoracic/Abdominal onset'),
						'5' = c('q_16e', 'Respiratory onset'),
						'x' = c('q_16f', 'Dyscognition onset'),
						'6' = c('q_16g', 'Generalized onset'))
	single2multiple(df = df,
									inputvar = 'q_16',
									map = map,
									levels = c('Yes', 'No'),
									yesno = TRUE)
	return(df)
}

q17conv_als<-function(df)
{
	refactor_variable(df, 'q_17', c('UMN', 'LMN', 'UMN+LMN', 'NR'))

	refactor_variable(df, 'q_18a', c('No', 'upper limb', 'lower limb', 'upper and lower'))
	refactor_variable(df, 'q_18c', c('distal', 'proximal', 'distal and proximal'))

	return(df)
}

q23add_control<-function(df)
{#als
	df<-rename_variable_name(df = df,
													 newvarname = 'q_23a1',
													 inputvar = 'q_23a')
	flabels<-c('No', 'Brain', 'Neck', 'Breast', 'Lung', 'other Thoracic',
						 'Gastric', 'Colon', 'Rectum', 'other Abdominal',
						 'Prostate', 'Uterus', 'other Pelvic', 'Spine',
						 'UL bone & sarcomas', 'LL bone & sarcomas', 'Skin',
						 'Leukemia', 'Lymphoma', 'other blood')
	var<-factor(rep(NA_integer_, nrow(df)), levels=seq_along(flabels), labels = flabels)

	df[,q_23a2:=var]
	setattr(df$q_23a2, 'label', 'Primary cancer (2nd place)')
	df[,q_23a3:=var]
	setattr(df$q_23a3, 'label', 'Primary cancer (3rd place)')
	df<-rename_variable_name(df = df,
													 inputvar = 'q_23b',
													 newvarname = 'q_23b1')
	df[,q_23b2:=var]
	setattr(df$q_23b2, 'label', 'Metastasis (2nd place)')
	df[,q_23b3:=var]
	setattr(df$q_23b3, 'label', 'Metastasis (3rd place)')
	df[,q_23b4:=var]
	setattr(df$q_23b4, 'label', 'Metastasis (4th place)')
	df[,q_23b5:=var]
	setattr(df$q_23b5, 'label', 'Metastasis (5th place)')
	df[,q_23b6:=var]
	setattr(df$q_23b6, 'label', 'Metastasis (6th place)')
	df[,q_23b7:=var]
	setattr(df$q_23b7, 'label', 'Metastasis (7th place)')
	return(df)
}

q23delete_control<-function(df)
{#Control
	df<-rename_variable_name(df = df,
											 inputvar = 'q_23a1',
											 newvarname = 'q_23a')
	df[,q_23a2:=NULL]
	df[,q_23a3:=NULL]
	df<-rename_variable_name(df = df,
											 inputvar = 'q_23b1',
											 newvarname = 'q_23b')
	df[,q_23b2:=NULL]
	df[,q_23b3:=NULL]
	df[,q_23b4:=NULL]
	df[,q_23b5:=NULL]
	df[,q_23b6:=NULL]
	df[,q_23b7:=NULL]
	return(df)
}


q35relabel_ctrl<-function(df)
{
	vars<-c('q_35a', 'q_36')
	plyr::a_ply(vars,1,function(var) {refactor_variable(df, var, newlabels = c('Yes','No','NA'))})
	return(df)
}

q36relabel_als<-function(df)
{
	refactor_variable(df, 'q_36b', c('PMA', 'PLS', 'M', 'PBP', 'Other'))
	return(df)
}

q48conv_control<-function(df)
{
	rename_variable_name(df = df,
											 inputvar = 'q_48c',
											 newvarname = 'q_48d')

	rename_variable_name(df = df,
											 inputvar = 'q_48b',
											 newvarname = 'q_48c',
											 newlabel = 'With a monozygous twin',
											 oldlabel = 'With monozygous twin')

	rename_variable_name(df = df,
											 inputvar = 'q_48a',
											 newvarname = 'q_48b',
											 newlabel = 'Number of siblings and birth order',
											 oldlabel = 'Number of Siblings and birth order')
	df$q_48a<-NA_real_
	setattr(df$q_48a,'label','Number of children')

	return(df)
}

q48conv_ctrlshort<-function(df)
{
	convert_to_numeric(df, 'q_48b')
	return(df)
}

q48add_als<-function(df)
{
	flabels<-levels(df$q_48a)
	for(i in 10:13) {
		var<-factor(rep(NA_integer_, nrow(df)), levels=seq_along(flabels), labels = flabels)
		varname<-paste0('q_48', letters[[i]])
		df[[varname]]<-var
		setattr(df[[varname]], 'label', paste0(i, 'th region'))
	}
	return(df)
}


q49relabel_als<-function(df)
{
	relabel_variable(df = df,
									 inputvar = 'q_49c',
									 newlabel = 'Timing of transition from region 1 to 2',
									 oldlabel = 'Timing of transistion from region 1 to 2')
	relabel_variable(df=df,
									 inputvar = 'q_50b',
									 newlabel = 'Timing of transition from region 2 to 3',
									 oldlabel = 'Timing of transistion from region 2 to 3')
	df<-try_to_enforce_numeric(df, '^q_49c$')
	df<-try_to_enforce_numeric(df, '^q_50b$')
	return(df)
}

q50b2_control<-function(df)
{
	stop("!!")
}

q60relabel_als<-function(df)
{
	vars<-c('q_60', 'q_61', 'q_62')
	plyr::a_ply(vars,1,function(var) {refactor_variable(df, var, c('Normal', 'Abnormal','NA'))})

	refactor_variable(df, 'q_63',c('Yes', 'No', 'NA'))

	refactor_variable(df, 'q_64', c('Normal', 'Tumor', 'Stroke', 'Multiple sclerosis', 'Trauma', 'Hypoxia', 'NA'))

	vars<-c('q_65a', 'q_65b', 'q_65c')
	plyr::a_ply(vars,1,function(var) {refactor_variable(df, var,
																											c('Normal', 'Tumor', 'Stenosis', 'Myelitis', 'Trauma', 'Syringomyelia', 'Other', 'NA'))})
	return(df)
}

q52_add_take_2<-function(df) {
	#df<-data.table(df)
	vars<-c(paste0('q_52c.', 1:12), 'q_52d', 'q_52e', 'q_52f')
	for(var in vars) {
		df[[var]]<-rep(NA, nrow(df))
	}
	df<-convert_pure_NA(df, '^q_52c\\.[1-9]', 'N')
	df<-convert_pure_NA(df, '^q_52c\\.1[012]', 'N')
	df<-convert_pure_NA(df, '^q_52[de]', 'N')
	df<-convert_pure_NA(df, '^q_52f', 'D')
	for(i in 1:12) {
		inputvar<-paste0('q_52c.', i)
		df<-relabel_variable(df, inputvar = inputvar, oldlabel = "", newlabel = paste0("ALSFRS-R take 2, question ", i))
	}
	df<-relabel_variable(df, inputvar = 'q_52d', oldlabel = "", newlabel = "ALSFRS-R take 2 total")
	df<-relabel_variable(df, inputvar = 'q_52e', oldlabel = "", newlabel = "ALSFRS-R take 2 rate of decay")
	df<-relabel_variable(df, inputvar = 'q_52f', oldlabel = "", newlabel = "ALSFRS-R take 2 date")
	return(df)
}


q85add_als<-function(df)
{#als
	df<-rename_variable_name(df = df,
													 newvarname = 'q_85a1',
													 inputvar = 'q_85a')
	flabels<-c('No', 'Brain', 'Neck', 'Breast', 'Lung', 'other Thoracic',
						 'Gastric', 'Colon', 'Rectum', 'other Abdominal',
						 'Prostate', 'Uterus', 'other Pelvic', 'Spine',
						 'UL bone & sarcomas', 'LL bone & sarcomas', 'Skin',
						 'Leukemia', 'Lymphoma', 'other blood')
	var<-factor(rep(NA_integer_, nrow(df)), levels=seq_along(flabels), labels = flabels)

	suppressWarnings(df[,q_85a2:=var])
	setattr(df$q_85a2, 'label', 'Primary cancer (2nd place)')
	df[,q_85a3:=var]
	setattr(df$q_85a3, 'label', 'Primary cancer (3rd place)')
	df<-rename_variable_name(df = df,
											 inputvar = 'q_85b',
											 newvarname = 'q_85b1')
	df[,q_85b2:=var]
	setattr(df$q_85b2, 'label', 'Metastasis (2nd place)')
	df[,q_85b3:=var]
	setattr(df$q_85b3, 'label', 'Metastasis (3rd place)')
	df[,q_85b4:=var]
	setattr(df$q_85b4, 'label', 'Metastasis (4th place)')
	df[,q_85b5:=var]
	setattr(df$q_85b5, 'label', 'Metastasis (5th place)')
	df[,q_85b6:=var]
	setattr(df$q_85b6, 'label', 'Metastasis (6th place)')
	df[,q_85b7:=var]
	setattr(df$q_85b7, 'label', 'Metastasis (7th place)')
	return(df)
}

q97relabel_als<-function(df)
{
	vars<-c('q_97a', 'q_98')
	plyr::a_ply(vars,1,function(var) {refactor_variable(df, var, c('Yes', 'No','NA'))})
	return(df)
}

# q99convert_als<-function(df)
# {
# 	old_label<-Hmisc::label(df[['q_99c']])
# 	df[,q_99c:=as.character(levels(q_99c))[q_99c] ]
# 	setattr(df[['q_99c']],'label',old_label)
# 	rename_variable_name(df = df,
# 											 inputvar = 'q_99c',
# 											 newvarname = 'q_99.2b',
# 											 newlabel = 'Genomic study name 1',
# 											 oldlabel = 'If yes, which genomic studies')
#
# 	rename_variable_name(df = df,
# 											 inputvar = 'q_99b',
# 											 newvarname = 'q_99.2a',
# 											 newlabel = 'Was the patient included in other genomic studies',
# 											 oldlabel = 'Patient included in genomic studies')
#
# 	rename_variable_name(df = df,
# 											 inputvar = 'q_99a',
# 											 newvarname = 'q_99.1')
# 	df[,q_99.1:=as.character(levels(q_99.1))[q_99.1] ]
# 	return(df)
# }

q99convert_als<-function(df, startnr=1)
{
	if(startnr==1) {
		rename_variable_name(df = df,
												 inputvar = 'q_99a',
												 newvarname = 'q_99.1',
												 newlabel = 'Other genes',
												 oldlabel = 'Other genes')
		df<-convert_to_character(df = df, inputvar = "q_99.1", oldclass = "factor")

		rename_variable_name(df = df,
												 inputvar = 'q_99b',
												 newvarname = 'q_99.2a',
												 newlabel = 'Was the patient included in other genomic studies',
												 oldlabel = 'Patient included in genomic studies')

		rename_variable_name(df = df,
												 inputvar = 'q_99c',
												 newvarname = 'q_99.2b',
												 newlabel = 'Genomic study name 1',
												 oldlabel = 'If yes, which genomic studies')

		df$q_99.2c<-rep(NA_character_, nrow(df))
		setattr(df$q_99.2c, 'label', 'Genomic study name 2')
	}

	for(i in startnr:14) {
		varname<-paste0('q_99.1', letters[i])
		if(varname %in% colnames(df)) {browser()}
		df[[varname]]<-rep(NA_character_, nrow(df))
		if(i %% 2 == 1) {
			setattr(df[[varname]], 'label', paste0('Other gene ', floor((i+1)/2) ))
		} else {
			setattr(df[[varname]], 'label', paste0('Gene ', floor((i+1)/2), ' result'))
		}
	}


	return(df)
}

q110conv_als<-function(df)
{
	rename_variable_name(df = df,
											 inputvar = 'q_110c',
											 newvarname = 'q_110d')
	rename_variable_name(df = df,
											 inputvar = 'q_110b',
											 newvarname = 'q_110c',
											 newlabel = 'With a monozygous twin',
											 oldlabel = 'With monozygous twin')
	rename_variable_name(df = df,
											 inputvar = 'q_110a',
											 newvarname = 'q_110b',
											 newlabel = 'Number of siblings and birth order',
											 oldlabel = 'Number of Siblings and birth order')

	df$q_110a<-NA_character_
	setattr(df$q_110a,'label','Number of children')

	return(df)
}


q110add_als<-function(df)
{
	df$q_110a<-NA_character_
	setattr(df$q_110a,'label','Number of children')

	return(df)
}

q110txt_als<-function(df)
{
	var<-df$q_110a
	df$q_110a<-as.character(var)
	copy_obj_attributes(var, df$q_110a)
	setattr(df$q_110a,'label','Number of children')
	return(df)
}

q121relabel<-function(df)
{
	relabel_variable(df=df,
									 inputvar = 'q_121a',
									 newlabel = 'Upper Limb surgery in the last years',
									 oldlabel = 'Upper Limb surgery in the last 5 years')
	return(df)
}

q149relabel_als<-function(df)
{
	vars<-c('q_149', 'q_149a', 'q_149b', 'q_149c', 'q_149d', 'q_149e', 'q_149f', 'q_149g', 'q_149h')
	plyr::a_ply(vars,1,function(var){refactor_variable(df, var, c('Yes', 'No', 'NA'))})
	return(df)
}

q152relabel_als<-function(df)
{
	vars<-c('q_152a', 'q_152b','q_152c','q_152d','q_152e','q_152f','q_152g','q_152h')
	plyr::a_ply(vars,1,function(var) {refactor_variable(df, var, c('Yes','No','NA'))})
	return(df)
}

q156relabel_als<-function(df)
{
	#browser()

	vars<-c('q_156a', 'q_156b','q_156c','q_156d','q_156e','q_156f','q_156g','q_156h')
	plyr::a_ply(vars,1,function(var) {refactor_variable(df, var, c('Yes','No','NA'))})
	return(df)
}

q105text_als<-function(df) {
	df<-convert_pure_NA(df, '^q_105.$','S')
	return(df)
}

q106text_als<-function(df) {
	df<-try_to_enforce_numeric(df, '^q_106\\..c$')
	df<-convert_pure_NA(df, '^q_106\\.[12]b$', 'S')
	df<-convert_pure_NA(df, '^q_106\\.[3-9][ab]$', 'S')
	return(df)
}

# q110text_als<-function(df) #Używane dla konwersji ANTA
# {
# 	df<-try_to_enforce_numeric(df, '^q_110a$')
# }

q112text_als<-function(df) {
	df<-try_to_enforce_numeric(df, '^q_112.\\.[24]$')
	df<-try_to_enforce_numeric(df, '^q_113.\\.2$')
	return(df)
}

q149text_als<-function(df) {
	df<-convert_pure_NA(df, '^q_149$', 'S')
	return(df)
}

q154text_als<-function(df) {
	df<-convert_pure_NA(df, '^q_154g$', 'S')
	return(df)
}

q151text_als<-function(df) {
	df<-try_to_enforce_numeric(df, '^q_151$')
	df<-try_to_enforce_numeric(df, '^q_155$')
	return(df)
}

q36text_als<-function(df) {
	df<-convert_pure_NA(df, '^q_36c$', 'S')
	return(df)
}

q3text_als<-function(df) {
	df<-convert_pure_NA(df, '^q_3b$', 'S')
	return(df)
}

q45text_als<-function(df) {
	df<-try_to_enforce_numeric(df, '^q_45[abc]$')
	return(df)
}

q47text_als<-function(df) {
	df<-try_to_enforce_numeric(df, '^q_47[abc]$')
	return(df)
}

q49text_als<-function(df) {
	df<-try_to_enforce_numeric(df, '^q_49c$')
	df<-try_to_enforce_numeric(df, '^q_50b$')
	return(df)
}

q52types_als<-function(df) {
	df<-convert_pure_NA(df, '^q_52[de]$', 'N')
	return(df)
}

q53text_als<-function(df) {
	df<-try_to_enforce_numeric(df, '^q_5[3-9][abc]$')
	return(df)
}

q66text_als<-function(df) {
	df<-try_to_enforce_numeric(df, '^q_6[6789]$')
	df<-try_to_enforce_numeric(df, '^q_7[0123]$')
	return(df)
}

q71text_als<-function(df) {
	df<-try_to_enforce_numeric(df, '^q_7[12]$')
	return(df)
}

q88text_als<-function(df) {
	#browser()
	df<-try_to_enforce_numeric(df, '^q_88[bde]$')
	return(df)
}

q99text_als<-function(df) {
	df<-convert_pure_NA(df, '^q_99\\.1.$', 'S')
	df<-convert_pure_NA(df, '^q_99\\.2[bc]$', 'S')
	return(df)
}

conv_to_DateTime<-function(df) {
	df<-convert_Numeric_to_Date(df, '^q_1[1-5]$')
	df<-convert_Numeric_to_Date(df, '^q_[45]$')
	df<-convert_Numeric_to_Date(df, '^q_52f$')
}

lisb_add_lp<-function(df) {
	df$lp<-seq(nrow(df))
#	df[,lp:=seq(nrow(df))]
	return(df)
}

lisb_numeric_control<-function(df) {
	#browser()
	df<-convert_pure_NA(df, 'q_29b', 'N')
	df<-convert_pure_NA(df, '^q_44\\..c$', 'N')
	df<-convert_pure_NA(df, '^q_5[01][a-v]\\.[24]$', 'N')
	return(df)
}

lisb_numeric_als<-function(df) {
	#browser()
	df<-convert_pure_NA(df, 'q_106\\.[5-9]c', 'N')
	df<-convert_pure_NA(df, '^q_11[23][a-v]\\.[42]$', 'N')
	return(df)
}

lisb_text_control<-function(df) {
	#browser()
	df<-convert_pure_NA(df, 'q_24b' , 'S')
	df<-convert_pure_NA(df, 'q_29c' , 'S')
	df<-convert_pure_NA(df, 'q_32b' , 'S')
	df<-convert_pure_NA(df, 'q_34b' , 'S')
	df<-convert_pure_NA(df, 'q_35b' , 'S')
	df<-convert_pure_NA(df, 'q_37\\.[12][a-j]' , 'S')
	df<-convert_pure_NA(df, 'q_3[89][h-j]' , 'S')
	df<-convert_pure_NA(df, '^q_3b$' , 'S')
	df<-convert_pure_NA(df, 'q_4[0-3][b-l]' , 'S')
	df<-convert_pure_NA(df, 'q_44\\.[5-9][ab]' , 'S')
	return(df)
}
