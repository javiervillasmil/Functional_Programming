Pre_Process <- function(df) {
  
  #rename and refactor Brand variable
  df$brand <- replace(df$brand, df$brand == '0', "acer")
  df$brand <- replace(df$brand, df$brand == '1', "sony")
  df$brand <- as.factor(df$brand)
  
  #rename and refactor zipcode variable
  df$zipcode <- as.factor(df$zipcode)
  df$zipcode <- revalue(df$zipcode, c( "0" = "New England",
                                       "1" = "Mid-Atlantic",
                                       "2" = "East North Central", 
                                       "3" = "West North Central",
                                       "4" = "South Atlantic",
                                       "5" = "East South Cental",
                                       "6" = "West South Central",
                                       "7" = "Mountain",
                                       "8" = "Pacific"))
  
  #rename and refactor education level
  df$elevel <- as.factor(df$elevel)
  df$elevel <- revalue(df$elevel, c( "0" = "Less than High School", 
                                     "1" = "High School Degree", 
                                     "2" = "Some College", 
                                     "3" = "4-year college degree",
                                     "4" = "Masters or Doctoral"))
  
  #refactor type of car
  df$car <- as.factor(df$car)
  
  
  #Age and Creadit changed to a nimeric variable
  df$age <- as.integer(df$age)
  df$credit <- as.numeric(df$credit)
  
  return(df)
  
  }