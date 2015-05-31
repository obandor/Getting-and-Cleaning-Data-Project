## Getting and Cleaning Data Project
## Project steps
 ## 1. Merges the training and the test sets to create one data set.
 ## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 ## 3. Uses descriptive activity names to name the activities in the data set
 ## 4. Appropriately labels the data set with descriptive variable names. 
 ## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#####
## 1. Merges the training and the test sets to create one data set.
#####

# getting data set
if(!file.info('UCI HAR Dataset')$isdir)
{
  library(downloader)
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download(url, dest="dataset.zip", mode="wb") 
  unzip ("dataset.zip", exdir = ".")
  file.remove("dataset.zip")
}

# Merging all files by type: subject, x, y
subject_merge <- rbind(read.table("UCI HAR Dataset/test/subject_test.txt"),read.table("UCI HAR Dataset/train/subject_train.txt"))
X_merge <- rbind(read.table("UCI HAR Dataset/test/X_test.txt"),read.table("UCI HAR Dataset/train/X_train.txt"))
Y_merge <- rbind(read.table("UCI HAR Dataset/test/y_test.txt"),read.table("UCI HAR Dataset/train/y_train.txt"))

#####
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#####

features <- read.table("UCI HAR Dataset/features.txt")
mean_std <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
# subset only to mean and std 
X_merge <- X_merge[, mean_std]
# rename columns and standarize to lower case
names(X_merge) <- features[mean_std, 2]
names(X_merge) <- tolower(names(X_merge))


#####
## 3. Uses descriptive activity names to name the activities in the data set
#####

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# fix activity names 
activity_labels[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))

# rename Y_merge column
Y_merge[,1] = activity_labels[Y_merge[,1], 2]
names(Y_merge) <- "activity"


#####
## 4. Appropriately labels the data set with descriptive variable names. 
#####

names(subject_merge) <- "subject"
final <- cbind(X_merge, Y_merge, subject_merge)
# standarizing column names
col_names <- names(final)
col_names <- gsub("\\()","",col_names)
names(final) <- col_names

#####
## 5. From the data set in step 4, 
##    creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#####

# columns 67 and 68 are activity an subject.
library(plyr)
tidy_final <- ddply(final, .(activity, subject), function(x) colMeans(x[, 1:66]))
write.table(tidy_final, file = "./tidy_final.txt")




