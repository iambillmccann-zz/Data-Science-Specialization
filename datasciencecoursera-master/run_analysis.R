##
## Date Written:   19 April 2015
## Author:         Bill McCann
## Description:    This script accomplishes the following objectives for the Data Cleansing
##                 course project.
##
##                 1.Merges the training and the test sets to create one data set.
##                 2.Extracts only the measurements on the mean and standard deviation for 
##                   each measurement. 
##                 3.Uses descriptive activity names to name the activities in the data set
##                 4.Appropriately labels the data set with descriptive variable names. 
##                 5.From the data set in step 4, creates a second, independent tidy data 
##                   set with the average of each variable for each activity and each subject.
##
library(dplyr)
library(data.table)
##
## Function:       GetDataSet(directory, variableNames)
##                 This function returns a data table of the x_test dataset that includes
##                 descriptive variables name.
## Parameters:     folder: the name of the folder where the data resides
##                 variableNames: the names of the columns of the data table
## Returns         A data table
GetDataSet <- function(folder, variableNames)
{
    currentFolder <- getwd()            # save the current directory
    setwd(folder)                       # change the directory to the target folder
                                       
    dataSet <- read.table(paste("x_", folder, ".txt", sep=""))
    colnames(dataSet) <- variableNames # set the variable names to the features
    
    activities <- read.table(paste("y_", folder, ".txt", sep=""))
    combinedData <- data.table(activities, dataSet)
    
    setwd(currentFolder)                # restore the current directory to the original folder
    
    # select only the mean and standard deviation columns
    select(combinedData, contains("V1"), contains("mean"), contains("std"))
}

##
## Function:       GetVariableNames()
##                 This function returns a data table strings to use as variable
##                 names in the resulting dataset.
## Returns         A data table of names
GetVariableNames <- function()
{
    currentFolder <- getwd()
    setwd("D:\\Data Science Course\\Getting and Cleaning Data\\data\\UCI HAR Dataset")

    listOfNames <- read.table("features.txt")                                   # obtain the varible names from the functions.txt file
    listOfNames <- mutate(listOfNames, name = gsub("(", "", V2, fixed=TRUE))    # remove parenthese from names
    listOfNames <- mutate(listOfNames, name = gsub(")", "", name, fixed=TRUE))
    listOfNames <- mutate(listOfNames, name = gsub(",", "_", name, fixed=TRUE)) # remove commas from the names
    listOfNames <- mutate(listOfNames, name = gsub("-", "_", name, fixed=TRUE)) # remove hyphens from the names

    setwd(currentFolder)
    unlist(listOfNames[,3])                                                     # reshape the list of names
}

##
## Function:       LabelActivities(dataSet, activityLabels)
##                 This function returns a data table with the activity types properly
##                 labelled.
## Parameters:     dataSet: the name of the data table
##                 activityLabels: the names of the activities
## Returns         A data table
LabelActivities <- function(dataSet, activityLabels)
{
    combinedDataSet <- merge(activityLabels, dataSet, x.by="V1", y.by="V1")
    result <- combinedDataSet %>% rename(activity = V2) %>% select(-V1)
    result
}

## main code
currentFolder <- getwd()

# The Samsung data must be in the working directory. 
# setwd("D:\\Data Science Course\\Getting and Cleaning Data\\data\\UCI HAR Dataset")

# obtain a vector of strings that contains the names of the variables in the files
variableNames <- GetVariableNames()

# read into a table the names of the activities
activityLabels <- read.table("activity_labels.txt")

# obtain the training and test datasets
testDataSet <- GetDataSet("test", variableNames)
trainingDataSet <- GetDataSet("train", variableNames)

# combine the training and test datasets, then tidy up using the names of activites
mergedDataSet <- LabelActivities(rbind(testDataSet, trainingDataSet), activityLabels)

#compute the means
mergedDataSet %>% 
    group_by(activity) %>% 
    summarise_each(funs(mean)) %>% 
    write.table(file="result.txt", row.names=FALSE)

setwd(currentFolder)
