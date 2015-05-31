# Getting and Cleaning-Data Project

This repository contains the source code file (run_analysis.R), Result file (tidy_final.txt) and the code book  (CodeBook.md)

The data source is from the UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set :  
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
 
 This data can be downloaded from:  
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The source code is an R script and consists of 5 steps:  
1. Merges the training and the test sets to create one data set  
2. Extracts only the measurements on the mean and standard deviation for each measurement  
3. Uses descriptive activity names to name the activities in the data set  
4. Appropriately labels the data set with descriptive variable names   
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

The result is the tidy_final.txt file.

The CodeBook.md file describes the variables, data, and transformations performed to achieve the result.