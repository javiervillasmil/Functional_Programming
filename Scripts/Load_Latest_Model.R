retrieve_last_MODEL <- function(directory, key_word) {
  
  df <- file.info(
    list.files(directory, pattern = paste(key_word), full.names = TRUE)
  )
  
  Latest_Model <- readRDS((row.names(df)[which.max(df[["mtime"]])]))
  cat(red(paste('MODEL LOADED','\n',row.names(df)[which.max(df[["mtime"]])])), sep = '\n\n')
  print(Latest_Model)
  return(Latest_Model)
  
}
