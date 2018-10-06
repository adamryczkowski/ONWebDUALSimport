library(data.table)
contr.ltfr<-caret::contr.ltfr
joined_df<-readRDS('db_no_duplicates.rds')
ans<-select_variables_sep2018(joined_df)
dt<-ans$db
iv_names<-ans$iv_names
dv_names<-ans$dv_names
dv_name<-dv_names[[1]]



do_reg<-function(dt, iv_names, dv_name) {

  ads<-make_ads(dt, iv_names, dv_name, keep_nominal ='iv56')

  which(is.na(data.matrix(ads)),arr.ind = TRUE)

  groupvar<-ads$iv56
  cvIndex<-caret::createFolds(groupvar, 10, returnTrain = T)
  folds<-caret::groupKFold(groupvar, k = 3)

  tc <- caret::trainControl(index = cvIndex,
                            method = 'cv',
                            number = folds)

  rfFit <- caret::train(dv ~ ., data = ads,
                 method = "rf",
                 trControl = tc,
                 maximize = TRUE,
                 verbose = FALSE, ntree = 1000)

}

rf_fit <- caret::train(depvar ~ .,
                data = ads,
                method = "ranger")

caret::

ans<-do_regression(dt, depvar, iv_names)

dal<-DALEX::explain(ans$mod, data=dt, y=depvar)
