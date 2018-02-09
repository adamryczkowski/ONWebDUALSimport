copy_attributes<-function(sourcevar, destdf, destvarname, ignore_attrs = 'class', add_attrs = list())
{
  attrs<-attributes(sourcevar)
  attrs<-attrs [! names(attrs) %in% c(ignore_attrs, names(add_attrs))]
  attrs<-c(attrs, add_attrs)
  for(i in seq_along(attrs))
  {
    setattr(destdf[[destvarname]], names(attrs)[[i]], attrs[[i]])
  }
}

findid<-function(str) {
  stringr::str_match(str, stringr::regex("^([a-zA-Z]+).*$"))
}

compare_dfs<-function(df1_path, df2_path,
                      flag_comment_new_rows = FALSE,
                      flag_comment_deleted_rows = FALSE,
                      flag_comment_new_cols = TRUE,
                      flag_comment_deleted_cols = TRUE,
                      flag_structure_only=FALSE,
                      filename=NULL) {
  if('character' %in% class(df1_path)) {
    ext<-tools::file_ext(df1_path)

    if(ext=='xlsx') {
      out1<-read_file(df1_path)
      df1<-out1$df
    } else if (ext=='xlsm') {
      df1<-danesurowe::readDaneSurowe3(df1_path)
    }
    setattr(df1, 'label', basename(df1_path))
  } else {
    df1<-df1_path
  }

  if('character' %in% class(df2_path)) {
    ext<-tools::file_ext(df2_path)

    if(ext=='xlsx') {
      out2<-read_file(df2_path)
      df2<-out2$df
    } else if (ext=='xlsm') {
      df2<-danesurowe::readDaneSurowe3(df2_path)
    }
    setattr(df2, 'label', basename(df2_path))
  } else {
    df2<-df2_path
  }



  #	debugonce(danesurowe::gen_difference_df)

  ans<-danesurowe::df_difference(df1=df1, df2=df2, df1_key = 'q_0', df2_key = 'q_0',
                                 columns_to_ignore = c('filename','lp'),
                                 return_format = 'md',
                                 flag_compare_data = !flag_structure_only,
                                 flag_comment_new_rows = flag_comment_new_rows,
                                 flag_comment_deleted_rows = flag_comment_deleted_rows,
                                 flag_comment_new_cols = flag_comment_new_cols,
                                 flag_comment_deleted_cols = flag_comment_deleted_cols,
                                 name_of_datasets = 'databases', name_of_case = 'patient',
                                 name_of_cases = 'patients', name_of_variable = 'question',
                                 name_of_variables = 'questions')

  rap <- pander::Pandoc$new()
  rap$add.paragraph(ans)
  rap$format='pdf'
  rap$title<-paste0(danesurowe::GetDBName(df1))
  rap$author<-'Adam Ryczkowski'
  if(is.null(filename)){
    if('character' %in% class(df1_path)) {
      filename <-pathcat::path.cat(getwd(), tools::file_path_sans_ext(df1_path))
    } else {
      filename <-pathcat::path.cat(getwd(), deparse(substitute(df1_path)))
    }
  } else{
    filename <-pathcat::path.cat(getwd(), filename)
  }
  rap$export(filename)
  return(rap)
}
