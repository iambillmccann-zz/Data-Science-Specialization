##
## Setup working directory and libraries
##
setwd("~/GitHub/Machine Learning"
library(AppliedPredictiveModeling)
library(caret)
library(plyr)
library(dplyr)

##
## Download data for the project
##
getData = function(url, fileName)
{
    if (!file.exists(fileName)) { download.file(url, fileName, mode="w")}
    read.csv(fileName)
}

##
## Run various models against folds
##
runFold = function(fold)
{
    set.seed(1)
    trainingFolds = createFolds(y = trainingVars$classe, k=5, list=TRUE, returnTrain=TRUE)
    trainingCV = trainingVars[trainingFolds[[fold]],]
    set.seed(1)
    testingFolds = createFolds(y = trainingVars$classe, k=5, list=TRUE, returnTrain=FALSE)
    testingCV = trainingVars[testingFolds[[fold]],]
    
    modelFit = train(classe ~ .,method="rf", data=trainingCV, prox=TRUE)
    print(modelFit)
    
    prediction = predict(modelFit, testCV)
    testingCV$predRight = prediction==testingCV$Classe
    table(prediction, testCV$Classe)

    #   modelFit = train(classe ~ c("pitch_forearm", "gyros_belt_y", "accel_dumbbell_x", "accel_belt_x", "magnet_forearm_x", "magnet_belt_x", "magnet_belt_y", "magnet_belt_z"),method="gbm", data=trainingCV, verbose=FALSE)
    #   modelFit = train(classe ~ .,method="gbm", data=trainingCV, verbose=FALSE)
    #   modelFit = train(classe ~ .,method="lda", data=trainingCV)
    #   modelFit = train(classe ~ .,method="nb", data=trainingCV)
}

# Call the GetData function to download the files
training = getData("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv", "pml-training.csv")
testing = getData("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv", "pml-testing.csv")

# initial exploration of the data
summary(training)

# build the master training dataset by selecting only variables with reliable data
# randomSample = createDataPartition(training$classe, p=0.1, list=FALSE)
# selectSample = training[randomSample,]
trainingVars = training %>%
               select(roll_belt,
                      pitch_belt,
                      yaw_belt,
                      total_accel_belt,
                      gyros_belt_x,
                      gyros_belt_y,
                      gyros_belt_z,
                      accel_belt_x,
                      accel_belt_y,
                      accel_belt_z,
                      magnet_belt_x,
                      magnet_belt_y,
                      magnet_belt_z,
                      roll_arm,
                      pitch_arm,
                      yaw_arm,
                      total_accel_arm,
                      gyros_arm_x,
                      gyros_arm_y,
                      gyros_arm_z,
                      accel_arm_x,
                      accel_arm_y,
                      accel_arm_z,
                      magnet_arm_x,
                      magnet_arm_y,
                      magnet_arm_z,
                      roll_dumbbell,
                      pitch_dumbbell,
                      yaw_dumbbell,
                      total_accel_dumbbell,
                      gyros_dumbbell_x,
                      gyros_dumbbell_y,
                      gyros_dumbbell_z,
                      accel_dumbbell_x,
                      accel_dumbbell_y,
                      accel_dumbbell_z,
                      magnet_dumbbell_x,
                      magnet_dumbbell_y,
                      magnet_dumbbell_z,
                      roll_forearm,
                      pitch_forearm,
                      gyros_forearm_x,
                      gyros_forearm_y,
                      gyros_forearm_z,
                      accel_forearm_x,
                      accel_forearm_y,
                      accel_forearm_z,
                      magnet_forearm_x,
                      magnet_forearm_y,
                      magnet_forearm_z,
                      classe)

# do more explorationwith featurePlot

# pitch_forearm
featurePlot(x=trainingVars[,c("yaw_belt", "total_accel_belt", "classe")], y=trainingVars$classe, plot="pairs")
featurePlot(x=trainingVars[,c("roll_arm", "pitch_arm", "yaw_arm", "total_accel_arm", "classe")], y=trainingVars$classe, plot="pairs")
featurePlot(x=trainingVars[,c("roll_dumbbell", "pitch_dumbbell", "yaw_dumbbell", "total_accel_dumbbell", "classe")], y=trainingVars$classe, plot="pairs")
featurePlot(x=trainingVars[,c("roll_forearm", "pitch_forearm", "classe")], y=trainingVars$classe, plot="pairs")

# gyros_belt_y
featurePlot(x=trainingVars[,c("gyros_dumbbell_x", "gyros_dumbbell_y","gyros_dumbbell_z", "classe")], y=trainingVars$classe, plot="pairs")
featurePlot(x=trainingVars[,c("gyros_forearm_x", "gyros_forearm_y","gyros_forearm_z", "classe")], y=trainingVars$classe, plot="pairs")
featurePlot(x=trainingVars[,c("gyros_arm_x", "gyros_arm_y","gyros_arm_z", "classe")], y=trainingVars$classe, plot="pairs")
featurePlot(x=trainingVars[,c("gyros_belt_x", "gyros_belt_y","gyros_belt_z", "classe")], y=trainingVars$classe, plot="pairs")

# accel_dumbbell_x accel_belt_x
featurePlot(x=trainingVars[,c("accel_dumbbell_x", "accel_dumbbell_y","accel_dumbbell_z", "classe")], y=trainingVars$classe, plot="pairs")
featurePlot(x=trainingVars[,c("accel_forearm_x", "accel_forearm_y","accel_forearm_z", "classe")], y=trainingVars$classe, plot="pairs")
featurePlot(x=trainingVars[,c("accel_arm_x", "accel_arm_y","accel_arm_z", "classe")], y=trainingVars$classe, plot="pairs")
featurePlot(x=trainingVars[,c("accel_belt_x", "accel_belt_y","accel_belt_z", "classe")], y=trainingVars$classe, plot="pairs")

# magnet_forearm_x magnet_belt_x magnet_belt_y magnet_belt_z
featurePlot(x=trainingVars[,c("magnet_dumbbell_x", "magnet_dumbbell_y","magnet_dumbbell_z", "classe")], y=trainingVars$classe, plot="pairs")
featurePlot(x=trainingVars[,c("magnet_forearm_x", "magnet_forearm_y","magnet_forearm_z", "classe")], y=trainingVars$classe, plot="pairs")
featurePlot(x=trainingVars[,c("magnet_arm_x", "magnet_arm_y","magnet_arm_z", "classe")], y=trainingVars$classe, plot="pairs")
featurePlot(x=trainingVars[,c("magnet_belt_x", "magnet_belt_y","magnet_belt_z", "classe")], y=trainingVars$classe, plot="pairs")

# break the master training dataset into sub training and test sets
set.seed(1)
randomSample = createDataPartition(trainingVars$classe, p=0.2, list=FALSE)
newTraining = trainingVars[randomSample,]
inTraining = createDataPartition(newTraining$classe, p=0.6, list=FALSE)
trainingTrain = newTraining[inTraining,]
trainingTest  = newTraining[-inTraining,]

modelFitRF = train(classe ~ .,method="rf", data=trainingTrain, prox=TRUE)
print(modelFitRF)

modelFitGBM = train(classe ~ .,method="gbm", data=trainingTrain, verbose=FALSE)
print(modelFitGBM)

modelFitNB = train(classe ~ .,method="nb", data=trainingTrain, verbose=FALSE)
print(modelFitNB)

modelFitLDA = train(classe ~ .,method="lda", data=trainingTrain, verbose=FALSE)
print(modelFitLDA)

prediction = predict(modelFitRF, trainingTest)
trainingTest = trainingTest %>% mutate(predictionCorrect = prediction==classe)
table(prediction, trainingTest$classe)
table(trainingTest$predictionCorrect)

trainingPrediction = predict(modelFitRF, trainingTrain)
crossValidation = rfcv(trainingTrain, trainingPrediction, cv.fold=5)
summary(crossValidation)

trainingTrain = trainingTrain %>% mutate(CV1Correct = crossValidation$predicted[[1]]==classe)
table(crossValidation$predicted[[1]], trainingTrain$classe)
trainingTrain = trainingTrain %>% mutate(CV1Correct = crossValidation$predicted[[2]]==classe)
table(crossValidation$predicted[[2]], trainingTrain$classe)
trainingTrain = trainingTrain %>% mutate(CV1Correct = crossValidation$predicted[[3]]==classe)
table(crossValidation$predicted[[3]], trainingTrain$classe)
trainingTrain = trainingTrain %>% mutate(CV1Correct = crossValidation$predicted[[4]]==classe)
table(crossValidation$predicted[[4]], trainingTrain$classe)
trainingTrain = trainingTrain %>% mutate(CV1Correct = crossValidation$predicted[[5]]==classe)
table(crossValidation$predicted[[5]], trainingTrain$classe)

runFold(1)
runFold(2)
runFold(3)

gbmModel = train(classe ~ ., method="gbm", data=trainingVars, verbose=FALSE)
rfModel = train(classe ~ ., method="rf", data=trainingVars, prox=FALSE)
