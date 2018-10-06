do_model_woe_remote<-function(srv_loc, rownr, all_regs, parallel_cpus=NULL, save_folder="~/cache/regresje"){

  filename<-pathcat::path.cat(save_folder, paste0('modelwoe_db', padded_count(rownr, length(all_regs)),'.rds'))
  if(is.null(parallel_cpus)) {
    parallel_cpus<-srv_loc$cpu_cores
  }
  jobs<-list()
  jobs<-c(jobs, srv_loc$send_objects(job_name = "Send variables", named_list_of_objects = list(filename=filename,
                                                                                               parallel_cpus=parallel_cpus,
                                                                                               padded_count=padded_count,
                                                                                               save_folder=save_folder)))

  jobs<-c(jobs, srv_loc$execute_job(job_name = "Reading in prepared database", expression = {
    obj=readRDS(filename)
    woes<-obj$woes
    depvar<-obj$depvar
    mybins<-obj$bins
    args<-obj$args
    dropped<-list(consts=obj$consts, almost_consts=obj$almost_consts, colinear=obj$colinear)

    rm(obj)

    doMC::registerDoMC(cores=parallel_cpus)
    time<-system.time(
      mod.cv<-glmnet::cv.glmnet(x = woes, y = depvar, family = 'binomial', standardize = TRUE, type = 'auc',
                                nfolds=16,  parallel=parallel_cpus>1))[[3]]

    adf <- data.frame(lasso_prob_min = as.numeric(predict(mod.cv, type="response", newx=woes, s = 'lambda.min')),
                      lasso_prob_1se = as.numeric(predict(mod.cv, type="response", newx=woes, s = 'lambda.1se')),
                      depvar = depvar)

    pred_min <- ROCR::prediction(adf$lasso_prob_min, depvar)
    pred_1se <- ROCR::prediction(adf$lasso_prob_1se, depvar)
    auc_min <- ROCR::performance(pred_min,"auc")
    auc_1se <- ROCR::performance(pred_1se,"auc")

    depwalker:::save.large.object(list(mod=mod.cv, bins=mybins, args=args, depvar=depvar,
                                       dropped=dropped,
                                       perf=list(auc_min=as.numeric(auc_min@y.values),
                                                 auc_1se=as.numeric(auc_1se@y.values)), perf_df = adf),
                                  flag_use_tmp_storage = FALSE,
                                  file = pathcat::path.cat(save_folder, paste0('modelwoe_', padded_count(rownr,20), '.rds')))
  }))
  return(jobs)
}


prepare_woe_db<-function(rownr, all_regs, iv_threshold=0, flag_tmpsave_local=FALSE) {
  cat('Reading database...\n')
  dt<-read_all()
  cat('Preparing database...\n')
  one_rec <- all_regs[[rownr]]
  args<-list(
    filtr=one_rec$filtr,
    zn=one_rec$indepvars,
    zz=one_rec$depvar)
  hash <- gen_serial(args)
  args$zn_labs<-get_labels_var(args$zn, dt)
  args$zz_labs<-get_labels_var(args$zz, dt)
  args$filtr_lab <- get_filter_label(args$filtr, dt)


  fullargs<-expand_args(dt_colnames = colnames(dt), args)
  if(nchar(fullargs$filtr$filtr)>0){
    mydt <- dt %>%filter_(fullargs$filtr$filtr)
  } else {
    mydt <- dt
  }
  mydt <- mydt %>% select_(.dots=c(args$zz, args$zn)) %>% as.data.table()
  orig_depvar<-mydt[[args$zz]]
  depvar <- as.integer(orig_depvar)-as.integer(1)
  mydt <- mydt %>% rename_(zz=args$zz) %>% select(-zz)

  if(length(unique(depvar))!=2)
  {
    return('Nie umiem robić modeli nie-logistycznych')
  }

  uniques<-map_dbl(mydt, ~length(unique(.)))

  to_remove<-colnames(mydt)[uniques<2]
  mydt<-mydt %>% select(-one_of(to_remove))

  smallests<-map2_dbl(mydt, uniques[uniques>=2], ~if(.y==2) {sort(table(.x))[[1]]}else{1000})

  to_remove2<-colnames(mydt)[smallests<=1]

  mydt<-mydt %>% select(-one_of(to_remove2))

  cat('Binning the variables...\n')
  mybins <- binnr::bin(data = mydt,
                       y = depvar,
                       mono = 0, max.bin=20)

  cat('Removing too correlated variables...')
  cc <- mybins$cluster()
  to_drop <- mybins$prune_clusters(cc, 0.90, 1)

  # browser()
  # cat(paste0('Removing to weak variables (threshold=', iv_threshold,')...'))
  # ivs<-map_dbl(mybins$variables, ~.$tf@repr$Total[,'IV'])

  #mybins$drop(names(mybins$variables)[ivs<iv_threshold])


  #fit<-mybins$fit("model 1", "Initial fit with all variables")
  cat('Calculating WoE...\n')
  woes<-mybins$predict(type='woe')

  depwalker:::save.large.object(
    list(woes=woes, depvar=depvar, bins=mybins, args=args, orig_depvar=orig_depvar,
         consts=to_remove, almost_consts=to_remove2, colinear=to_drop),
    pathcat::path.cat(model_dirname(), paste0('modelwoe_db', padded_count(rownr, length(all_regs)),'.rds')), wait = TRUE,
    flag_use_tmp_storage = flag_tmpsave_local)
}

