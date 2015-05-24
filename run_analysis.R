## This script loads, work and clean the data collected in the accelerometers from the Samsung Galaxy S smartphone

# Load test set

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
set_test <- rep("test",length(subject_test))
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
df_test <- data.frame(subject_test,set_test,y_test,x_test)

rm(subject_test)
rm(set_test)
rm(y_test)
rm(x_test)


# Load training set

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
set_train <- rep("train",length(subject_train))
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
df_train <- data.frame(subject_train,set_train,y_train,x_train)

rm(subject_train)
rm(set_train)
rm(y_train)
rm(x_train)

# Load Features and activity_labels files

ft <- read.table("./UCI HAR Dataset/features.txt")
al <- read.table("./UCI HAR Dataset/activity_labels.txt")

names(al) <- c("activity_id","activity_name")

colunNames <- c("subject","set","activity_id",as.character.factor(ft$V2))

# Replaces the column names

names(df_train) <- colunNames
names(df_test) <- colunNames

# Merges the training and the test sets to create one data set.

df_analysis <- rbind(df_test,df_train)

rm(ft)
rm(df_train)
rm(df_test)
rm(colunNames)

# Extracts only the measurements on the mean and standard deviation for each measurement.

subs <- c(1,2,3,grep("[-]mean[(]|[-]std[(]",names(df_analysis)))

df_analysis <- df_analysis [,subs]


# cut or replace characters "-" , "," , ")" , "(" of the names of the label

names(df_analysis) <- gsub("-|[,]","_",gsub("[(]|[)]","",names(df_analysis)))

# Uses descriptive activity names to name the activities in the data set

df_analysis <- join(df_analysis,al)

rm(subs)
rm(al)

# writes the result to text file

write.table(df_analysis,"./df_analisys.txt",row.names=F) 

#Create tidy data set with the average of each variable for each activity and each subject.

df_summary <- group_by(df_analysis,subject,activity_id,activity_name)

