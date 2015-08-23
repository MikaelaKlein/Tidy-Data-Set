tidy_data <- library(plyr); library(dplyr)
## Reading all relevent data for test and training sets from Working Directory   
    subject_test <- read.table("./test/subject_test.txt")
    y_test <- read.table("./test/y_test.txt")
    X_test <- read.table("./test/X_test.txt")
    subject_train <- read.table("./train/subject_train.txt")
    y_train <- read.table("./train/y_train.txt")
    X_train <- read.table("./train/X_train.txt")
    
## Merge data into one dataframe    
    alltest <- cbind(subject_test, y_test, X_test)
    alltrain <- cbind(subject_train, y_train, X_train)
    allData <- rbind(alltest, alltrain)
    
## Rename and select wanted columns    
    colnames(allData) <- c("Subject_ID", "Activity", "3":"563") 
    ExtractedData <- select(allData, 1, 2, 3:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 518:519, 531:532, 544:545)
    ExtractedData$Activity <- as.factor(ExtractedData$Activity)
    ExtractedData$Activity <- revalue(ExtractedData$Activity, c("1" = "WALKING", "2" = "WALKING_UPSTAIRS", "3" = "WALKING_DOWNSTAIRS", "4" = "SITTING", "5" = "STANDING", "6" = "LAYING"))
    ExtractedData %>%
        select(Subject_ID, Activity, 'tBodyAcc-mean()-X' = 3, 'tBodyAcc-mean()-Y' = 4, 'tBodyAcc-mean()-Z' = 5, 'tBodyAcc-std()-X' = 6, 'tBodyAcc-std()-Y' = 7, 'tBodyAcc-std()-Z' = 8, 'tGravityAcc-mean()-X' = 9, 'tGravityAcc-mean()-Y' = 10, 'tGravityAcc-mean()-Z' = 11, 'tGravityAcc-std()-X' = 12, 'tGravityAcc-std()-Y' = 13, 'tGravityAcc-std()-Z' = 14, 'tBodyAccJerk-mean()-X' = 15, 'tBodyAccJerk-mean()-Y' = 16, 'tBodyAccJerk-mean()-Z' = 17, 'tBodyAccJerk-std()-X' = 18, 'tBodyAccJerk-std()-Y' = 19, 'tBodyAccJerk-std()-Z' = 20, 'tBodyGyro-mean()-X' = 21, 'tBodyGyro-mean()-Y' = 22, 'tBodyGyro-mean()-Z' = 23, 'tBodyGyro-std()-X' = 24, 'tBodyGyro-std()-Y' = 25, 'tBodyGyro-std()-Z' = 26, 'tBodyGyroJerk-mean()-X' = 27, 'tBodyGyroJerk-mean()-Y' = 28, 'tBodyGyroJerk-mean()-Z' = 29, 'tBodyGyroJerk-std()-X' = 30, 'tBodyGyroJerk-std()-Y' = 31, 'tBodyGyroJerk-std()-Z' = 32, 'tBodyAccMag-mean()' = 33, 'tBodyAccMag-std()' = 34, 'tGravityAccMag-mean()' = 35, 'tGravityAccMag-std()' = 36, 'tBodyAccJerkMag-mean()' = 37, 'tBodyAccJerkMag-std()' = 38, 'tBodyGyroMag-mean()' = 39, 'tBodyGyroMag-std()' = 40, 'tBodyGyroJerkMag-mean()' = 41, 'tBodyGyroJerkMag-std()' = 42, 'fBodyAcc-mean()-X' = 43, 'fBodyAcc-mean()-Y' = 44, 'fBodyAcc-mean()-Z' = 45, 'fBodyAcc-std()-X' = 46, 'fBodyAcc-std()-Y' = 47, 'fBodyAcc-std()-Z' = 48, 'fBodyAccJerk-mean()-X' = 49, 'fBodyAccJerk-mean()-Y' = 50, 'fBodyAccJerk-mean()-Z' = 51, 'fBodyAccJerk-std()-X' = 52, 'fBodyAccJerk-std()-Y' = 53, 'fBodyAccJerk-std()-Z' = 54, 'fBodyGyro-mean()-X' = 55, 'fBodyGyro-mean()-Y' = 56, 'fBodyGyro-mean()-Z' = 57, 'fBodyGyro-std()-X' = 58, 'fBodyGyro-std()-Y' = 59, 'fBodyGyro-std()-Z' = 60, 'fBodyAccMag-mean()' = 61, 'fBodyAccMag-std()' = 62, 'fBodyBodyAccJerkMag-mean()' = 63, 'fBodyBodyAccJerkMag-std()' = 64, 'fBodyBodyGyroMag-mean()' = 65, 'fBodyBodyGyroMag-std()' = 66, 'fBodyBodyGyroJerkMag-mean()' = 67, 'fBodyBodyGyroJerkMag-std()' = 68) %>%
    
## Group by Subject_ID, Activity and find average of each variable
    group_by(Subject_ID, Activity) %>%
    summarise_each(funs(mean))
    
    