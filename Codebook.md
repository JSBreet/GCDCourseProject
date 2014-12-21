Codebook
================
This codebook provides information on three aspects of the project. A description of the data collection is provided in the Study Set-Up section. The Raw Data section contains an overview of the original dataset. Finally, the dataset that serves as the final product of this project has been described in the Tidy Data section.

### 1. Study Set-Up
The dataset that has been used for this project contains data thas has been collected from the accelerometers of the Samsung Galaxy S II smartphone. To collect the data, expermiments have been carried out with a group of 30 volunteers between 19 and 48 years old. The volunteers performed six activities while wearing their smartphones: 

1. Walking
2. Walking Upstairs
3. Walking Downstairs
4. Sitting
5. Standing 
6. Laying

For each activity, the 3-axial linear acceleration and the 3-acial angular velocity has been recored with the smartphone's embedded accelerometer and gyroscope. The experiments were video-recorded and manually labeled afterwards. 

In order to generate a training dataset and a test dataset, the experiments of 70% of the volunteers were selected to create the former and 30% to create the latter dataset. 

More information about the technical aspects of the processing of the data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#). The dataset can be downloaded there as well. The data has been collected by [Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto working at Smartlab - Non Linear Complex Systems Laboratory] [1]. 

### 2. Raw Dataset
The raw dataset consists of the following data:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial angular velocity from the gyroscope.  
- The data corresponding to the above-mentioned variables are stored in two seperate text files, one for the test dataset and one for the train dataset (X_test.txt and X_train.txt). They are normalized and bounded within -1 and 1.
- A 561-feature vector with time and frequency domain variables. For the complete list of features click [here](https://github.com/JSBreet/GCDCourseProject/blob/master/Features.md). 
- Activity labels. The labels correspond with the six acitivities discussed above. The data indicating which label correspond with which observation are stored in two seperate text files (y_test.txt and y_train.txt)
- An identifier of the subject who carried out the experiment. As discussed above, 30 volunteers participated in the experiments. The variable that indicates the subject per observation is stored in two sperate text files as well (subject_test.txt and subject_train.txt)

### 3. Tidy Dataset
The tidy dataset consists of 180 observations of 68 variables. Of the 561-feature variables of the raw dataset, only those variables that represent a mean or standard deviation have been retained. For each of these variables, the mean of the observations has been calculated per activity per participant. In other words, the tidydataset contains the mean of 66 feature-variables for the six activities performed by each respondent. The tidy dataset is stored in tidydata.txt and a step-by-step description of the way the raw dataset has been processed is presented in the [readme file](https://github.com/JSBreet/GCDCourseProject/blob/master/README.md). A list of variables is presented next:

1. Subject. Integer variable indicating the respondent ranging from 1 to 30.
2. Activity. Factor variable indicating one of the six activities: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING" and "LAYING".

The following 66 feature-variables are numeric variables and contain the mean of the observations corresponding to the activity and the person who performed the activity. As the original observations are bounded within -1 and 1, these variables are bounded to the -1 and 1 as well.

3. tBodyAcc-mean()-X
4. tBodyAcc-mean()-Y
5. tBodyAcc-mean()-Z
6. tBodyAcc-std()-X
7. tBodyAcc-std()-Y
8. tBodyAcc-std()-Z
9. tGravityAcc-mean()-X
10. tGravityAcc-mean()-Y
11. tGravityAcc-mean()-Z
12. tGravityAcc-std()-X
13. tGravityAcc-std()-Y
14. tGravityAcc-std()-Z
15. tBodyAccJerk-mean()-X
16. tBodyAccJerk-mean()-Y
17. tBodyAccJerk-mean()-Z
18. tBodyAccJerk-std()-X
19. tBodyAccJerk-std()-Y
20. tBodyAccJerk-std()-Z
21. tBodyGyro-mean()-X
22. tBodyGyro-mean()-Y
23. tBodyGyro-mean()-Z
24. tBodyGyro-std()-X
25. tBodyGyro-std()-Y
26. tBodyGyro-std()-Z
27. tBodyGyroJerk-mean()-X
28. tBodyGyroJerk-mean()-Y
29. tBodyGyroJerk-mean()-Z
30. tBodyGyroJerk-std()-X
31. tBodyGyroJerk-std()-Y
32. tBodyGyroJerk-std()-Z
33. tBodyAccMag-mean()
34. tBodyAccMag-std()
35. tGravityAccMag-mean()
36. tGravityAccMag-std()
37. tBodyAccJerkMag-mean()
38. tBodyAccJerkMag-std()
39. tBodyGyroMag-mean()
40. tBodyGyroMag-std()
41. tBodyGyroJerkMag-mean()
42. tBodyGyroJerkMag-std()
43. fBodyAcc-mean()-X
44. fBodyAcc-mean()-Y
45. fBodyAcc-mean()-Z
46. fBodyAcc-std()-X
47. fBodyAcc-std()-Y
48. fBodyAcc-std()-Z
49. fBodyAccJerk-mean()-X
50. fBodyAccJerk-mean()-Y
51. fBodyAccJerk-mean()-Z
52. fBodyAccJerk-std()-X
53. fBodyAccJerk-std()-Y
54. fBodyAccJerk-std()-Z
55. fBodyGyro-mean()-X
56. fBodyGyro-mean()-Y
57. fBodyGyro-mean()-Z
58. fBodyGyro-std()-X
59. fBodyGyro-std()-Y
60. fBodyGyro-std()-Z
61. fBodyAccMag-mean()
62. fBodyAccMag-std()
63. fBodyBodyAccJerkMag-mean()
64. fBodyBodyAccJerkMag-std()
65. fBodyBodyGyroMag-mean()
66. fBodyBodyGyroMag-std()
67. fBodyBodyGyroJerkMag-mean()
68. fBodyBodyGyroJerkMag-std() 


### References
[1]: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
