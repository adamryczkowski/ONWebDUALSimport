


#funkcja, która liczy
do_regression<-function(dt, depvar, iv_names) {
  woes<-data.matrix(dt)
  parallel_cpus<-4
  cat('Fitting the model with cross validation...\n')
  library(doMC)
  doMC::registerDoMC(cores=parallel_cpus)
  mod.cv<-glmnet::cv.glmnet(x = woes, y = depvar, family = 'gaussian',
                            nfolds=16, parallel=parallel_cpus>1, standardize=TRUE)

  adf <- data.frame(lasso_prob_min = as.numeric(predict(mod.cv, type="response", newx=woes, s = 'lambda.min')),
                    lasso_prob_1se = as.numeric(predict(mod.cv, type="response", newx=woes, s = 'lambda.1se')),
                    depvar = depvar)

  return(list(mod=mod.cv, depvar=depvar,perf_df = adf))
}
