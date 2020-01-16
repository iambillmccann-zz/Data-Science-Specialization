## Getting and Cleaning Data
### Course Project
### Code Book


### Data Dictionary - Result.txt

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


**activity** String

LAYING

SITTING

STANDING

WALKING

WALKING_DOWNSTAIRS

WALKING_UPSTAIRS


**tBodyAcc_mean_X** Numeric

Mean of the tBodyAcc_mean_x variable summarized by activity

**tBodyAcc_mean_Y** Numeric

Mean of the tBodyAcc_mean_Y variable summarized by activity

**tBodyAcc_mean_Z** Numeric

Mean of the tBodyAcc_mean_Z variable summarized by activity

**tGravityAcc_mean_X** Numeric

Mean of the tGravityAcc_mean_X variable summarized by activity

**tGravityAcc_mean_Y** Numeric

Mean of the tGravityAcc_mean_Y variable summarized by activity

**tGravityAcc_mean_Z** Numeric

Mean of the tGravityAcc_mean_Z variable summarized by activity

**tBodyAccJerk_mean_X** Numeric

Mean of the tBodyAccJerk_mean_X variable summarized by activity

**tBodyAccJerk_mean_Y** Numeric

Mean of the tBodyAccJerk_mean_Y variable summarized by activity

**tBodyAccJerk_mean_Z** Numeric

Mean of the tBodyAccJerk_mean_Z variable summarized by activity

**tBodyAccJerk_mean_Z** Numeric

Mean of the tBodyAccJerk_mean_Z variable summarized by activity

**tBodyGyro_mean_Y** Numeric

Mean of the tBodyGyro_mean_Y variable summarized by activity

**tBodyGyro_mean_Z** Numeric

Mean of the tBodyGyro_mean_Z variable summarized by activity

**tBodyGyroJerk_mean_X** Numeric

Mean of the tBodyGyroJerk_mean_X variable summarized by activity

**tBodyGyroJerk_mean_Y** Numeric

Mean of the tBodyGyroJerk_mean_Y variable summarized by activity

**tBodyGyroJerk_mean_Z** Numeric

Mean of the tBodyGyroJerk_mean_Z variable summarized by activity

**tBodyAccMag_mean** Numeric

Mean of the tBodyAccMag_mean variable summarized by activity

**tGravityAccMag_mean** Numeric

Mean of the tGravityAccMag_mean variable summarized by activity

**tBodyAccJerkMag_mean** Numeric

Mean of the tBodyAccJerkMag_mean variable summarized by activity

**tBodyGyroMag_mean** Numeric

Mean of the tBodyGyroMag_mean variable summarized by activity

**tBodyGyroJerkMag_mean** Numeric

Mean of the tBodyGyroJerkMag_mean variable summarized by activity

**fBodyAcc_mean_X** Numeric

Mean of the fBodyAcc_mean_X variable summarized by activity

**fBodyAcc_mean_Y** Numeric

Mean of the fBodyAcc_mean_Y variable summarized by activity

**fBodyAcc_mean_Z** Numeric

Mean of the fBodyAcc_mean_Z variable summarized by activity

**fBodyAcc_meanFreq_X** Numeric

Mean of the fBodyAcc_meanFreq_X variable summarized by activity

**fBodyAcc_meanFreq_Y** Numeric

Mean of the fBodyAcc_meanFreq_Y variable summarized by activity

**fBodyAcc_meanFreq_Z** Numeric

Mean of the fBodyAcc_meanFreq_Z variable summarized by activity

**fBodyAccJerk_mean_X** Numeric

Mean of the fBodyAccJerk_mean_X variable summarized by activity

**fBodyAccJerk_mean_Y** Numeric

Mean of the fBodyAccJerk_mean_Y variable summarized by activity

**fBodyAccJerk_mean_Z** Numeric

Mean of the fBodyAccJerk_mean_Z variable summarized by activity

**fBodyAccJerk_meanFreq_X** Numeric

Mean of the fBodyAccJerk_meanFreq_X variable summarized by activity

**fBodyAccJerk_meanFreq_Y** Numeric

Mean of the fBodyAccJerk_meanFreq_Y variable summarized by activity

**fBodyAccJerk_meanFreq_Z** Numeric

Mean of the fBodyAccJerk_meanFreq_Z variable summarized by activity

**fBodyGyro_mean_X** Numeric

Mean of the fBodyGyro_mean_X variable summarized by activity

**fBodyGyro_mean_Y** Numeric

Mean of the fBodyGyro_mean_Y variable summarized by activity

**fBodyGyro_mean_Z** Numeric

Mean of the fBodyGyro_mean_Z variable summarized by activity

**fBodyGyro_meanFreq_X** Numeric

Mean of the fBodyGyro_meanFreq_X variable summarized by activity

**fBodyGyro_meanFreq_Y** Numeric

Mean of the fBodyGyro_meanFreq_Y variable summarized by activity

**fBodyGyro_meanFreq_Z** Numeric

Mean of the fBodyGyro_meanFreq_Z variable summarized by activity

**fBodyAccMag_mean** Numeric

Mean of the fBodyAccMag_mean variable summarized by activity

**fBodyAccMag_meanFreq** Numeric

Mean of the fBodyAccMag_meanFreq variable summarized by activity

**fBodyBodyAccJerkMag_mean** Numeric

Mean of the fBodyBodyAccJerkMag_mean variable summarized by activity

