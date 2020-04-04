
# load libraries
library(dplyr)




zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

if (!file.exists(zipFile)) {
  download.file(zipUrl, zipFile, mode = "wb")
}


dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(zipFile)
}


# train data 
trainingSub <- read.table(file.path(dataPath, "train", "subject_train.txt"))
trainingValue <- read.table(file.path(dataPath, "train", "X_train.txt"))
trainingActivity <- read.table(file.path(dataPath, "train", "y_train.txt"))


testSub <- read.table(file.path(dataPath, "test", "subject_test.txt"))
testValue <- read.table(file.path(dataPath, "test", "X_test.txt"))
testActivity <- read.table(file.path(dataPath, "test", "y_test.txt"))


features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)

activities <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")



humanActivity <- rbind(
  cbind(trainingSub, trainingValue, trainingActivity),
  cbind(testSub, testValue, testActivity)
)


rm(trainingSub, trainingValue, trainingActivity, 
   testSub, testValue, testActivity)


colnames(humanActivity) <- c("subject", features[, 2], "activity")



columnsToKeep <- grepl("subject|activity|mean|std", colnames(humanActivity))


humanActivity <- humanActivity[, columnsToKeep]





humanActivity$activity <- factor(humanActivity$activity, 
                                 levels = activities[, 1], labels = activities[, 2])


humanActivityCols <- colnames(humanActivity)


humanActivityCols <- gsub("[\\(\\)-]", "", humanActivityCols)


humanActivityCols <- gsub("^f", "frequencyDomain", humanActivityCols)
humanActivityCols <- gsub("^t", "timeDomain", humanActivityCols)
humanActivityCols <- gsub("Acc", "Accelerometer", humanActivityCols)
humanActivityCols <- gsub("Gyro", "Gyroscope", humanActivityCols)
humanActivityCols <- gsub("Mag", "Magnitude", humanActivityCols)
humanActivityCols <- gsub("Freq", "Frequency", humanActivityCols)
humanActivityCols <- gsub("mean", "Mean", humanActivityCols)
humanActivityCols <- gsub("std", "StandardDeviation", humanActivityCols)


humanActivityCols <- gsub("BodyBody", "Body", humanActivityCols)


colnames(humanActivity) <- humanActivityCols



humanActivityMeans <- humanActivity %>% 
  group_by(subject, activity) %>%
  summarise_each(funs(mean))


write.table(humanActivityMeans, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)