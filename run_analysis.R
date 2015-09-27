## Load required packages 

library(reshape2)


## read all the datasets needed 

train<-read.table("X_train.txt", sep="", quote="")
test<-read.table("X_test.txt", sep="", quote="")
trainlabel<-read.table("Y_train.txt", sep="", quote="")
testlabel<-read.table("Y_test.txt", sep="", quote="")
subject_train <- read.table("subject_train.txt", sep="", quote="")
subject_test <- read.table("subject_test.txt", sep="", quote="")
featuremeasure <- read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")


## Question1: Merges the training and the test sets to create one dataset 

# add column names to each dataset
names(subject_train) <- "sub_id"
names(subject_test) <- "sub_id"
names(trainlabel) <- "activity"
names(testlabel) <- "activity"
names(train) <- featuremeasure$V2
names(test) <- featuremeasure$V2

# combine the training and the test sets to create one dataset 
traincomplete <- cbind(subject_train, trainlabel, train)
testcomplete <- cbind(subject_test, testlabel, test)
train_test <- rbind(traincomplete, testcomplete)


## Question 2: Extracts only the measurements on the mean and standard deviation (std) for each measurement

# Select the columns that measure either "mean" or "std"
col_mean_std<-grepl("mean\\(|std\\(", names(train_test))

# Subset the train_test dataset to extract only the measurements of mean and std
mean_std_sub<-train_test[, col_mean_std]

# Add the columns of "sub-id" and "activity" to mean_std_sub
mean_std<-cbind(train_test[, c(1:2)], mean_std_sub)


## Question 3: Uses descriptive activity names to name the activities in the dataset

mean_std$activity <- factor(mean_std$activity, labels=activity_labels[ ,2])


## Question 4: Appropriately labels the dataset with descriptive variable names

# Remove "()"
names(mean_std) <- gsub("[()]", "",names(mean_std))

# Replace "mean" with "Mean" and replace "std" with "STD"
names(mean_std) <- gsub("mean", "Mean",names(mean_std))
names(mean_std) <- gsub("std", "STD",names(mean_std))


## Question 5. From the dataset in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject

# Melt the dataset with subject ID and activity
melted <- melt(mean_std, id=c("sub_id","activity"))

# Re-shape the dataset to show the average of each variable for each activity and each subject
tidyset <- dcast(melted, sub_id + activity ~ variable, mean)

# Write the tidy dataset into a text file
write.table(tidyset, file="tidydataset.txt", row.name=FALSE) 