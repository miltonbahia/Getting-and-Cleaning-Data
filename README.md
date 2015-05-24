# Getting-and-Cleaning-Data

## Script Description 

The script run_analysis.R aims to load and process the data from the experiment conducted with a group of 30 volunteers who performed 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II)  at the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The description and complete documentation of the experiment are the following sites: 

  http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data obtained in the experiment:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script performs the following processes:

1 - Merges the training and the test sets to create one data set.
2 - Extracts only the measurements on the mean and standard deviation for each measurement.
3 - Adds a column with the name of the activities
4 - Appropriately labels the data set with descriptive variable names
5 - Writes the result to text file df_analysis.txt
6 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
7 - Writes the result to text file df_summary.txt

## Code Book 

1 - File:  df_analysis.txt
Decription: Tidy data set with the merger of the test and training data. 

Variables:

subject - It identifies the volunteer who carried out the activities of the experiment
set - Set of source data: test or train
activity_id - Numeric identifier activities
tBodyAcc_mean_X
tBodyAcc_mean_Y
tBodyAcc_mean_Z
tBodyAcc_std_X
tBodyAcc_std_Y
tBodyAcc_std_Z
tGravityAcc_mean_X
tGravityAcc_mean_Y
tGravityAcc_mean_Z
tGravityAcc_std_X
tGravityAcc_std_Y
tGravityAcc_std_Z
tBodyAccJerk_mean_X
tBodyAccJerk_mean_Y
tBodyAccJerk_mean_Z
tBodyAccJerk_std_X
tBodyAccJerk_std_Y
tBodyAccJerk_std_Z
tBodyGyro_mean_X
tBodyGyro_mean_Y
tBodyGyro_mean_Z
tBodyGyro_std_X
tBodyGyro_std_Y
tBodyGyro_std_Z
tBodyGyroJerk_mean_X
tBodyGyroJerk_mean_Y
tBodyGyroJerk_mean_Z
tBodyGyroJerk_std_X
tBodyGyroJerk_std_Y
tBodyGyroJerk_std_Z
tBodyAccMag_mean
tBodyAccMag_std
tGravityAccMag_mean
tGravityAccMag_std
tBodyAccJerkMag_mean
tBodyAccJerkMag_std
tBodyGyroMag_mean
tBodyGyroMag_std
tBodyGyroJerkMag_mean
tBodyGyroJerkMag_std
fBodyAcc_mean_X
fBodyAcc_mean_Y
fBodyAcc_mean_Z
fBodyAcc_std_X
fBodyAcc_std_Y
fBodyAcc_std_Z
fBodyAccJerk_mean_X
fBodyAccJerk_mean_Y
fBodyAccJerk_mean_Z
fBodyAccJerk_std_X
fBodyAccJerk_std_Y
fBodyAccJerk_std_Z
fBodyGyro_mean_X
fBodyGyro_mean_Y
fBodyGyro_mean_Z
fBodyGyro_std_X
fBodyGyro_std_Y
fBodyGyro_std_Z
fBodyAccMag_mean
fBodyAccMag_std
fBodyBodyAccJerkMag_mean
fBodyBodyAccJerkMag_std
fBodyBodyGyroMag_mean
fBodyBodyGyroMag_std
fBodyBodyGyroJerkMag_mean
fBodyBodyGyroJerkMag_std
activity_name - Name of the activities performed in the experiment




2 - File:  df_summary.txt
Description: Independent tidy data set with the average of each variable for each activity and each subject

subject - It identifies the volunteer who carried out the activities of the experiment
activity_id - Numeric identifier activities
activity_name - Name of the activities performed in the experiment

Mean values for each variable selected in the file ...

Mean_tBodyAcc_mean_X
Mean_tBodyAcc_mean_Y
Mean_tBodyAcc_mean_Z
Mean_tBodyAcc_std_X
Mean_tBodyAcc_std_Y
Mean_tBodyAcc_std_Z
Mean_tGravityAcc_mean_X
Mean_tGravityAcc_mean_Y
Mean_tGravityAcc_mean_Z
Mean_tGravityAcc_std_X
Mean_tGravityAcc_std_Y
Mean_tGravityAcc_std_Z
Mean_tBodyAccJerk_mean_X
Mean_tBodyAccJerk_mean_Y
Mean_tBodyAccJerk_mean_Z
Mean_tBodyAccJerk_std_X
Mean_tBodyAccJerk_std_Y
Mean_tBodyAccJerk_std_Z
Mean_tBodyGyro_mean_X
Mean_tBodyGyro_mean_Y
Mean_tBodyGyro_mean_Z
Mean_tBodyGyro_std_X
Mean_tBodyGyro_std_Y
Mean_tBodyGyro_std_Z
Mean_tBodyGyroJerk_mean_X
Mean_tBodyGyroJerk_mean_Y
Mean_tBodyGyroJerk_mean_Z
Mean_tBodyGyroJerk_std_X
Mean_tBodyGyroJerk_std_Y
Mean_tBodyGyroJerk_std_Z
Mean_tBodyAccMag_mean
Mean_tBodyAccMag_std
Mean_tGravityAccMag_mean
Mean_tGravityAccMag_std
Mean_tBodyAccJerkMag_mean
Mean_tBodyAccJerkMag_std
Mean_tBodyGyroMag_mean
Mean_tBodyGyroMag_std
Mean_tBodyGyroJerkMag_mean
Mean_tBodyGyroJerkMag_std
Mean_fBodyAcc_mean_X
Mean_fBodyAcc_mean_Y
Mean_fBodyAcc_mean_Z
Mean_fBodyAcc_std_X
Mean_fBodyAcc_std_Y
Mean_fBodyAcc_std_Z
Mean_fBodyAccJerk_mean_X
Mean_fBodyAccJerk_mean_Y
Mean_fBodyAccJerk_mean_Z
Mean_fBodyAccJerk_std_X
Mean_fBodyAccJerk_std_Y
Mean_fBodyAccJerk_std_Z
Mean_fBodyGyro_mean_X
Mean_fBodyGyro_mean_Y
Mean_fBodyGyro_mean_Z
Mean_fBodyGyro_std_X
Mean_fBodyGyro_std_Y
Mean_fBodyGyro_std_Z
Mean_fBodyAccMag_mean
Mean_fBodyAccMag_std
Mean_fBodyBodyAccJerkMag_mean
Mean_fBodyBodyAccJerkMag_std
Mean_fBodyBodyGyroMag_mean
Mean_fBodyBodyGyroMag_std
Mean_fBodyBodyGyroJerkMag_mean
Mean_fBodyBodyGyroJerkMag_std
