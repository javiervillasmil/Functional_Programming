retrieve_last_file_EXCEL <- function(directory, key_word, excel_sheet) {
  
  df <- file.info(
    list.files(directory, pattern = paste(key_word), full.names = TRUE)
    )
  
  dataset <- read_excel(row.names(df)[which.max(df[["mtime"]])],sheet = paste(excel_sheet))
  
  return(dataset)
  
}

# key_word <- "train"
# directory <- "C:/Users/dilet/Desktop/functional_wifi/files"
# excel_sheet <- "Survey Results Complete"

#### readme ####
# in order to use the function, you need .... 
#  example: 
#  df6 <- retrieve_last_file (directory="C:/Users/Dell/Downloads", key_word = "Types",excel_sheet = "sheet1") #case sensitive