training_function <- function(df,column_name,model_name) {
  
  set.seed(123)
  
  #creating data partition
  trainingindices <- createDataPartition(y = pull(train[,column_name]), p = .80, list = FALSE)
  
  training_set <- df[trainingindices,]
  testing_set  <- df[-trainingindices,]
  
  #Caret Control parameters
  control_parameters <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
  
  #creating the formula to paste in caret's
  f <- as.formula(paste(column_name ,paste(c('salary','age'), collapse = " + "),sep = " ~ "))
  
  set.seed(123)
  
  #model with brand as dependant variable and salary + age
  model <- train(
    f,
    data = df,
    method = model_name,
    trControl = control_parameters,
    preProc = c("center", "scale"))
  
 #set working directory to Model folder
  setwd(here::here('Models'))
  
  #save the model with timestamp
  saveRDS(model,paste(str_c(
    c('Model_',
      model_name,
      '_',
      as.character(date(Sys.time())),
      '_',
      as.character(hour(Sys.time())),
      as.character(minute(Sys.time()))),collapse =''),'.rds',sep = ''))
  
  #set working directory to ROOT again
  setwd(here::here())
  
  #predictions over the testing_set partition
  if (class(train$brand)=='factor' | class(train$brand)=='character'){
    cat(red(c('CLASSIFICATION PROBLEM','')),sep="\n")
    prediction <- predict(model, newdata = testing_set)
    performance <- postResample(prediction,pull(testing_set[,column_name]))
    
    print(performance)
    print(confusionMatrix(data = prediction, reference = pull(testing_set[,column_name])))
  }
    else {
      cat(red(c('REGRESSION PROBLEM','')),sep="\n")
      prediction <- predict(model, newdata = testing_set)
      performance <- postResample(prediction,pull(testing_set[,column_name]))
      
      print(performance)
    }
  
  return(cat(red(c('MODELING DONE - CHECK FOLDER & PERFORMANCE','')),sep="\n"))

}