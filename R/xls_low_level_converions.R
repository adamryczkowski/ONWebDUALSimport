#Funkcja zamieniająca pytanie jednokrotnego wyboru na pytania wielokrotnego wyboru
#
#map: list: level -> varname
#yesno=TRUE: coding 1 - yes, 2 - no
#yesno=FALSE: coding 1 - no, 2 - yes
#
#
#example:
#
#df<-data.table(q1=c(1,2,3,2,2,3),q2=1:6)
#map<-list('1'='q1a', '2'='q1b', '3'='q1c')
#inputvar<-'q1'
#single2multiple(df, 'q1', map)

single2multiple<-function(df, inputvar, map, levels, yesno=TRUE)
{
	for (i in seq_along(map))
	{
		var<-map[[i]][[1]]
		label<-map[[i]][[2]]
		level<-names(map)[[i]]
		fn=parse(text=paste0('factor(ifelse(',inputvar,'==level,', ifelse(yesno, '1,2', '2,1'),'), levels=levels)'))
		df[,(var):=eval(fn)]
		setattr(df[[var]], 'label', label)
	}
	df[,(inputvar):=NULL]
}

convert_to_numeric<-function(df, inputvar)
{
	fn=parse(text=inputvar)
	var=df[[inputvar]]

	df[,(inputvar):=as.numeric(eval(fn))]

	copy_attributes(var, df, inputvar, ignore_attrs = c('class', 'labels', 'levels'), add_attrs = list('f.o.b'=0))
}

convert_to_character<-function(df, inputvar, oldclass)
{
	vec1<-colnames(df)
	hits1<-stringr::str_detect(string = vec1, pattern = inputvar)
	for(hit in vec1[hits1]) {
		var<-df[[hit]]

		if(class(var)!='character') {
			if(!oldclass %in% class(var)) {
				stop(paste0("Zła klasa oryginalna w convert_to_character dla zmiennej ", hit,
										". Powinna być ", paste0(class(var), collapse=', ' )))
			}

			df[,(inputvar):=as.character(var)]

			copy_attributes(var, df, inputvar, ignore_attrs = c('class', 'labels', 'levels'), add_attrs = list('f.o.b'=0))
		}
	}
	return(df)

}

rename_variable_name<-function(df, inputvar, newvarname, newlabel=NULL, oldlabel=NULL)
{
#	fn=parse(text=inputvar)
#	browser()
#	df[[newvarname]]<-eval(fn)
#	df[,(newvarname):=eval(fn)]
	if (!is.null(newlabel))
	{
		if (!is.null(Hmisc::label(df[[inputvar]])) && !is.null(oldlabel))
		{
			if (!(Hmisc::label(df[[inputvar]]) %in% c(newlabel,oldlabel)))
			{
				txt<-paste0("Expected label '", oldlabel, "' appears to be different prior change: '", Hmisc::label(df[[inputvar]]), "'!")
				browser()
				stop(txt)
			}
		}
	}
	var<-df[[inputvar]]
	setnames(df, inputvar, newvarname)
	copy_var_attributes(var_source = var, dt_dest = df, var_dest_name = newvarname)
	if(!is.null(newlabel)) {
		setattr(df[[newvarname]], 'label', newlabel)
	}

	#	df[,(inputvar):=NULL]
	return(df)
}

refactor_variable<-function(df, inputvar, newlabels)
{
	if (is.null(df[[inputvar]]))
		browser()
	if (length(newlabels)==0)
	{
		browser()
	} else {
		setattr(df[[inputvar]],'levels', newlabels)
	}
}

relabel_variable<-function(df, inputvar, newlabel, oldlabel)
{
	if(!inputvar %in% colnames(df)) {
		stop(paste0("There is no ", inputvar, " among columns of df"))
	}
	if (!is.null(Hmisc::label(df[[inputvar]])))
	{
		if (!(Hmisc::label(df[[inputvar]]) %in% c(newlabel,oldlabel)))
		{
			txt<-paste0("Expected label '", oldlabel, "' appears to be different prior change: '", Hmisc::label(df[[inputvar]]), "'!")
			browser()
			stop(txt)
		}
	}
	setattr(df[[inputvar]], 'label', newlabel)
	return(df)
}

convert_Numeric_to_Date<-function(df, prefix, varclass) {
	vec1<-colnames(df)
	hits1<-stringr::str_detect(string = vec1, pattern = prefix)
	for(hit in vec1[hits1]) {
		var<-df[[hit]]
		if('numeric' %in% class(var) || 'integer' %in% class(var) || 'POSIXct' %in% class(var)) {
			var<-as.Date(var, origin="1899-12-30")
		} else if ('Date' %in% class(var)) {
			#do nothing
		} else {
			stop(paste0("Wrong class for variable ", hit, ". Expected numeric or integer, but got ", paste0(class(var), collapse = ', ')))
		}
		df[[hit]]<-var
		copy_attributes(var, df, hit, ignore_attrs = c('class', 'labels', 'levels'), add_attrs = list('f.o.b'=0))
	}
	return(df)
}


convert_pure_NA<-function(df, prefix, varclass) {
	vec1<-colnames(df)
	hits1<-stringr::str_detect(string = vec1, pattern = prefix)
	for(hit in vec1[hits1]) {
		var<-df[[hit]]
		if('character' %in% class(var)) {
			var[var=='NA']<-NA_character_
		}
		if(all(is.na(var))) {
			if(varclass=='S') {
				df[[hit]]<-as.character(NA)
			} else if (varclass=='N') {
				df[[hit]]<-as.numeric(NA)
			} else if (varclass=='D') {
				df[[hit]]<-as.Date(NA)
			} else {
				stop("Unkown class")
			}
			copy_attributes(var, df, hit, ignore_attrs = c('class', 'labels', 'levels'), add_attrs = list('f.o.b'=0))
		}
	}
	return(df)
}

#Tries hard to make the variable numeric
try_to_enforce_numeric<-function(df, prefix) {
	vec1<-colnames(df)
	hits1<-stringr::str_detect(string = vec1, pattern = prefix)
	for(hit in vec1[hits1]) {
		var<-df[[hit]]
		if('character' %in% class(var)) {
			var[var=='NA']<-NA_character_
			var[var=='NF']<-NA_character_
			var[var=='NR']<-NA_character_
			ans<-tryCatch({a<-as.numeric(var);'OK'},
							 warning=function(w) 'char')
			if(ans=='OK') {
				df[[hit]]<-a
				copy_attributes(var, df, hit, ignore_attrs = c('class', 'labels', 'levels'), add_attrs = list('f.o.b'=0))
			}
		}
	}
	return(df)
}
