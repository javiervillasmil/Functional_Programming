retrieve_last_file_CSV <- function(directory, key_word) {
  
  df <- file.info(
    list.files(directory, pattern = paste(key_word), full.names = TRUE)
    )
  
  dataset <- read.csv(row.names(df)[which.max(df[["mtime"]])], header = T, sep = ",")
  
  return(dataset)
  
}

# key_word <- "train"
# directory <- "C:/Users/dilet/Desktop/functional_wifi/files"

#### readme ####
# in order to use the function, you need .... 
#  example: 
#  df6 <- retrieve_last_file (directory="C:/Users/Dell/Downloads", key_word = "Types") #case sensitive