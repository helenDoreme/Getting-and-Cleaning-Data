##README

###Introduction

This repository contains the course project for the Coursera course "Getting and Cleaning Data", a part of the Data Science Specialization program. 

The purpose of this project is to demonstrate the ability to collect, work with, and clean a dataset. The goal is to prepare tidy data that can be used for later analysis. 

The non-tidy data of this project can be obtained at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This project requires to create a R script called *run_analysis.R* that does the following:

1. Merges the training and the test sets to create one dataset
2. Extracts only the measurements on the mean and standard deviation for each measurement 
3. Uses descriptive activity names to name the activities in the dataset
4. Appropriately labels the dataset with descriptive variable names 
5. From the dataset in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject


###Files Contained in this Repository
1. A script (*run_analysis.R*)
2. A tidy dataset (*tidydataset.txt*)
3. A Code Book (*CodeBook.md*)
4. A README file (*README.md*)


###Script (*run_analysis.R*)
*run_analysis.R* was implemented in RStudio.

This script performs the following high-level tasks:

1. Prepares R dependencies
2. Reads the original datasets
3. Merges subjects, activities and features
4. Merges the training and the test datasets to create one dataset
5. Extracts only the mean and standard deviation measurements 
6. Re-names the activities with descriptive activity names 
7. Re-labels the dataset with descriptive variable names 
8. Creates a independent tidy dataset with the average of each variable for each activity and each subject
9. Write the newly created tidy dataset into a txt file


###Tidy dataset (*tidydataset.txt*)
*tidydataset* contains 30 unique subjects and 6 activities for each subject, which resulted in 180 observations. The first row contains the variable names and the subsequent rows contain the averages of each variable for each subject-activity pair.


###Code Book (*CodeBook.md*)
*CodeBook.md* describes the variables, the data, and the transformation steps that are performed to clean up the data. 