## Processing Script 
## Course Projecte - Getting and Cleaning Data
## Author: Stefan Breet
## Date: 2014.12.21

#############################################################
# STEP 0: Set the Working Directory and Download the Dataset
#############################################################

# Set the Working Directory
setwd("/Users/Stefan/Dropbox/Coursera/Getting and Cleaning Data/Course Project")

# Save the dataset's URL
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 

# Download the file and store it in the Working Directory
download.file(fileURL, destfile = "./data.zip", method = "curl")

# Unzip the data
unzip("./data.zip")

################################################
# STEP 1: Merge the Test and Training Datasets
################################################

# Load the X_test data into R
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Load the X_train data into R
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Merge the Test and Train datasets
X_complete <- rbind(X_test, X_train)

######################################################################
# STEP 2: Extract the measurements of the Mean and Standard Deviation
######################################################################

# Load the features overview in R
features <- read.table("./UCI HAR Dataset/features.txt")

# Change the factor variable that contains the feature names to a character
# variable
features$V2 <- as.character(features$V2)

# Check which feature names contain "mean()" and store the result
m <- grep("mean()", features$V2, fixed = TRUE)

# Check which feature names contain "std()" and store the result
s <- grep("std()", features$V2, fixed = TRUE)

# Combine the two vectors 
ms <- c(m, s)

# Sort the ms vector
ms <- sort(ms)

# Use the ms vector to subset the dataset
X_complete <- X_complete[ ,ms]

#############################
# STEP 3: Name the Activities
#############################

# Load the y_test data into R
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Load the y_train data into R
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Merge y_test and y_train to create one variable that contains the activities
# corresponding to the rows of the X_complete dataset
y_complete <- rbind(y_test, y_train)

# Rename the activity variable
colnames(y_complete) <- "Activity"

# Add activity names to X_complete
X_complete <- cbind(y_complete, X_complete)

# Rename activities
X_complete$Activity[X_complete$Activity == 1] <- "WALKING"
X_complete$Activity[X_complete$Activity == 2] <- "WALKING_UPSTAIRS"
X_complete$Activity[X_complete$Activity == 3] <- "WALKING_DOWNSTAIRS"
X_complete$Activity[X_complete$Activity == 4] <- "SITTING"
X_complete$Activity[X_complete$Activity == 5] <- "STANDING"
X_complete$Activity[X_complete$Activity == 6] <- "LAYING"

# Change the class of the activityvariable to factor
X_complete$Activity <- as.factor(X_complete$Activity)

#############################
# STEP 4: Name the Variables
#############################

# Access the featurenames in the features dataset and store them in a 
# characterstring
featurenames <- features$V2[ms]

# Change the column names of the X_complete dataset
colnames(X_complete) <- c("Activity", featurenames)

##################################
# STEP 5: Create new tidy dataset
##################################

## Add subjects to the dataset
# Load subject information of the test dataset into R
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Load subject information of the train dataset into R
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Merge y_test and y_train to create one variable that contains the subjects
# corresponding to the rows of the X_complete dataset
subject_complete <- rbind(subject_test, subject_train)

# Rename the subject variable
colnames(subject_complete) <- "Subject"

# Add subject ID to X_complete
X_complete <- cbind(subject_complete, X_complete)

# Load the dplyr package
library(dplyr)

# Apply the dplyr wrapper to X_complete
X_complete_df <- tbl_df(X_complete)

# Group the dataset per person per activity
persubjectperactivity <- group_by(X_complete_df, Subject, Activity)

# Apply the mean to every column for every group in order to compute the average
# of each variable for each activity and each subject
tidydata <- summarise_each(persubjectperactivity, funs(mean))

# Save the resulting table to as a .txt file
write.table(tidydata, file="./tidydata.txt", row.names = FALSE)