**fBodyBodyAccJerkMag_meanFreq** Numeric

Mean of the fBodyBodyAccJerkMag_meanFreq variable summarized by activity

**fBodyBodyGyroMag_mean** Numeric

Mean of the fBodyBodyGyroMag_mean variable summarized by activity

**fBodyBodyGyroMag_meanFreq** Numeric

Mean of the fBodyBodyGyroMag_meanFreq variable summarized by activity

**fBodyBodyGyroJerkMag_mean** Numeric

Mean of the fBodyBodyGyroJerkMag_mean variable summarized by activity

**fBodyBodyGyroJerkMag_meanFreq** Numeric

Mean of the fBodyBodyGyroJerkMag_meanFreq variable summarized by activity

**angletBodyAccMean_gravity** Numeric

Mean of the angletBodyAccMean_gravity variable summarized by activity

**angletBodyAccJerkMean_gravityMean** Numeric

Mean of the angletBodyAccJerkMean_gravityMean variable summarized by activity

**angletBodyGyroMean_gravityMean** Numeric

Mean of the angletBodyGyroMean_gravityMean variable summarized by activity

**angletBodyGyroJerkMean_gravityMean** Numeric

Mean of the angletBodyGyroJerkMean_gravityMean variable summarized by activity

**angleX_gravityMean** Numeric

Mean of the angleX_gravityMean variable summarized by activity

**angleY_gravityMean** Numeric

Mean of the angleY_gravityMean variable summarized by activity

**angleZ_gravityMean** Numeric

Mean of the angleZ_gravityMean variable summarized by activity

**tBodyAcc_std_X** Numeric

Mean of the tBodyAcc_std_X variable summarized by activity

**tBodyAcc_std_Y** Numeric

Mean of the tBodyAcc_std_Y variable summarized by activity

**tBodyAcc_std_Z** Numeric

Mean of the tBodyAcc_std_Z variable summarized by activity

**tGravityAcc_std_X** Numeric

Mean of the tGravityAcc_std_X variable summarized by activity

**tGravityAcc_std_Y** Numeric

Mean of the tGravityAcc_std_Y variable summarized by activity

**tGravityAcc_std_Z** Numeric

Mean of the tGravityAcc_std_Z variable summarized by activity

**tBodyAccJerk_std_X** Numeric

Mean of the tBodyAccJerk_std_X variable summarized by activity

**tBodyAccJerk_std_Y** Numeric

Mean of the tBodyAccJerk_std_Y variable summarized by activity

**tBodyAccJerk_std_Z** Numeric

Mean of the tBodyAccJerk_std_Z variable summarized by activity

**tBodyGyro_std_X** Numeric

Mean of the tBodyGyro_std_X variable summarized by activity

**tBodyGyro_std_Y** Numeric

Mean of the tBodyGyro_std_Y variable summarized by activity

**tBodyGyro_std_Z** Numeric

Mean of the tBodyGyro_std_Z variable summarized by activity

**tBodyGyroJerk_std_X** Numeric

Mean of the tBodyGyroJerk_std_X variable summarized by activity

**tBodyGyroJerk_std_Y** Numeric

Mean of the tBodyGyroJerk_std_Y variable summarized by activity

**tBodyGyroJerk_std_Z** Numeric

Mean of the tBodyGyroJerk_std_Z variable summarized by activity

**tBodyAccMag_std** Numeric

Mean of the tBodyAccMag_std variable summarized by activity

**tGravityAccMag_std** Numeric

Mean of the tGravityAccMag_std variable summarized by activity

**tBodyAccJerkMag_std** Numeric

Mean of the tBodyAccJerkMag_std variable summarized by activity

**tBodyGyroMag_std** Numeric

Mean of the tBodyGyroMag_std variable summarized by activity

**tBodyGyroJerkMag_std** Numeric

Mean of the tBodyGyroJerkMag_std variable summarized by activity

**fBodyAcc_std_X** Numeric

Mean of the fBodyAcc_std_X variable summarized by activity

**fBodyAcc_std_Y** Numeric

Mean of the fBodyAcc_std_Y variable summarized by activity

**fBodyAcc_std_Z** Numeric

Mean of the fBodyAcc_std_Z variable summarized by activity

**fBodyAccJerk_std_X** Numeric

Mean of the fBodyAccJerk_std_X variable summarized by activity

**fBodyAccJerk_std_Y** Numeric

Mean of the fBodyAccJerk_std_Y variable summarized by activity

**fBodyAccJerk_std_Z** Numeric

Mean of the fBodyAccJerk_std_Z variable summarized by activity

**fBodyGyro_std_X** Numeric

Mean of the fBodyGyro_std_X variable summarized by activity

**fBodyGyro_std_Y** Numeric

Mean of the fBodyGyro_std_Y variable summarized by activity

**fBodyGyro_std_Z** Numeric

Mean of the fBodyGyro_std_Z variable summarized by activity

**fBodyAccMag_std** Numeric

Mean of the fBodyAccMag_std variable summarized by activity

**fBodyBodyAccJerkMag_std** Numeric

Mean of the fBodyBodyAccJerkMag_std variable summarized by activity

**fBodyBodyGyroMag_std** Numeric

Mean of the fBodyBodyGyroMag_std variable summarized by activity

**fBodyBodyGyroJerkMag_std** Numeric

Mean of the fBodyBodyGyroJerkMag_std variable summarized by activity
