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

# cut or replace characters "-" , "," , ")" , "(" of the names of the label

colunNames <- gsub("-|[,]","_",gsub("[(]|[)]","",colunNames))

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

subs <- c(1,2,3,grep("[Mm]ean|[Ss]td",names(df_analysis)))

df_analysis <- df_analysis [,subs]

# Uses descriptive activity names to name the activities in the data set

df_analysis <- join(df_analysis,al)

rm(subs)
rm(al)

# writes the result to text file

write.table(df_analysis,"./df_analisys.txt",row.names=F) 

#Create tidy data set with the average of each variable for each activity and each subject.

df_summary <- group_by(df_analysis,subject,activity_id,activity_name)

df_summary_mean <- summarise(df_summary,tBodyAcc_mean_X=mean(tBodyAcc_mean_X,na.rm = TRUE),
                             tBodyAcc_mean_Y=mean(tBodyAcc_mean_Y,na.rm = TRUE),
                             tBodyAcc_mean_Z=mean(tBodyAcc_mean_Z,na.rm = TRUE),
                             tBodyAcc_std_X=mean(tBodyAcc_std_X,na.rm = TRUE),
                             tBodyAcc_std_Y=mean(tBodyAcc_std_Y,na.rm = TRUE),
                             tBodyAcc_std_Z=mean(tBodyAcc_std_Z,na.rm = TRUE),
                             tGravityAcc_mean_X=mean(tGravityAcc_mean_X,na.rm = TRUE),
                             tGravityAcc_mean_Y=mean(tGravityAcc_mean_Y,na.rm = TRUE),
                             tGravityAcc_mean_Z=mean(tGravityAcc_mean_Z,na.rm = TRUE),
                             tGravityAcc_std_X=mean(tGravityAcc_std_X,na.rm = TRUE),
                             tGravityAcc_std_Y=mean(tGravityAcc_std_Y,na.rm = TRUE),
                             tGravityAcc_std_Z=mean(tGravityAcc_std_Z,na.rm = TRUE),
                             tBodyAccJerk_mean_X=mean(tBodyAccJerk_mean_X,na.rm = TRUE),
                             tBodyAccJerk_mean_Y=mean(tBodyAccJerk_mean_Y,na.rm = TRUE),
                             tBodyAccJerk_mean_Z=mean(tBodyAccJerk_mean_Z,na.rm = TRUE),
                             tBodyAccJerk_std_X=mean(tBodyAccJerk_std_X,na.rm = TRUE),
                             tBodyAccJerk_std_Y=mean(tBodyAccJerk_std_Y,na.rm = TRUE),
                             tBodyAccJerk_std_Z=mean(tBodyAccJerk_std_Z,na.rm = TRUE),
                             tBodyGyro_mean_X=mean(tBodyGyro_mean_X,na.rm = TRUE),
                             tBodyGyro_mean_Y=mean(tBodyGyro_mean_Y,na.rm = TRUE),
                             tBodyGyro_mean_Z=mean(tBodyGyro_mean_Z,na.rm = TRUE),
                             tBodyGyro_std_X=mean(tBodyGyro_std_X,na.rm = TRUE),
                             tBodyGyro_std_Y=mean(tBodyGyro_std_Y,na.rm = TRUE),
                             tBodyGyro_std_Z=mean(tBodyGyro_std_Z,na.rm = TRUE),
                             tBodyGyroJerk_mean_X=mean(tBodyGyroJerk_mean_X,na.rm = TRUE),
                             tBodyGyroJerk_mean_Y=mean(tBodyGyroJerk_mean_Y,na.rm = TRUE),
                             tBodyGyroJerk_mean_Z=mean(tBodyGyroJerk_mean_Z,na.rm = TRUE),
                             tBodyGyroJerk_std_X=mean(tBodyGyroJerk_std_X,na.rm = TRUE),
                             tBodyGyroJerk_std_Y=mean(tBodyGyroJerk_std_Y,na.rm = TRUE),
                             tBodyGyroJerk_std_Z=mean(tBodyGyroJerk_std_Z,na.rm = TRUE),
                             tBodyAccMag_mean=mean(tBodyAccMag_mean,na.rm = TRUE),
                             tBodyAccMag_std=mean(tBodyAccMag_std,na.rm = TRUE),
                             tGravityAccMag_mean=mean(tGravityAccMag_mean,na.rm = TRUE),
                             tGravityAccMag_std=mean(tGravityAccMag_std,na.rm = TRUE),
                             tBodyAccJerkMag_mean=mean(tBodyAccJerkMag_mean,na.rm = TRUE),
                             tBodyAccJerkMag_std=mean(tBodyAccJerkMag_std,na.rm = TRUE),
                             tBodyGyroMag_mean=mean(tBodyGyroMag_mean,na.rm = TRUE),
                             tBodyGyroMag_std=mean(tBodyGyroMag_std,na.rm = TRUE),
                             tBodyGyroJerkMag_mean=mean(tBodyGyroJerkMag_mean,na.rm = TRUE),
                             tBodyGyroJerkMag_std=mean(tBodyGyroJerkMag_std,na.rm = TRUE),
                             fBodyAcc_mean_X=mean(fBodyAcc_mean_X,na.rm = TRUE),
                             fBodyAcc_mean_Y=mean(fBodyAcc_mean_Y,na.rm = TRUE),
                             fBodyAcc_mean_Z=mean(fBodyAcc_mean_Z,na.rm = TRUE),
                             fBodyAcc_std_X=mean(fBodyAcc_std_X,na.rm = TRUE),
                             fBodyAcc_std_Y=mean(fBodyAcc_std_Y,na.rm = TRUE),
                             fBodyAcc_std_Z=mean(fBodyAcc_std_Z,na.rm = TRUE),
                             fBodyAcc_meanFreq_X=mean(fBodyAcc_meanFreq_X,na.rm = TRUE),
                             fBodyAcc_meanFreq_Y=mean(fBodyAcc_meanFreq_Y,na.rm = TRUE),
                             fBodyAcc_meanFreq_Z=mean(fBodyAcc_meanFreq_Z,na.rm = TRUE),
                             fBodyAccJerk_mean_X=mean(fBodyAccJerk_mean_X,na.rm = TRUE),
                             fBodyAccJerk_mean_Y=mean(fBodyAccJerk_mean_Y,na.rm = TRUE),
                             fBodyAccJerk_mean_Z=mean(fBodyAccJerk_mean_Z,na.rm = TRUE),
                             fBodyAccJerk_std_X=mean(fBodyAccJerk_std_X,na.rm = TRUE),
                             fBodyAccJerk_std_Y=mean(fBodyAccJerk_std_Y,na.rm = TRUE),
                             fBodyAccJerk_std_Z=mean(fBodyAccJerk_std_Z,na.rm = TRUE),
                             fBodyAccJerk_meanFreq_X=mean(fBodyAccJerk_meanFreq_X,na.rm = TRUE),
                             fBodyAccJerk_meanFreq_Y=mean(fBodyAccJerk_meanFreq_Y,na.rm = TRUE),
                             fBodyAccJerk_meanFreq_Z=mean(fBodyAccJerk_meanFreq_Z,na.rm = TRUE),
                             fBodyGyro_mean_X=mean(fBodyGyro_mean_X,na.rm = TRUE),
                             fBodyGyro_mean_Y=mean(fBodyGyro_mean_Y,na.rm = TRUE),
                             fBodyGyro_mean_Z=mean(fBodyGyro_mean_Z,na.rm = TRUE),
                             fBodyGyro_std_X=mean(fBodyGyro_std_X,na.rm = TRUE),
                             fBodyGyro_std_Y=mean(fBodyGyro_std_Y,na.rm = TRUE),
                             fBodyGyro_std_Z=mean(fBodyGyro_std_Z,na.rm = TRUE),
                             fBodyGyro_meanFreq_X=mean(fBodyGyro_meanFreq_X,na.rm = TRUE),
                             fBodyGyro_meanFreq_Y=mean(fBodyGyro_meanFreq_Y,na.rm = TRUE),
                             fBodyGyro_meanFreq_Z=mean(fBodyGyro_meanFreq_Z,na.rm = TRUE),
                             fBodyAccMag_mean=mean(fBodyAccMag_mean,na.rm = TRUE),
                             fBodyAccMag_std=mean(fBodyAccMag_std,na.rm = TRUE),
                             fBodyAccMag_meanFreq=mean(fBodyAccMag_meanFreq,na.rm = TRUE),
                             fBodyBodyAccJerkMag_mean=mean(fBodyBodyAccJerkMag_mean,na.rm = TRUE),
                             fBodyBodyAccJerkMag_std=mean(fBodyBodyAccJerkMag_std,na.rm = TRUE),
                             fBodyBodyAccJerkMag_meanFreq=mean(fBodyBodyAccJerkMag_meanFreq,na.rm = TRUE),
                             fBodyBodyGyroMag_mean=mean(fBodyBodyGyroMag_mean,na.rm = TRUE),
                             fBodyBodyGyroMag_std=mean(fBodyBodyGyroMag_std,na.rm = TRUE),
                             fBodyBodyGyroMag_meanFreq=mean(fBodyBodyGyroMag_meanFreq,na.rm = TRUE),
                             fBodyBodyGyroJerkMag_mean=mean(fBodyBodyGyroJerkMag_mean,na.rm = TRUE),
                             fBodyBodyGyroJerkMag_std=mean(fBodyBodyGyroJerkMag_std,na.rm = TRUE),
                             fBodyBodyGyroJerkMag_meanFreq=mean(fBodyBodyGyroJerkMag_meanFreq,na.rm = TRUE),
                             angletBodyAccMean_gravity=mean(angletBodyAccMean_gravity,na.rm = TRUE),
                             angletBodyAccJerkMean_gravityMean=mean(angletBodyAccJerkMean_gravityMean,na.rm = TRUE),
                             angletBodyGyroMean_gravityMean=mean(angletBodyGyroMean_gravityMean,na.rm = TRUE),
                             angletBodyGyroJerkMean_gravityMean=mean(angletBodyGyroJerkMean_gravityMean,na.rm = TRUE),
                             angleX_gravityMean=mean(angleX_gravityMean,na.rm = TRUE),
                             angleY_gravityMean=mean(angleY_gravityMean,na.rm = TRUE),
                             angleZ_gravityMean=mean(angleZ_gravityMean,na.rm = TRUE))

# writes the result to text file

write.table(df_summary_mean,"./df_summary.txt",row.names=F) 
