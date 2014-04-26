# Getting and Cleaning Data Project
# Coursera - 4/26/2014

## Description
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis.

## Deliverables
1. a tidy data set
2. a link to a Github repository with the script for performing the analysis, and
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

### Tidy data set
The general principle for a [tidy data set](http://vita.had.co.nz/papers/tidy-data.pdf) are:

* Each variable you measure should be in one column
* Each different observation of that variable should be in a different row
* There should be one table for each "kind" of variable
* If there are multiple tables, they should include a column in the table that allows them to be linked

Once the process is followed to turn raw data into actionable information, at the end of the day you will get data ready for further analysis.
The final product of this project is called **TidySamsungData.txt**. This file can be found in this repo.

### Github repo link
If you are reading this, it means you are already in this repo under the link:
[https://github.com/quigufrale/GandCdata-project](https://github.com/quigufrale/GandCdata-project)

The script to perform the data analysis follow a natural flow of doing things.
It is assumed that the original data has been properly downloaded from its [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and it has been properly saved under the *data" folder on your current directory:

*./data/UCI HAR Dataset*

The cleaning process starts off by reading the files from the training and testing sets. In each case, once the whole data has been read, it is subset to obtain only the measurements on the mean and standard deviation for each measurement prior to merging these training and testing data sets.
Since **R** stores the data in RAM for usage, the unused variables are removed from the *Global Environment* at any time where convenient.
Once the data sets are properly merged by the application of cbind and rbind, appropriate names are given to the variables of interest. Factor variables such as *Activity* are coded based on a descriptive name, and appropriate labels have been created for identifying each column on the data frame.

The R script called run_analysis.R in this repo will performed as indicated above. In addition, this file has been fully commented to ease the understanding of the process.

### Code book
The Code book can be found at CodeBook.md in this repo.