model_dirname<-function() {
  return('cache/regresje')
}

do_model_woe<-function(rownr, all_regs, parallel_cpus=1, flag_prepare_db_only=FALSE, flag_tmpsave_local=FALSE){
  filename<-pathcat::path.cat(model_dirname(), paste0('modelwoe_db', padded_count(rownr, length(all_regs)),'.rds'))
  if(!file.exists(filename)) {
    cat('Preparing the database...\n')
    if(flag_prepare_db_only) {
      time<-system.time(
        prepare_woe_db(rownr, all_regs)
      )[[3]]
    } else {
      time<-system.time(
        job<-parallel::mcparallel(prepare_woe_db(rownr, all_regs, flag_tmpsave_local = flag_tmpsave_local),
                                  detached = FALSE))[[3]]
      ans<-parallel::mccollect(job)
    }

    if(!file.exists(filename)) {
      cat("No model prepared!")
      return()
    }
    cat(paste0("Model preparation for rownr ", rownr, " took ", time/60, " minutes.\n"))
  }
  if(flag_prepare_db_only) {
    return()
  }
  cat('Reading in prepared database...\n')
  obj<-readRDS(filename)
  woes<-obj$woes
  depvar<-obj$depvar
  mybins<-obj$bins
  args<-obj$args
  dropped<-list(consts=obj$consts, almost_consts=obj$almost_consts, colinear=obj$colinear)

  rm(obj)


  cat('Fitting the model with cross validation...\n')
  doMC::registerDoMC(cores=parallel_cpus)
  time<-system.time(
    mod.cv<-glmnet::cv.glmnet(x = woes, y = depvar, family = 'binomial', standardize = TRUE, type = 'auc',
                              nfolds=16,  parallel=parallel_cpus>1))[[3]]

  cat(paste0("GLMNET fitting for rownr ", rownr, " took ", time/60, " minutes.\n\n"))

  cat('Preparing performance dataset...\n')

  adf <- data.frame(lasso_prob_min = as.numeric(predict(mod.cv, type="response", newx=woes, s = 'lambda.min')),
                    lasso_prob_1se = as.numeric(predict(mod.cv, type="response", newx=woes, s = 'lambda.1se')),
                    depvar = depvar)

  pred_min <- ROCR::prediction(adf$lasso_prob_min, depvar)
  pred_1se <- ROCR::prediction(adf$lasso_prob_1se, depvar)
  auc_min <- ROCR::performance(pred_min,"auc")
  auc_1se <- ROCR::performance(pred_1se,"auc")

  cat('Saving...\n')
  depwalker:::save.large.object(list(mod=mod.cv, bins=mybins, args=args, depvar=depvar,
                                     dropped=dropped,
                                     perf=list(auc_min=as.numeric(auc_min@y.values),
                                               auc_1se=as.numeric(auc_1se@y.values)), perf_df = adf),
                                flag_use_tmp_storage = flag_tmpsave_local,
                                file = pathcat::path.cat(model_dirname(), paste0('modelwoe_', padded_count(rownr,20), '.rds')))
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

  for(i in seq(2, nrow(levels))) {
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

#Recodes into WoE
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

#Recodes into WoE
prepare_hybrid_db_remote<-function(srv_loc, rownr, all_regs, save_folder="~/cache/regresje") {
  cat('Reading ing database...\n')
  dt <- read_all()
  jobs<-send_db(srv_loc, dbvar = 'dt')

  cat('Preparing database...\n')
  one_rec <- all_regs[[rownr]]
  args<-list(
    filtr=one_rec$filtr,
    zn=one_rec$indepvars,
    zz=one_rec$depvar)
  hash <- gen_serial(args)
  args$zn_labs<-get_labels_var(args$zn, dt)
  args$zz_labs<-get_labels_var(args$zz, dt)
  args$filtr_lab <- get_filter_label(args$filtr, dt)

  fullargs<-expand_args(dt_colnames = colnames(dt), args)

  cat('Sending objects...\n')
  jobs<-c(jobs, srv_loc$send_objects(job_name = "Sending objects",
                                     named_list_of_objects = list(fullargs=fullargs, args=args,
                                                                  rownr=rownr, all_regs=all_regs,
                                                                  save_folder=save_folder,
                                                                  padded_count=padded_count,
                                                                  regression_recode_binary_1=regression_recode_binary_1,
                                                                  regression_recode_factor_1=regression_recode_factor_1,
                                                                  regression_recode_ordinal=regression_recode_ordinal,
                                                                  parallel_cpus=srv_loc$cpu_cores)))

  jobs<-c(jobs, srv_loc$execute_job(job_name = "Filtering db", expression = {
    library(dplyr)
    library(data.table)
    library(purrr)
    if(nchar(fullargs$filtr$filtr)>0){
      mydt <- dt %>%filter_(fullargs$filtr$filtr)
    } else {
      mydt <- dt
    }
    mydt <- mydt %>% select_(.dots=c(args$zz, args$zn)) %>%
      as.data.table()
    mydt <- mydt %>%rename_(zz=args$zz) %>% filter(!is.na(zz))
    depvar <- regression_recode_binary_1(varname = 'zz', dt = mydt)[[1]]
    if(length(unique(depvar))!=2)
    {
      return('Nie umiem robić modeli nie-logistycznych')
    }

    mydt <- mydt %>% select(-zz)
    fobs<-map_dbl(args$zn, ~danesurowe::GetFOB(mydt[[.]], flag_recalculate_uniques = TRUE))

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
          browser() #Należy teraz wykorzystać te dane, czyli włożyć je do bd
        }
      }
    }

    mydt<-ans2

    if(sum(is.na(ans2))!=0) {
      stop("Coś nie tak poszło z usuwaniem braków")
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

    depwalker:::save.large.object(
      list(db=woes, depvar=depvar, imputes=imputes, args=args,
           consts=to_remove, almost_consts=to_remove2, colinear=character(0)),
      flag_use_tmp_storage = FALSE,
      file = pathcat::path.cat(save_folder, paste0('modelhybrid_db', padded_count(rownr, length(all_regs)),'.rds')), wait = TRUE)
  }))
}

