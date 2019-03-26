apply_model_function <- function(df,model,column_name) {
  prediction <- predict(model,df)
  
  df[,column_name] <- prediction
  
  # set working directory to the Output folder
  setwd(here::here('Data','Output'))
  
  # Write CSV in R
  write.csv(df, file = str_c(
    c('Results',
      '_',
      as.character(date(Sys.time())),
      '_',
      as.character(hour(Sys.time())),
      as.character(minute(Sys.time())),
      '.csv'),collapse =''),row.names=FALSE)
  
  # set working directory to ROOT
  setwd(here::here())
  
  return(df)
}