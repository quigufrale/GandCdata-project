# Getting and Cleaning Data Project - Code Book

## Original Data
The data from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained: 
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
Here are the data for the project:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


## Tidy Data
The tidy data called **TidySamsungData.txt** in this repo was obtained by following the process as indicated in **run_analysis.R**
The variables used to create the tidy data set from the original data are:
* Subject: Corresponding to the 30 volunteers coded as integer value.
* Activity: Class labels with 6 levels coded as integer values.
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING
* The estimated mean value, _mean()_**, and standard deviation, _std()_** of the body linear acceleration _tBodyAcc-XYZ_** coded as real values.
1. tBodyAcc-mean()-X
2. tBodyAcc-mean()-Y
3. tBodyAcc-mean()-Z
4. tBodyAcc-std()-X
5. tBodyAcc-std()-Y
6. tBodyAcc-std()-Z

The new variables created to accomplish the task are:
* SubjectNo which corresponds to the Subject in the original data set but in R has been coded as a factor variable with 30 levels.
* Activity has been coded with descriptive activity names rather than the integer numbers as required in the project with six levels:
1. walking
2. walkingUpstairs
3. walkingDownstairs
4. sitting
5. standing
6. laying

To recode the variables from the *revalue* function was used from the *plyr* library.
* The average values of the estimated mean and std of the body acceleration (real numbers) have been obtained using *ddply* from the *plyr* library as well:
1. ave_tBodyAcc_mean_X
2. ave_tBodyAcc_mean_Y
3. ave_tBodyAcc_mean_Z
4. ave_tBodyAcc_std_X
5. ave_tBodyAcc_std_Y
6. ave_tBodyAcc_std_Z