df_summary_mean <- summarise(df_summary,Mean_tBodyAcc_mean_X = mean(tBodyAcc_mean_X,na.rm = TRUE),
                             Mean_tBodyAcc_mean_Y = mean(tBodyAcc_mean_Y,na.rm = TRUE),
                             Mean_tBodyAcc_mean_Z = mean(tBodyAcc_mean_Z,na.rm = TRUE),
                             Mean_tBodyAcc_std_X = mean(tBodyAcc_std_X,na.rm = TRUE),
                             Mean_tBodyAcc_std_Y = mean(tBodyAcc_std_Y,na.rm = TRUE),
                             Mean_tBodyAcc_std_Z = mean(tBodyAcc_std_Z,na.rm = TRUE),
                             Mean_tGravityAcc_mean_X = mean(tGravityAcc_mean_X,na.rm = TRUE),
                             Mean_tGravityAcc_mean_Y = mean(tGravityAcc_mean_Y,na.rm = TRUE),
                             Mean_tGravityAcc_mean_Z = mean(tGravityAcc_mean_Z,na.rm = TRUE),
                             Mean_tGravityAcc_std_X = mean(tGravityAcc_std_X,na.rm = TRUE),
                             Mean_tGravityAcc_std_Y = mean(tGravityAcc_std_Y,na.rm = TRUE),
                             Mean_tGravityAcc_std_Z = mean(tGravityAcc_std_Z,na.rm = TRUE),
                             Mean_tBodyAccJerk_mean_X = mean(tBodyAccJerk_mean_X,na.rm = TRUE),
                             Mean_tBodyAccJerk_mean_Y = mean(tBodyAccJerk_mean_Y,na.rm = TRUE),
                             Mean_tBodyAccJerk_mean_Z = mean(tBodyAccJerk_mean_Z,na.rm = TRUE),
                             Mean_tBodyAccJerk_std_X = mean(tBodyAccJerk_std_X,na.rm = TRUE),
                             Mean_tBodyAccJerk_std_Y = mean(tBodyAccJerk_std_Y,na.rm = TRUE),
                             Mean_tBodyAccJerk_std_Z = mean(tBodyAccJerk_std_Z,na.rm = TRUE),
                             Mean_tBodyGyro_mean_X = mean(tBodyGyro_mean_X,na.rm = TRUE),
                             Mean_tBodyGyro_mean_Y = mean(tBodyGyro_mean_Y,na.rm = TRUE),
                             Mean_tBodyGyro_mean_Z = mean(tBodyGyro_mean_Z,na.rm = TRUE),
                             Mean_tBodyGyro_std_X = mean(tBodyGyro_std_X,na.rm = TRUE),
                             Mean_tBodyGyro_std_Y = mean(tBodyGyro_std_Y,na.rm = TRUE),
                             Mean_tBodyGyro_std_Z = mean(tBodyGyro_std_Z,na.rm = TRUE),
                             Mean_tBodyGyroJerk_mean_X = mean(tBodyGyroJerk_mean_X,na.rm = TRUE),
                             Mean_tBodyGyroJerk_mean_Y = mean(tBodyGyroJerk_mean_Y,na.rm = TRUE),
                             Mean_tBodyGyroJerk_mean_Z = mean(tBodyGyroJerk_mean_Z,na.rm = TRUE),
                             Mean_tBodyGyroJerk_std_X = mean(tBodyGyroJerk_std_X,na.rm = TRUE),
                             Mean_tBodyGyroJerk_std_Y = mean(tBodyGyroJerk_std_Y,na.rm = TRUE),
                             Mean_tBodyGyroJerk_std_Z = mean(tBodyGyroJerk_std_Z,na.rm = TRUE),
                             Mean_tBodyAccMag_mean = mean(tBodyAccMag_mean,na.rm = TRUE),
                             Mean_tBodyAccMag_std = mean(tBodyAccMag_std,na.rm = TRUE),
                             Mean_tGravityAccMag_mean = mean(tGravityAccMag_mean,na.rm = TRUE),
                             Mean_tGravityAccMag_std = mean(tGravityAccMag_std,na.rm = TRUE),
                             Mean_tBodyAccJerkMag_mean = mean(tBodyAccJerkMag_mean,na.rm = TRUE),
                             Mean_tBodyAccJerkMag_std = mean(tBodyAccJerkMag_std,na.rm = TRUE),
                             Mean_tBodyGyroMag_mean = mean(tBodyGyroMag_mean,na.rm = TRUE),
                             Mean_tBodyGyroMag_std = mean(tBodyGyroMag_std,na.rm = TRUE),
                             Mean_tBodyGyroJerkMag_mean = mean(tBodyGyroJerkMag_mean,na.rm = TRUE),
                             Mean_tBodyGyroJerkMag_std = mean(tBodyGyroJerkMag_std,na.rm = TRUE),
                             Mean_fBodyAcc_mean_X = mean(fBodyAcc_mean_X,na.rm = TRUE),
                             Mean_fBodyAcc_mean_Y = mean(fBodyAcc_mean_Y,na.rm = TRUE),
                             Mean_fBodyAcc_mean_Z = mean(fBodyAcc_mean_Z,na.rm = TRUE),
                             Mean_fBodyAcc_std_X = mean(fBodyAcc_std_X,na.rm = TRUE),
                             Mean_fBodyAcc_std_Y = mean(fBodyAcc_std_Y,na.rm = TRUE),
                             Mean_fBodyAcc_std_Z = mean(fBodyAcc_std_Z,na.rm = TRUE),
                             Mean_fBodyAccJerk_mean_X = mean(fBodyAccJerk_mean_X,na.rm = TRUE),
                             Mean_fBodyAccJerk_mean_Y = mean(fBodyAccJerk_mean_Y,na.rm = TRUE),
                             Mean_fBodyAccJerk_mean_Z = mean(fBodyAccJerk_mean_Z,na.rm = TRUE),
                             Mean_fBodyAccJerk_std_X = mean(fBodyAccJerk_std_X,na.rm = TRUE),
                             Mean_fBodyAccJerk_std_Y = mean(fBodyAccJerk_std_Y,na.rm = TRUE),
                             Mean_fBodyAccJerk_std_Z = mean(fBodyAccJerk_std_Z,na.rm = TRUE),
                             Mean_fBodyGyro_mean_X = mean(fBodyGyro_mean_X,na.rm = TRUE),
                             Mean_fBodyGyro_mean_Y = mean(fBodyGyro_mean_Y,na.rm = TRUE),
                             Mean_fBodyGyro_mean_Z = mean(fBodyGyro_mean_Z,na.rm = TRUE),
                             Mean_fBodyGyro_std_X = mean(fBodyGyro_std_X,na.rm = TRUE),
                             Mean_fBodyGyro_std_Y = mean(fBodyGyro_std_Y,na.rm = TRUE),
                             Mean_fBodyGyro_std_Z = mean(fBodyGyro_std_Z,na.rm = TRUE),
                             Mean_fBodyAccMag_mean = mean(fBodyAccMag_mean,na.rm = TRUE),
                             Mean_fBodyAccMag_std = mean(fBodyAccMag_std,na.rm = TRUE),
                             Mean_fBodyBodyAccJerkMag_mean = mean(fBodyBodyAccJerkMag_mean,na.rm = TRUE),
                             Mean_fBodyBodyAccJerkMag_std = mean(fBodyBodyAccJerkMag_std,na.rm = TRUE),
                             Mean_fBodyBodyGyroMag_mean = mean(fBodyBodyGyroMag_mean,na.rm = TRUE),
                             Mean_fBodyBodyGyroMag_std = mean(fBodyBodyGyroMag_std,na.rm = TRUE),
                             Mean_fBodyBodyGyroJerkMag_mean = mean(fBodyBodyGyroJerkMag_mean,na.rm = TRUE),
                             Mean_fBodyBodyGyroJerkMag_std = mean(fBodyBodyGyroJerkMag_std,na.rm = TRUE))


# writes the result to text file

write.table(df_summary_mean,"./df_summary.txt",row.names=F) 
