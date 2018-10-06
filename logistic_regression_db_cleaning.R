library(data.table)
db<-nodupdb<-joined_df[!duplicated(joined_df$q_0),]

#1.	Bulbar (pyt. 16), upper limb, lower limb onset
#   (pyt. 16: limb onset oraz pyt. 48a: cervical=upper limb, lumbar=lower limb);
#   Jeśli pacjent w pytaniu 36a ma co innego niż 1, 2, 3 albo 4 – brak danych.
#   Jeśli w 16b jest tak, to przyjmujemy Bulbar i koniec.
#   Jeśli w 16a jest tak, to patrzymy na pytanie 49a.
#   Jeśli 49a = Cervical -> Upper Limb.
#   Jeśli 49a = Lumbo-sacral-> Lower Limb. Brak danych w innym razie.



flags2=(db$q_16b=='Yes' & !is.na(db$q_36a)) #bulbat
flags1=(!flags2 & db$q_16a=='Yes' & db$q_49a=='Cervical' & !is.na(db$q_36a)) #lower limb
flags3=(!flags2 & !flags3 & db$q_16a=='Yes' & db$q_49a=='Lumbo-sacral' & !is.na(db$q_36a)) #upper limb
ans=flags1*1 + flags2*2 + flags3*3
db[,depvar1:=factor(ifelse(ans==0, NA, ans), labels=c("Bulbar", 'Upper limb', 'Lower limb'),  levels=1:3)]
setattr(db$depvar1, 'label', 'Fenotype classification 1')

# 2. UMN or LMN involvement on onset (pyt. 17).
#    Jeśli pacjent w pytaniu 36a ma co innego niż 1, 2, 3 albo 4 – brak danych.
#    Dla każdej grupy pyt 17 po jednej grupie fenotypu: UMN, LMN, UMN+LMN

flags1=(!is.na(db$q_36a) & db$q_17=="UMN")
flags2=(!is.na(db$q_36a) & db$q_17=="LMN")
flags3=(!is.na(db$q_36a) & db$q_17=="UMN+LMN")
ans=flags1*1 + flags2*2 + flags3*3
db[,depvar2:=factor(ifelse(ans==0, NA, ans), labels=c("UMN", 'LMN', 'UMN+LMN'),  levels=1:3)]
setattr(db$depvar2, 'label', 'Fenotype classification 2')

db[,iv1:=db$q_51_1.score]
db[,iv2:=db$q_51_1.1 + db$q_51_1.2 + db$q_51_1.3]
setattr(db$iv2, 'label', "ALSFRS Speech, Salivation and Swallowing")
db[,iv3:=db$q_51_1.4 + db$q_51_1.5 + db$q_51_1.6]
setattr(db$iv3, 'label', "ALSFRS Handwriting, Cutting Food and Hygiene")
db[,iv4:=db$q_51_1.7 + db$q_51_1.8 + db$q_51_1.9]
setattr(db$iv4, 'label', "ALSFRS Turning in Bed, Walking and Climbing Stairs")
db[,iv5:=db$q_51_1.10 + db$q_51_1.11 + db$q_51_1.12]
setattr(db$iv5, 'label', "ALSFRS Dyspnea, Orthopnea and Respiratory insufficiency")
db[,iv6:=db$q_51_1.rate]

db[,iv7:=(as.numeric(db$q_11 - db$q_5)/365.25)]
setattr(db$iv5, 'label', "Age at first symptoms")

src_vars=c('q_73', 'q_74', 'q_75', 'q_76', 'q_77', 'q_78', 'q_79', 'q_80', 'q_81', 'q_82', 'q_83', 'q_84')
dst_vars=paste0('iv', seq(8, 7 + length(src_vars)))

for(i in seq_along(src_vars)) {
  src_var=src_vars[[i]]
  dst_var=dst_vars[[i]]
  db[,(dst_var):=db[[src_var]]]
}

flags = dplyr::coalesce(db$q_85a_1!='No', FALSE) |
  dplyr::coalesce(db$q_85a_2!='No', FALSE) |
  dplyr::coalesce(db$q_85a_3!='No', FALSE)

db[,iv20:=factor(flags, labels=c("No cancer", "Any cancer"), levels=c(FALSE,TRUE))]
setattr(db$iv20, 'label', "Cancer")

db[,iv21:=db$q_138]
db[,iv22:=db$q_139]
db[,iv23:=factor(db$q_139=='Yes' | db$q_138 == 'Yes', labels=c('No', 'Yes'), levels=c(FALSE, TRUE))]
setattr(db$iv23, 'label', 'Emotional stress')


