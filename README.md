#Functional Programming

##
The idea with this exercise was to create a "MasterScript" that calls several functions used in the pre-process, training and evaluation phase of a data analytics project.

In addition, each model and output are saved for each run with a timestamp making it easier to retrieve the latest created file for any directory.
##


List of Scripts:

Master_Script.R  -> main file, that calls the other scripts and executes the whole analysis.

latest_file_CSV -> Function that loads the last created CSV file within a specified directory.

latest_file_EXCEL -> Function that loads the last created EXCEL file within a specified directory.

Pre_Process -> Function that pre-process the Train and Validation datasets, in this case it only changes the class of some attributes.

do_parallel_function -> enables paralell processing with n-1 cores.

Training_Function -> Function that creates a data partition of the Train set, then trains a specified model and returns the metrics against the partition and the validation set. Also saves the model with a timestamp in the "Model" folder

Load_Latest_Model -> Function that loads the last model (specified by type) within the Model folder.

apply_model_function -> Function that applies a specific model and generates a timestamped .CSV file in the Data\Output folder with the results.