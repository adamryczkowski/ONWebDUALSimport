report_chapters<-list(
  'to_report'='Other cases to report',
  'manual_text'='Conversion from text to categories',
  'wide2narrow'='Duplicate items in subform',
  'bad_category'='Missing or non-certain categories ',
  'specialist'="Problems with specialists' names",
  'manual_factor'='Conversion from text to categories',
  'units'='Unknown units',
  'to_integer'='Problems when converting to integer numbers',
  'children_numeric'='Non-numeric number of children',
  'children_upper_bound'='Too large number of children',
  'units_value'='Non-number in the numeric field',
  'to_numeric'='Non-number in the numeric field',
  'Date_by_serial_numeric'='Wrong date format',
  'units_upper'='Non-number in the numeric field',
  'units_lower'='Non-number in the numeric field',
  'Date_by_serial_range'='Date out of bounds'
  )

gen_report_composer<-function(in_dt, out_dt) {
  report_composer<-function(rows, cols, type, context_df) {
#    col_names<-danesurowe::format_var_list(dt = in_dt, colnames = names(cols), flag_include_secondary_name = TRUE, flag_quote_shortname = '`')
    col_names_gen<-itemNaming::variable_list_formatter_df_gen(df = in_dt, max_explicit_items_count = 11, number_of_elements_around_ellipsis = c(4,3))
    col_names_report<-col_names_gen(names(cols))

    row_names_gen<-itemNaming::case_list_formatter_df_gen(df = in_dt, case_name_var = 'q_0', max_explicit_items_count = 11, number_of_elements_around_ellipsis = c(4,3))
    row_names_report<-row_names_gen(names(rows))
#    row_names<-danesurowe::format_case_list(case_names = names(rows), all_cases = rownames(in_dt))

    lengths<-((length(rows)>1)*1 + (length(cols)>1)*2)*1
    # lengths:
    # 0 - one variable, one case, 1 - one variable, two or more cases,
    # 2 - two or more variables, one case, 3 - two or more variables, two or more cases,
    values<- data.table:::subset.data.table(in_dt, seq_len(nrow(in_dt)) %in% rows, names(cols))

    value_names_gen<-itemNaming::vector_formatter_df_gen()
    if(lengths==0) {
      text=paste0(col_names_report[[1]], " of ", row_names_report[[1]])
    } else if(lengths==1) {
      text=paste0(col_names_report[[1]], " of ", row_names_report[[1]])
    } else if(lengths==2) {
      text=paste0(col_names_report[[1]], " of ", row_names_report[[1]])
    } else if(lengths==3) {
      text=paste0(col_names_report[[1]], " of ", row_names_report[[1]])
    } else {
      browser()
    }
    if(type=='bad_category') {
      #Error trigerred by suspicious text in the text field when converting to the factor
      entered_text<-context_df$par1
      values_text<-value_names_gen(unique(values[[1]]))
      text<-paste0("Unknown category for ", text, ": ", values_text)
    } else if(type=='children_upper_bound') {
      values_text<-value_names_gen(as.integer(values[[1]]))
      text<-paste0("Wrong ", text, ": ", values_text)
    } else if(type=='Date_by_serial_range') {
      date_num<-values
      date_ser<-as.Date(context_df$par1, origin = "1899-12-30")
      date_dec<-as.Date(lubridate::date_decimal(context_df$par1))
      values_text<-value_names_gen(values[[1]])
      text<-paste0("Wrong ", text, ". Entered wrong date ", values_text," that can be interpreted as either ", date_ser, " or ", date_dec, ".")
    } else if(type=='manual_factor') {
      values_text<-value_names_gen(unique(as.character(values[[1]])))
      text<-paste0("Unknown category for ", text, ": ", values_text)
    } else if(type=='manual_text') {
      values_text<-value_names_gen(values[[1]])
      text<-paste0("Unknown value for ", text, ": ", values_text, ". ")
    } else if(type=='specialist') {
      values_text<-value_names_gen(unique(as.character(values[[1]])))
      text<-paste0("Unknown specialist ", text, ": ", values_text, ". ")
    } else if(type=='to_report') {
      values_text<-value_names_gen(unique(as.character(values[[1]])))
      text<-paste0("Uninterpretable value for the ", text, ": ", values_text, ". ")
    } else if(type=='units') {
      values_text<-value_names_gen(values[[1]])
      text<-paste0("Unknown ", text, ": ", values_text, ". ")
    } else if(type=='wide2narrow') {
      par1=context_df$par1 #Points to the other colname with the same category
      values_text<-value_names_gen(unique(values[[1]]))
      if(is.na(par1)) {
        text<-paste0("Suspicious ", text, ": ", values_text, ". Assigned to the class ", par1, ". ")
      } else {
        text<-paste0("Unknown ", text, ": ", values_text, ". ")
      }
    }
    return(text)
  }
  return(report_composer)
}


report_composers<-list(
  'to_report'='Other cases to report',
  'manual_text'='Conversion from text to categories',
  'wide2narrow'='Duplicate items in subform',
  'bad_category'='Missing categories',
  'specialist'="Problems with specialists' names",
  'manual_factor'='Conversion from text to categories',
  'units'='Unkown units',
  'to_integer'='Problems when converting to integer numbers',
  'children_numeric'='Non-numeric number of children',
  'children_upper_bound'='Too large number of children',
  'units_value'='Non-number in the numeric field',
  'to_numeric'='Non-number in the numeric field',
  'Date_by_serial_numeric'='Wrong date format',
  'units_upper'='Non-number in the numeric field',
  'units_lower'='Non-number in the numeric field',
  'Date_by_serial_range'='Date out of bounds'

)