db[,iv24:=db$q_20]
db[,iv25:=db$q_21]
db[,iv26:=db$q_22]
db[,iv27:=db$q_23]
db[,iv28:=db$q_37]
db[,iv29:=db$q_38.1a]
db[,iv30:=db$q_38.1b]
db[,iv31:=factor(db$q_38.1a=='Yes' | db$q_38.1b == 'Yes', labels=c('No', 'Yes'), levels=c(FALSE, TRUE))]
setattr(db$iv31, 'label', 'Resting tremor')
db[,iv32:=db$q_38.2a]
db[,iv33:=db$q_38.2b]
db[,iv34:=factor(db$q_38.2a=='Yes' | db$q_38.2b == 'Yes', labels=c('No', 'Yes'), levels=c(FALSE, TRUE))]
setattr(db$iv34, 'label', 'Bradykinesia')
db[,iv35:=db$q_39]
db[,iv36:=db$q_40]
db[,iv37:=db$q_41]
db[,iv38:=db$q_42]
db[,iv39:=db$q_43]
db[,iv40:=db$q_44]

db[,iv41:=db$q_89a]
db[,iv42:=db$q_90a]
db[,iv43:=db$q_91a]
db[,iv44:=db$q_92a]
db[,iv45:=db$q_93a]
db[,iv46:=db$q_94a]
db[,iv47:=db$q_95a]
db[,iv48:=db$q_96a]

db[,iv49:=db$q_100a_1]
setattr(db$iv49, 'f.o.b', 1)
db[,iv50:=db$q_101a_1]
setattr(db$iv50, 'f.o.b', 1)
db[,iv51:=db$q_102a_1]
setattr(db$iv51, 'f.o.b', 1)
db[,iv52:=db$q_103a_1]
setattr(db$iv52, 'f.o.b', 1)
db[,iv53:=db$q_104a_1]
setattr(db$iv53, 'f.o.b', 1)

db[,iv54:=factor(db$q_115=='Yes' |
                   db$q_116 == 'Yes' |
                   db$q_117a == 'Yes' |
                   db$q_117b == 'Yes' |
                   db$q_117c == 'Yes' |
                   db$q_118a == 'Yes' |
                   db$q_118b == 'Yes' |
                   db$q_118c == 'Yes' , labels=c('No', 'Yes'), levels=c(FALSE, TRUE))]
setattr(db$iv54, 'label', 'Trauma')


db[,iv55:=factor(db$q_119a == 'Yes' |
                   db$q_119b == 'Yes' |
                   db$q_119c == 'Yes' |
                   db$q_120a == 'Yes' |
                   db$q_120b == 'Yes' |
                   db$q_120c == 'Yes' |
                   db$q_121a == 'Yes' |
                   db$q_121b == 'Yes' |
                   db$q_122a == 'Yes' |
                   db$q_122b == 'Yes' |
                   db$q_123 == 'Yes' |
                   db$q_124 == 'Yes' |
                   db$q_125 == 'Yes' |
                   db$q_126 == 'Yes' |
                   db$q_127 == 'Yes' |
                   db$q_128 == 'Yes' |
                   db$q_129 == 'Yes' |
                   db$q_130 == 'Yes', labels=c('No', 'Yes'), levels=c(FALSE, TRUE))]

setattr(db$iv55, 'label', 'Surgery')


db[,dv1:=factor( (db$depvar1=='Bulbar'), labels=c('Not bulbar', 'Bulbar'), levels=c(FALSE, TRUE))]
setattr(db$dv1, 'label', 'Is fenotype bulbar')
db[,dv2:=factor( (db$depvar1=='Upper limb'), labels=c('Not upper limb', 'Upper limb'), levels=c(FALSE, TRUE))]
setattr(db$dv2, 'label', 'Is fenotype upper limb')
db[,dv3:=factor( (db$depvar1=='Lower limb'), labels=c('Not lower limb', 'Lower limb'), levels=c(FALSE, TRUE))]
setattr(db$dv3, 'label', 'Is fenotype lower limb')

db[,dv4:=factor( (db$depvar2=='UMN')*1+(db$depvar2=='LMN')*2, labels=c('UMN', 'LMN'), levels=c(1, 2))]
setattr(db$dv4, 'label', 'Fenotype classification 2')

args<-list(
  zn=paste0('iv', 1:55),
  zz=paste0('dv', 1:4))

mydd<-args$zz[[4]]
depvar <- regression_recode_binary_1(varname = mydd, dt = db)[[1]]
mydt<-as.data.frame(db) %>% select(args$zn) %>% filter(!is.na(depvar))
depvar<-depvar[!is.na(depvar)]

