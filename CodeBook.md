---
title: "CodeBook"
author: "Roberto Obando"
date: "Sunday, May 31, 2015"
output: html_document
---
# Code Book
## Introduction 
This document describes the variables used in the Getting and Cleaning Data project. 
It also describes the data used, and the transformations applied to the data to get the final result.

## Variables
The variable used in this project are:  
*  subject_merge : the train and test merged data set for subject.txt  
*  X_merge : the train and test merged data for X_test and X_train  
*  Y_merge : the  train and test merged data for Y_test and y_train  
*  features: the names corrected for the X_merge data set from features.txt  
*  mean_std: a vector used to get the data  
*  activity_labels: the normalized data set form the activity_labels.txt  
*  final : the merged data set of subject_merge, X_merge and Y_merge  
*  col_names : the normalized column names of final  
*  tidy_final: the data set with the averages of each variable for each activity and each subject  

## Data
The source o the data is downloaded from:  
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"  
This file is uncompressed into the local directory and creates a folder named: "UCI HAR Dataset"  
The training and test data files (.txt) are the source files for analysis:  
+ features.txt  
+ activity_labels.txt  
+ subject_test.txt  
+ X_test.txt  
+ y_test.txt  
+ subject_train.txt  
+ X_train.txt  
+ y_train.txt  

The result file is:  
+ tidy_final.txt  

## Transformations
The project statement mentioned 5 steps or transformations to achieve the final result. These are the transformations used in the source code:

1. Merge the training and test sets  
  *  Get data  
  *  Merge Data  
2. Extracts only the measurements on the mean and standard deviation for each measurement  
  * subset only to mean and std  
  * rename columns  
3. Uses descriptive activity names to name the activities in the data set  
  * fix activity names   
  * rename Y_merge column   
4. Appropriately labels the data set with descriptive variable names  
  * standarizing column names   
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject  