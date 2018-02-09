#' Reads XLS entry format of the database
#'
#' @param filename Filename of the database
#' @return List with 2 elements: dataframe containing the read in cases with all the metadata
#'         and boolean indicating whether the read in file was control or ALS group
#' @export
read_file<-function(filename)
{
  cat(paste0("Reading ", filename, '...\n'))
  df<-as.data.frame(readxl::read_excel(filename,sheet=1,col_names=FALSE))

  if (!is.na(df[1,8]) && df[1,8]=='No' && !is.na(df[1,9]) && df[1,9]=='Question')
  {
    colfix<-11
    group<-'ALS'

  } else if (!is.na(df[1,11]) && df[1,11]=='No' && !is.na(df[1,12]) && df[1,12]=='Question')
  {
    colfix<-14
    group<-df[1,colfix-1]
  } else {
    stop("Unknown format")
  }

  cases<-which(!is.na(df[4,colfix:ncol(df)]))
  if (!is.na(df[4,ncol(df)]) && df[4,ncol(df)]=='x')
  {
    cases<-cases[1:(length(cases)-1)]
  }

  var_nrs<-df[5:nrow(df),colfix-3]
  vars<-which(!is.na(var_nrs))
  #browser()
  var_nrs<-as.character(var_nrs[vars])
  var_nrs<-c('0',var_nrs)

  var_names<-df[5:nrow(df),colfix-2]
  var_names<-as.character(var_names[vars])
  var_names<-c('id', var_names)

  var_types<-df[5:nrow(df),colfix-4]
  var_types<-as.numeric(var_types[vars])
  var_types<-c('1', var_types)

  vars<-c(0,vars)

  vardf<-data.table(id=var_nrs, label=var_names, type1=var_types)

  sheets<-readxl::excel_sheets(filename)
  if(sum(sheets=='labels')==0) {
    browser() #Nie ma zakładki labels
  }
  ldf<-as.data.frame(suppressWarnings(readxl::read_excel(filename,sheet=which.max(sheets=='labels'),col_names=FALSE)))
  lvars<-c(0,as.character(ldf[4,4:ncol(ldf)]))
  lcolumns<-c(0,which(!is.na(lvars) & lvars!='NA'))
  lvars<-lvars[lcolumns]
  lcounts<-as.numeric(ldf[2,3:ncol(ldf)])
  lcounts<-lcounts[lcolumns]
  vardf[,label_count:=as.numeric(lcounts)]

  lvarnames<-ldf[4,]
  colnames(ldf)[!is.na(lvarnames)]<-lvarnames[which(!is.na(lvarnames))]

  mydf<-data.table::data.table(lp=seq_along(cases), filename=filename)

  for (i in seq(1,nrow(vardf)))
  {
    if (lvars[[i]]!=vardf[['id']][[i]])
    {
      browser()
    }
    var_type<-var_types[[i]]
    if (var_type==3)
    {
      label_count<-vardf[['label_count']][[i]]
    } else {
      label_count<-0
    }
    var_name<-paste0('q_',vardf[['id']][[i]])
    #if(var_name == 'q_100b') browser()
    var_vec<-read_var(df, vars[[i]]+1,cases,colfix)
    var_label<-var_names[[i]]

    mydfl<-length(mydf)

    if(var_type==1) {
      mydf[,(var_name):=as.character(var_vec)]
    } else if (var_type==2) {
      mydf[,(var_name):=suppressWarnings(as.numeric(var_vec))]
    } else if (var_type==3) {
      if (label_count>0)
      {
        labels<-read_labels(ldf,vardf[['id']][[i]],label_count)
        mydf[,(var_name):=factor(var_vec,levels = labels)]
      } else {
        mydf[,(var_name):=as.character(var_vec)]
      }
    }

    if (length(mydf)==mydfl)
    {
      stop(paste0('Duplicate row ',i,", var_name=",var_name))
    }
    data.table::setattr(mydf[[var_name]], 'label',var_label)

  }
  #	plyr::a_ply(1:length(var_names),1,function(l){data.table::setattr(mydf[[l]], 'label',var_names[[l]])})

  data.table::setattr(mydf, 'label', paste0('`', basename(filename),'`'))

  return(list(df=mydf,group=group))
}

read_var<-function(df, varnr, cases, colfix)
{
  return(df[3+varnr,colfix-1+cases])
}

read_labels<-function(ldf, varname,count)
{
  return(as.character(ldf[[varname]][6:(6+count-1)]))
}
