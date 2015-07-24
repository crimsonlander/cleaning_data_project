if (!file.exists("data.zip"))
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "data.zip", method = "libcurl")
if (!dir.exists("UCI HAR Dataset"))
  unzip("data.zip")

allFeatures = readLines(con = file("UCI HAR Dataset/features.txt"))

selectedFeatures = readLines(con = file("selected_features.txt"))

train_data = cbind(read.table("UCI HAR Dataset/train/X_train.txt"), 
                   read.table("UCI HAR Dataset/train/y_train.txt", colClasses = "integer"), 
                   read.table("UCI HAR Dataset/train/subject_train.txt", colClasses = "integer"))

colnames(train_data) = c(allFeatures, "Activity", "Subject")

selectedTrainData = train_data[, c(selectedFeatures, "Activity", "Subject")]
rm(train_data)

test_data = cbind(read.table("UCI HAR Dataset/test/X_test.txt"), 
                  read.table("UCI HAR Dataset/test/y_test.txt", colClasses = "integer"), 
                  read.table("UCI HAR Dataset/test/subject_test.txt", colClasses = "integer"))

colnames(test_data) = c(allFeatures, "Activity", "Subject")

selectedTestData = test_data[, c(selectedFeatures, "Activity", "Subject")]
rm(test_data)

data = rbind(selectedTrainData, selectedTestData)
data$Activity = factor(data$Activity, 1:6, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

tidy_data = aggregate(. ~ Activity + Subject, data, mean)

write.table(tidy_data, "tidy_data.txt", row.names = FALSE, col.names = FALSE)