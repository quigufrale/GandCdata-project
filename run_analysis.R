# Getting and Cleaning Data Project
# Coursera - 4/26/2014
#
# run_analysis.R is in charge of taking the raw data from the accelerometers
# from the Samsung Galaxy S smartphone. A full description is available at the
# site where the data was obtained:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# Here are the data for the project:    
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#

# I assume data was manually downloaded and unzipped into the folder data
# ./data/UCI HAR Dataset

# First read data from the train set located at ./data/UCI HAR Dataset/train
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
##  Subset only the first 6 columns which correspond to the desired mean and std
X_train_sub <- X_train[,1:6]
rm(X_train) # remove to free space for next data
## Read activity from training data set
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
## Read subject from training data set
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Second read data from the test set located at ./data/UCI HAR Dataset/test
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
## Subset only the first 6 columns which correspond to the desired mean and std
X_test_sub <- X_test[,1:6]
rm(X_test)
## Read activity from testing data set
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
## Read subject from testing data set
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# rbind the training and testing data sets
X <- rbind(X_train_sub, X_test_sub)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Remove unused variables
rm(X_train_sub, X_test_sub, y_train, y_test, subject_train, subject_test)

# Give appropriate names to the variables (columns of the data frames)
names(X) <- c("tBodyAcc_mean_X", "tBodyAcc_mean_Y", "tBodyAcc_mean_Z",
              "tBodyAcc_std_X", "tBodyAcc_std_Y", "tBodyAcc_std_Z")
names(y) <- "Activity"
names(subject) <- "SubjectNo"

# cbind data in a single data frame
SamsungData <- cbind(subject, y, X)
rm(subject, y, X)

# Make "SubjectNo" a factor variable
SamsungData$SubjectNo <- factor(SamsungData$SubjectNo)

# Make 'Activity' a factor variable with descriptive activity names
SamsungData$Activity <- factor(SamsungData$Activity)
## rename the level factors
library(plyr)
SamsungData$Activity<-revalue(SamsungData$Activity, c("1" = "walking", "2" = "walkingUpstairs",
                                                      "3" = "walkingDownstairs", "4" = "sitting",
                                                      "5" = "standing", "6" = "laying"))
levels(SamsungData$Activity)

# Create TidySamsungData with mean summary
TidySamsungData <- ddply(SamsungData, .(SubjectNo, Activity), summarize,
                         ave_tBodyAcc_mean_X = mean(tBodyAcc_mean_X),
                         ave_tBodyAcc_mean_Y = mean(tBodyAcc_mean_Y),
                         ave_tBodyAcc_mean_Z = mean(tBodyAcc_mean_Z),
                         ave_tBodyAcc_std_Z = mean(tBodyAcc_std_X),
                         ave_tBodyAcc_std_Z = mean(tBodyAcc_std_Y),
                         ave_tBodyAcc_std_Z = mean(tBodyAcc_std_Z))

# write data set to a text file
write.table(TidySamsungData, file = "./data/TidySamsungData.txt", sep = ",",
            row.names = FALSE, col.names = TRUE)