#Recodes into WoE
prepare_hybrid_db<-function(rownr, all_regs, parallel_cpus=1, flag_tmpsave_local=FALSE) {
  cat('Reading ing database...\n')
  dt <- read_all()
  cat('Preparing database...\n')
  one_rec <- all_regs[[rownr]]
  args<-list(
    filtr=one_rec$filtr,
    zn=one_rec$indepvars,
    zz=one_rec$depvar)
  hash <- gen_serial(args)
  args$zn_labs<-get_labels_var(args$zn, dt)
  args$zz_labs<-get_labels_var(args$zz, dt)
  args$filtr_lab <- get_filter_label(args$filtr, dt)




  fullargs<-expand_args(dt_colnames = colnames(dt), args)
  if(nchar(fullargs$filtr$filtr)>0){
    mydt <- dt %>%filter_(fullargs$filtr$filtr)
  } else {
    mydt <- dt
  }
  mydt <- mydt %>% select_(.dots=c(args$zz, args$zn)) %>%
    as.data.table()
  mydt <- mydt %>%rename_(zz=args$zz) %>% filter(!is.na(zz))
  depvar <- regression_recode_binary_1(varname = 'zz', dt = mydt)[[1]]
  if(length(unique(depvar))!=2)
  {
    return('Nie umiem robić modeli nie-logistycznych')
  }

  mydt <- mydt %>% select(-zz)
  fobs<-map_dbl(args$zn, ~danesurowe::GetFOB(mydt[[.]], flag_recalculate_uniques = TRUE))

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
        browser() #Należy teraz wykorzystać te dane, czyli włożyć je do bd
      }
    }
  }


  mydt<-ans2

  if(sum(is.na(ans2))!=0) {
    stop("Coś nie tak poszło z usuwaniem braków")
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

  depwalker:::save.large.object(
    list(db=woes, depvar=depvar, imputes=imputes, args=args,
         consts=to_remove, almost_consts=to_remove2, colinear=character(0)),
    flag_use_tmp_storage = flag_tmpsave_local,
    file = pathcat::path.cat(model_dirname(), paste0('modelhybrid_db', padded_count(rownr, length(all_regs)),'.rds')), wait = TRUE)
}



