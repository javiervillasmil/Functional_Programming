#import libraries
if(require("pacman")=="FALSE"){
  install.packages('pacman')
  library('pacman')
  pacman::p_load(here,stringr,readxl,plyr,caret,dplyr,doParallel,lubridate,crayon) # <- add libraries here
  } else {
    library('pacman')
    pacman::p_load(here,stringr,readxl,plyr,caret,dplyr,doParallel,lubridate,crayon) # <- add libraries here
  }
cat(red("Hello world!"))

######### Loading Scripts...
##load a function that enables pararell processing with several cores
source(here::here('Scripts','do_parallel_function.R'))

##load a function that retrieve the "latest file" from a directory CSV or EXCEL
source(here::here('Scripts','latest_file_CSV.R'))
source(here::here('Scripts','latest_file_EXCEL.R'))

##load a function that pre-process our datasets
source(here::here('Scripts','Pre_Process.R'))

##load a function that trains a model and gives performance againsnt a partition 80/20 (out of the box)
## already picks salary and age as the relevant predictors
source(here::here('Scripts','Training_Function.R'))

#load a function that select the latest model
source(here::here('Scripts','Load_Latest_Model.R'))

#load a function to apply the model in a validation set, and export the result to the output folder.
source(here::here('Scripts','apply_model_function.R'))


#Paralell Processing
do_parallel_function()

##load training data
train <- retrieve_last_file_EXCEL(here::here('Data','Train'),'Survey_Key','Survey Results Complete')

##load validation data
validation <- retrieve_last_file_CSV(here::here('Data','Validation'),'Survey')

##apply pre-proccesing to both datasets
train <- Pre_Process(train)
validation <- Pre_Process(validation)

#trains a model using 'BRAND" as a predictor
training_function(train,'brand','rf')

#loads the latest model
Last_model <- retrieve_last_MODEL(here::here('Models'),'Model_rf')

#Apply the model to the validation set
Results <- apply_model_function(validation,Last_model,'brand')