get_labels_var <- function(var, dt, flag_md=FALSE) {
  fn_get_var<-function(varname, dt) {
    if(varname %in% colnames(dt))
    {
      if(flag_md) {
        return(paste0('_', Hmisc::label(dt[[varname]]), '_'))
      } else {
        return(Hmisc::label(dt[[varname]]))
      }
    } else {
      zzfn <- eval(parse(text=paste0(varname,'()')))
      if (! 'wyliczenie' %in% class(zzfn)){
        stop(paste0("Brak funkcji wyliczającej ", varname))
      }
      if(flag_md) {
        return(paste0('_', zzfn$label, '_'))
      } else {
        return(zzfn$label)
      }
    }
    return(ans)
  }
  purrr::map_chr(var, fn_get_var, dt=dt)
}

args$zn_labs<-get_labels_var(args$zn, db)
args$zz_labs<-get_labels_var(args$zz, db)

regression_recode_binary_1 <- function(varname, dt, count_threshold=1) {
  var<-as.numeric(dt[[varname]])
  levels<-unique(var)
  levels<-levels[!is.na(levels)]
  mylabel<-danesurowe::GetVarLabel(dt, varname)
  newvar<-as.integer(var==levels[[2]])
  ans<-data.table(var=newvar)
  danesurowe::copy_var_attributes(dt[[varname]], var_dest_name = 'var', dt_dest = ans)
  data.table::setnames(ans, 'var',  varname)

  if(sum(is.na(var))>count_threshold) {
    newname<-paste0(varname,'_NA')
    ans[,(newname):=as.integer(is.na(var))]
    setattr(ans[[newname]], 'label', paste0('Braki danych w ',mylabel))
  }

  return(ans)
}

regression_recode_ordinal<-function(varnames, depvar, mydt) {
  cat('Binning the variables...\n')
  woedt <- mydt %>% select_(.dots = varnames)
  mybins <- binnr::bin(data = woedt,
                       y = depvar,
                       mono = 1, max.bin=20)
  woes<-mybins$predict(type = 'woe')

  ans<-as.data.table(woes)
  danesurowe::copy_dt_attributes(mydt, ans)
  return(list(df=ans, woe_info=mybins$variables))
}

padded_count<-function(n, ntotal) {
  ndigits<-floor(log10(ntotal))+1
  return(stringr::str_pad(n, ndigits, pad='0'))
}

regression_recode_factor_1<-function(varname, dt, count_threshold=1) {
  var<-dt[[varname]]
  mylabel<-danesurowe::GetVarLabel(dt, varname)
  levels<-as_tibble(table(var)) %>% filter(n>count_threshold)
  base_level<-arrange(levels, -n)$var[[1]]
  levels<-levels[2:nrow(levels),]
  newname<-paste0(varname,'_', padded_count(1, nrow(levels)))
  newvar<-as.integer(var==levels$var[[1]])
  newvar[is.na(newvar)]<-0
  ans<-data.table(var=newvar)
  data.table::setnames(ans, 'var',  newname)
  setattr(ans[[newname]], 'label', paste0(mylabel,' ',levels$var[[1]] ))

  for(i in seq(1, nrow(levels))) {
    newname<-paste0(varname,'_', padded_count(i, nrow(levels)))
    newvar<-as.integer(var==levels$var[[i]])
    newvar[is.na(newvar)]<-0
    ans[,(newname):=newvar]
    setattr(ans[[newname]], 'label', paste0(mylabel,' ',levels$var[[i]] ))
  }
  if(sum(is.na(var))>count_threshold) {
    newname<-paste0(varname,'_NA')
    ans[,(newname):=as.integer(is.na(var))]
    setattr(ans[[newname]], 'label', paste0('Braki danych w ',mylabel))
  }
  return(ans)
}

regression_recode_binary_1<-function(varname, dt, count_threshold=1) {
  var<-as.numeric(dt[[varname]])
  levels<-unique(var)
  levels<-levels[!is.na(levels)]
  mylabel<-danesurowe::GetVarLabel(dt, varname)
  newvar<-as.integer(var==levels[[2]])
  ans<-data.table(var=newvar)
  danesurowe::copy_var_attributes(dt[[varname]], var_dest_name = 'var', dt_dest = ans)
  data.table::setnames(ans, 'var',  varname)

  if(sum(is.na(var))>count_threshold) {
    newname<-paste0(varname,'_NA')
    ans[,(newname):=as.integer(is.na(var))]
    setattr(ans[[newname]], 'label', paste0('Braki danych w ',mylabel))
  }

  return(ans)
}


