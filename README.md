GCDCourseProject - ReadMe
================

This repository contains the files of the Getting and Cleaning Data Course Project. Getting and Cleaning Data is a course offered on Coursera by the John Hopkins University. More information about the course can be found [here](https://www.coursera.org/course/getdata). 

The aim of the course project is to demonstrate the ability to collect, work with, and clean a dataset. The dataset used for this project contains data collected from the accelerometers from the [Samsung Galaxy S II smartphone][1]. 

This repository contains the following files next to this readme document:

- Codebook.md
- Features.md
- run_analysis.R
- tidydata.txt

Each of these files will be discussed next.

### Codebook.md
The codebook contains information about the way the original data was collected (the study set-up). It provides a description of the raw dataset and its variables. In addition, it describes the tidy dataset (stored as tidydata.txt) and its variables.

### Features.md
This document serves as a supplement to the codebook. It provides a description and a list of the feature-variables used in the raw dataset. 

### run_analysis.R
This file contains the processing script that can be used to process the raw data into the tidy dataset. The script contains both the R code and descriptions of how this code is supposed to work. A general description of how the script processes the raw data will be presented next.

#### Step 0: Set the Working Directory and Download the Dataset. 
This step is called step zero because it's not mentioned in the course project description on the Coursera website. However, it is important to set the working directory and download the data before the actual processing starts. The code corresponding to this step will:

- set the working directory
- download the dataset
- unzip the dataset

The following five steps do correspond to the steps mentioned in the course project description.

#### Step 1: Merge the Test and Training Datasets
The code corresponding to step 1 will:

- load the test and training datasets into R
- merge the two datasets into one (the merged dataset is called "X_complete")

#### Step 2: Extract the Measurements of the Mean and Standard Deviation
The code corresponding to step 2 will:

- load the dataset containing the 561 features into R
- check which features mention the mean (mean()) and standard deviation (std()) in their names
- subset the dataset (X_complete) based on these 66 features, so that only the data for these features remain

#### Step 3: Name the Activities
The code corresponding to step 3 will:

- load the two datasets containing the activity numbers corresponding to the training and test datasets into R
- merge the two datasets so that one variable is created containing all the activity numbers
- add this variable to the complete dataset (X_complete)
- replace the numbers with their corresponding activity names

#### Step 4: Name the Variables
The code corresponding to step 4 will:

- store the names of the features that mention the mean (mean()) and standard deviation (std()) in their names
- replace the columnames of the complete dataset (X_complete) with these names, including the name "Activity" for the activity variable

#### Step 5: Create the New Tidy Dataset
The code corresponding to step 5 will:

- load the two datasets that contain the subject numbers into R
- merge these two datasets so that one variable is created containing all the subject numbers corresponding to the observations in the complete dataset (X_complete)
- add this variable to the complete dataset (X_complete) and name it "Subject"
- use the dplyr package to group the complete dataset by subject and activity
- calculate the mean of each of the 66 feature variables per activity per subject
- save the result in the new dataset called "tidydata"
- save the tidydata file as a text file ("tidydata.txt")

### tidydata.txt
This textfile contains the tidy dataset as produced by the processing script described above. 

### References
[1]: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
