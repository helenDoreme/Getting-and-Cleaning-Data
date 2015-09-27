##Code Book

###Original Data
This dataset is derived from _Human Activity Recognition Using Smartphones Data set_ at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  


####Original Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


####Original Attribute Information
For each record in the dataset it is provided: 

1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
2. Triaxial Angular velocity from the gyroscope. 
3. A 561-feature vector with time and frequency domain variables. 
4. Its activity label. 
5. An identifier of the subject who carried out the experiment.


###Data Acquisition
1. Create a directory named *GCD Project* in the current working directory.
2. Switch the current working directory to *GCD Project*.
3. Download the data files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
4. Unzip the files and save them as UCI HAR Dataset in *GCD Project*.


###Data Transformation 
1. Read all the needed datasets using read.table( ) and store them with more descriptive names as listed below. 
            
                  Original Files                            Stored As
                    X_train.txt                               train
                    X_test.txt                                test
                    Y_train.txt                              trainlabel
                    Y_test.txt                               testlabel
                 subject_train.txt                         subject_train
                 subject_test.txt                          subject_test
                     features                              featuremeasure
                  activity_labels                          activity_labels
 
2. Give names to each columns in the datasets using names( ) as listed below.   

                      Data Set                              Column Names
                   subject_train                              sub_id
                   subject_test                               sub_id
                    trainlabel                               activity 
                     testlabel                               activity
                       train                 varialbe names listed in featuremeasure$V2 
                       test                  varialbe names listed in featuremeasure$V2
                       
3. Combine *subject_train*, *trainlabel* and *train* using cbind( ) to create a 7352 x 563 data frame called *traincomplete*.
4. Combine *subject_test*, *testlabel* and *test* using cbind( ) to create a 2947 x 563 data frame called *testcomplete*.
5. Combine *traincomplete* and *testcomplete* using rbind( ) to create a 10299 x 563 data frame called *train_test*, which combines the training and the test datasets.The "sub_id" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activities, the rest of the columns contain measurements ranging from -1 to 1 exclusive. 
6. Select the columns in *train_test* that only measure "mean" or "std" using grepl( ).
7. Subset the *train_test* to create a 10299 x 66 data frame called *mean_std_sub*, which extracts only the measurements of mean and standard deviation.
8. Add the columns of "sub-id" and "activity" to *mean_std_sub* using cbind( ) to create a 10299 x 68 data frame called *mean_std*.
9. Replace the value (1,2,3,4,5,6) in the activity column in *mean_std* with descriptive activity names (WALKING, WALKING-UPSTAIRS, WALKING-DOWNSTAIRS, SITTING, STANDING, LAYING) that are contained in *activity_labels* using factor( ).
10. To appropriately label the data set *mean_std* with descriptive variable names, remove all the "()" in the original variable names and replace all the "mean" and "std" in the original variable names by "Mean" and "STD" using gsub( ).
11. To clean the dataset based on subject ID and activity, melt *mean_std* using melt( ) to generate a 679734 x 4 data frame called *melted*.
12. To create a dataset showing the average of each variable for each activity and each subject, reshape *melted* using dcast( ) to generate a 180 x 68 tidy data set called *tidyset*. The 68 variables contained in *tidyset* are listed below. 

```
         sub_id                          activity                    tBodyAcc-Mean-X          
     tBodyAcc-Mean-Y                 tBodyAcc-Mean-Z                 tBodyAcc-STD-X          
     tBodyAcc-STD-Y                  tBodyAcc-STD-Z                  tGravityAcc-Mean-X       
     tGravityAcc-Mean-Y              tGravityAcc-Mean-Z              tGravityAcc-STD-X       
     tGravityAcc-STD-Y               tGravityAcc-STD-Z               tBodyAccJerk-Mean-X      
     tBodyAccJerk-Mean-Y             tBodyAccJerk-Mean-Z             tBodyAccJerk-STD-X       
     tBodyAccJerk-STD-Y              tBodyAccJerk-STD-Z              tBodyGyro-Mean-X         
     tBodyGyro-Mean-Y                tBodyGyro-Mean-Z                tBodyGyro-STD-X          
     tBodyGyro-STD-Y                 tBodyGyro-STD-Z                 tBodyGyroJerk-Mean-X     
     tBodyGyroJerk-Mean-Y            tBodyGyroJerk-Mean-Z            tBodyGyroJerk-STD-X      
     tBodyGyroJerk-STD-Y             tBodyGyroJerk-STD-Z             tBodyAccMag-Mean         
     tBodyAccMag-STD                 tGravityAccMag-Mean             tGravityAccMag-STD       
     tBodyAccJerkMag-Mean            tBodyAccJerkMag-STD             tBodyGyroMag-Mean        
     tBodyGyroMag-STD                tBodyGyroJerkMag-Mean           tBodyGyroJerkMag-STD     
     fBodyAcc-Mean-X                 fBodyAcc-Mean-Y                 fBodyAcc-Mean-Z          
     fBodyAcc-STD-X                  fBodyAcc-STD-Y                  fBodyAcc-STD-Z           
     fBodyAccJerk-Mean-X             fBodyAccJerk-Mean-Y             fBodyAccJerk-Mean-Z      
     fBodyAccJerk-STD-X              fBodyAccJerk-STD-Y              fBodyAccJerk-STD-Z       
     fBodyGyro-Mean-X                fBodyGyro-Mean-Y                fBodyGyro-Mean-Z         
     fBodyGyro-STD-X                 fBodyGyro-STD-Y                 fBodyGyro-STD-Z          
     fBodyAccMag-Mean                fBodyAccMag-STD                 fBodyBodyAccJerkMag-Mean 
     fBodyBodyAccJerkMag-STD         fBodyBodyGyroMag-Mean           fBodyBodyGyroMag-STD     
     fBodyBodyGyroJerkMag-Mean       fBodyBodyGyroJerkMag-STD  

```
13. Write the *tidyset* into *tidydataset.txt* using write.table( ) and store it in the current working directory. 
 

###Tidy Data Set

The *tidydataset* is a text file. It contains 30 unique subjects and 6 activities for each subject, which resulted in 180 observations. The first row contains the variable names and the subsequent rows contain the averages of each variable for each subject-activity pair.


###References

1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
