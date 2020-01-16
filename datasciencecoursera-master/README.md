## Getting and Cleaning Data
### Course Project
The course project for getting and cleaning data is contained in the R script "run_analysis.R". This script accomplishes the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject.

The script accomplishes these with a few statements in the main body and three functions. These functions are:

* **GetDataSet** this function reads the data into a table, sets the column names to a string vector of names, adds the activities to the dataset, and selects only the mean and standard deviation variables.
* **GetVariableNames** this function reads the features.txt file and cleanses the values into strings that can be used as column names. This is accomplished with the gsub() function to remove special characters.
* **LabelActivities** this function substitutes the activity codes with readable labels, removes the columns containing the codes.

The main script reads the appropriate files, merges them together, produces summarized statistics, and writes the results to a file named "result.txt".

The code book is located in a separate file, CodeBook.md