if(length(unique(depvar))!=2)
{
  return('Nie umiem robić modeli nie-logistycznych')
}

fobs<-purrr::map_dbl(args$zn, ~danesurowe::GetFOB(mydt[[.]], flag_recalculate_uniques = TRUE))

ordinals<-args$zn[fobs==2]
ans<-list()
if(length(ordinals)>0) {
  bins<-regression_recode_ordinal(ordinals, depvar, mydt)
  ans<-c(ans, bins$df)
}
nominals<-args$zn[fobs==1]
if(length(nominals)>0) {
  a<-flatten(purrr::map(nominals, regression_recode_factor_1, dt=mydt))
  ans<-c(ans,a)
}
binaries<-args$zn[fobs==3]
if(length(binaries)>0) {
  a<-flatten(purrr::map(binaries, regression_recode_binary_1, dt=mydt))
  ans<-c(ans,a)
}
numerics<-args$zn[fobs==0]
if(length(numerics)>0) {
  a<-mydt %>% select_(.dots=numerics) %>% as_tibble() %>% mutate_all(funs(as.numeric))
  #    a<-flatten(purrr::map(numerics, ~scale(mydt[[.]])))
  ans<-c(ans,a)
  missing_pattern<-mice::md.pattern(a)
  ans2<-as.data.table(ans)

  imputes<-NULL
  if(nrow(missing_pattern)>2) {
    if(nrow(mydt)>40000) {
      m<-missing_pattern[nrow(missing_pattern),1:ncol(missing_pattern)-1]
      vars_miss<-names(m[m>0])
      ms<-list()
      for(colname in vars_miss) {
        var<-ans2[[colname]]
        m<-mean(var, na.rm = TRUE)
        imputes<-c(imputes, list(sumNA=sum(is.na(var))))
        var[is.na(var)]<-m
        ms<-c(ms, list(m))
        ans2[,(colname):=as.numeric(var)]
      }
      imputes<-data.frame(varname=vars_miss, missing_count=unlist(imputes), mean=unlist(ms))

    } else {
      library(mice)
      imp<-mice::mice(ans2)
      ans2<-complete(imp)
    }
  }
}


mydt<-as.data.table(ans2)

if(sum(is.na(mydt))!=0) {
  good_vars<-which(map_int(mydt, ~sum(is.na(.)))==0)
  bad_vars<-which(map_int(mydt, ~sum(is.na(.)))!=0)
  stop(paste0("Coś nie tak poszło z usuwaniem braków dla zmiennych ", paste0(names(ans)[bad_vars], collapse = ', '), ". "))
  mydt<-select(mydt, -bad_vars)
}

uniques<-map_dbl(mydt, ~length(unique(.)))

to_remove<-colnames(mydt)[uniques<2]
if(length(to_remove)>0) {
  mydt[,(to_remove):=NULL]
}
#mydt<-mydt %>% select(-one_of(to_remove))

if(parallel_cpus>1) {
  options('mc.cores'=parallel_cpus)
  smallests<-parallel::mcmapply(
    function(i,l) {
      if(l==2) {
        sort(table(mydt[[i]]))[[1]]
      }else{
        1000
      }
    }, seq(ncol(mydt)), uniques[uniques>=2] )

} else {
  smallests<-map2_dbl(mydt, uniques[uniques>=2], ~if(.y==2) {sort(table(.x))[[1]]}else{1000})
}

to_remove2<-colnames(mydt)[smallests<=1]
if(length(to_remove2)>0) {
  mydt[,(to_remove2):=NULL]
}

woes<-data.matrix(mydt)
parallel_cpus<-4
cat('Fitting the model with cross validation...\n')
doMC::registerDoMC(cores=parallel_cpus)
mod.cv<-glmnet::cv.glmnet(x = woes, y = depvar, family = 'binomial', type = 'auc',
                          nfolds=16, parallel=parallel_cpus>1, standardize=TRUE)

cat('Preparing performance dataset...')

adf <- data.frame(lasso_prob_min = as.numeric(predict(mod.cv, type="response", newx=woes, s = 'lambda.min')),
                  lasso_prob_1se = as.numeric(predict(mod.cv, type="response", newx=woes, s = 'lambda.1se')),
                  depvar = depvar)

pred_min <- ROCR::prediction(adf$lasso_prob_min, as.numeric(depvar))
pred_1se <- ROCR::prediction(adf$lasso_prob_1se, as.numeric(depvar))
auc_min <- ROCR::performance(pred_min,"auc")
auc_1se <- ROCR::performance(pred_1se,"auc")