do_model_hybrid_remote<-function(srv_loc, rownr, all_regs, save_folder="~/cache/regresje", parallel_cpus=NULL){
  filename<-pathcat::path.cat(save_folder, paste0('modelhybrid_db', padded_count(rownr, length(all_regs)),'.rds'))
  if(is.null(parallel_cpus)) {
    parallel_cpus<-srv_loc$cpu_cores
  }

  jobs<-list()
  jobs<-c(jobs, srv_loc$send_objects(job_name = "Send variables", named_list_of_objects = list(filename=filename,
                                                                                               padded_count=padded_count,
                                                                                               parallel_cpus=parallel_cpus,
                                                                                               save_folder=save_folder)))

  jobs<-c(jobs, srv_loc$execute_job(job_name = "Reading in prepared database", expression = {
    obj<-readRDS(filename)
    woes<-obj$db
    depvar<-obj$depvar
    imputes<-obj$imputes
    orig_depvar<-obj$orig_depvar
    dropped<-list(consts=obj$consts, almost_consts=obj$almost_consts, colinear=obj$colinear)
    args<-obj$args
    rm(obj)
    gc()

    doMC::registerDoMC(cores=parallel_cpus)
    mod.cv<-glmnet::cv.glmnet(x = woes, y = depvar, family = 'binomial', type = 'auc',
                              nfolds=16, parallel=parallel_cpus>1, standardize=TRUE)

    adf <- data.frame(lasso_prob_min = as.numeric(predict(mod.cv, type="response", newx=woes, s = 'lambda.min')),
                      lasso_prob_1se = as.numeric(predict(mod.cv, type="response", newx=woes, s = 'lambda.1se')),
                      depvar = depvar)

    pred_min <- ROCR::prediction(adf$lasso_prob_min, as.numeric(depvar))
    pred_1se <- ROCR::prediction(adf$lasso_prob_1se, as.numeric(depvar))
    auc_min <- ROCR::performance(pred_min,"auc")
    auc_1se <- ROCR::performance(pred_1se,"auc")

    depwalker:::save.large.object(list(mod=mod.cv, bins=NULL, args=args, depvar=depvar,
                                       dropped=dropped, orig_depvar=orig_depvar,
                                       perf=list(auc_min=as.numeric(auc_min@y.values),
                                                 auc_1se=as.numeric(auc_1se@y.values)),
                                       perf_df = adf, imputes=imputes),
                                  flag_use_tmp_storage = FALSE,
                                  file = pathcat::path.cat(save_folder, paste0('modelhybrid_', padded_count(rownr,20), '.rds')))
    1
  }))
  return(jobs)
}

do_model_hybrid<-function(rownr, all_regs, parallel_cpus=1, flag_prepare_db_only=FALSE, flag_tmpsave_local=FALSE){
  filename<-pathcat::path.cat(model_dirname(), paste0('modelhybrid_db', padded_count(rownr, length(all_regs)),'.rds'))
  if(!file.exists(filename)) {
    cat('Preparing the database...\n')
    if(flag_prepare_db_only) {
      time<-system.time(
        prepare_hybrid_db(rownr, all_regs)
      )[[3]]
    } else {
      time<-system.time(
        job<-parallel::mcparallel(prepare_hybrid_db(rownr, all_regs, parallel_cpus = parallel_cpus,
                                                    flag_tmpsave_local=flag_tmpsave_local),
                                  detached = FALSE))[[3]]
      ans<-parallel::mccollect(job)
    }

    if(!file.exists(filename)) {
      cat("No model prepared!")
      return()
    }
    cat(paste0("Model preparation for rownr ", rownr, " took ", time/60, " minutes.\n"))
  }
  if(flag_prepare_db_only) {
    return()
  }



  obj<-readRDS(filename)
  woes<-obj$db
  depvar<-obj$depvar
  imputes<-obj$imputes
  orig_depvar<-obj$orig_depvar
  dropped<-list(consts=obj$consts, almost_consts=obj$almost_consts, colinear=obj$colinear)
  args<-obj$args
  rm(obj)
  gc()

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

  cat('Saving...\n')
  depwalker:::save.large.object(list(mod=mod.cv, bins=NULL, args=args, depvar=depvar,
                                     dropped=dropped, orig_depvar=orig_depvar,
                                     perf=list(auc_min=as.numeric(auc_min@y.values),
                                               auc_1se=as.numeric(auc_1se@y.values)),
                                     perf_df = adf, imputes=imputes),
                                flag_use_tmp_storage = flag_tmpsave_local,
                                file = pathcat::path.cat(model_dirname(), paste0('modelhybrid_', padded_count(rownr,20), '.rds')))
}
