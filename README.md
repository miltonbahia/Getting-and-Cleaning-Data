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
File:  df_analysis.txt

File:  df_summary.txt
