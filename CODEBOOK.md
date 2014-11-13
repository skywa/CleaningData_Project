Codebook for Coursera (Johns Hopkins) Getting and Cleaning Data Course Project
=====================
For a more thorough description of the project, please see **Feature Selection** below, which contains the original feature information for the project.

#Description of project
Data from a study using the accelerometer and gyroscope of a smart phone to determine human activity was obtained and cleaned to produce a tidy dataset for further analysis. For details of the study itself, see below.

The data and label files were read in and combined into a data frame. This was subset to contain the average value for each variable for each activity and subject. The choice was made to make it a "long" dataset (where there are columns for subject, activity, variable, and value) instead of "wide" (where each variable would be it's own column and the rows would contain each subject for all activities) so that ordering and subsetting could be done with activity factors.

Sampling information:
====================
The study was conducted with 30 subject participants wearing a smartphone. 21 of them were used to record training data and 9 of them were used to record the test data. Six activities were recorded (walking, walking up stairs, walking down stairs, sitting, standing, and laying). The subject, activity, and a 561-feature vector with time and frequency variables were recorded along with the triaxial acceleration and triaxial angular velocity.

Technical information about the files:
===================
The files used are listed (also described in README.md)
- **X_test.txt**: 2947 observations of 561 variables
- **X_train.txt**: 7352 observations of 561 variables
- **y_test.txt**: 2947 observations of 1 variable (activity identifier 1-6)
- **y_test.txt**: 7352 observations of 1 variable (activity identifier 1-6)
- **subject_test.txt**: 2947 observations of 1 variable (subject identifier 1-30)
- **subject_train.txt**: 7352 observations of 1 variable (subject identifier 1-30)
- **activity_labels.txt**: 6 observations of 2 variables (activity identifer 1-6, activity label)
- **features.txt**: 561 observations of 2 variables (2nd column is variable label)

##Variables
The full list of variables (561) is given in the **Feature Selection** below and in the features.txt file. 
The variables in the subset include only those that ended in mean() or std(). They have been renamed to be more descriptive and are listed below. XYZ denotes that there is variable for X, Y, and Z separately. There are 'Time' and 'Freq' domain variables. There are 'Mean' and 'Std' (for standard deviation) variables. There are variables for the 'Body' and 'Gravity'. The variables come from the accelerometer ('Acceleration') or the gyroscope ('Gyro').

- Time_Mean_Body_Acceleration_XYZ
- Time_Std_Body_Acceleration_XYZ
- Time_Mean_Gravity_Acceleration_XYZ
- Time_Std_Gravity_Acceleration_XYZ
- Time_Mean_Body_Acceleration_Jerk_XYZ
- Time_Std_Body_Acceleration_Jerk_XYZ
- Time_Mean_Body_Gyro_XYZ
- Time_Std_Body_Gyro_XYZ
- Time_Mean_Body_Gyro_Jerk_XYZ
- Time_Std_Body_Gyro_Jerk_XYZ
- Time_Mean_Body_Acceleration_Magnitude
- Time_Std_Body_Acceleration_Magnitude
- Time_Mean_Gravity_Acceleration_Magnitude
- Time_Std_Gravity_Acceleration_Magnitude
- Time_Mean_Body_Acceleration_Jerk_Magnitude
- Time_Std_Body_Acceleration_Jerk_Magnitude
- Time_Mean_Body_Gyro_Magnitude
- Time_Std_Body_Gyro_Magnitude
- Time_Mean_Body_Gyro_Jerk_Magnitude
- Time_Std_Body_Gyro_Jerk_Magnitude
- Freq_Mean_Body_Acceleration_XYZ
- Freq_Std_Body_Acceleration_XYZ
- Freq_Mean_Body_Acceleration_Jerk_XYZ
- Freq_Std_Body_Acceleration_Jerk_XYZ
- Freq_Mean_Body_Gyro_XYZ
- Freq_Std_Body_Gyro_XYZ
- Freq_Mean_Body_Acceleration_Magnitude
- Freq_Std_Body_Acceleration_Magnitude
- Freq_Mean_Body_Acceleration_Jerk_Magnitude
- Freq_Std_Body_Acceleration_Jerk_Magnitude
- Freq_Mean_Body_Gyro_Magnitude
- Freq_Std_Body_Gyro_Magnitude
- Freq_Mean_Body_Gyro_Jerk_Magnitude
- Freq_Std_Body_Gyro_Jerk_Magnitude

Process description of code:
=========================
The code for this project is contained in **run_analysis.R**. This provides a description of the code, which is also annotated within the file.

- The test and train data is read using read.table
- The subject identifiers for the test and train data is read using read.table
- The activity identifiers for the test and train data and activity labels are read using read.table
- The variable names are read using read.table
- An identifiers data frame is created using data.frame that contains "Subject" and "Activity" columns of concatenated test and train data (using rbind)
- The "Subject" column is converted to factor variables
- The "Activiy" column is converted to factor variables and the identifer (1-6) is changed to the activity name (Walking, WalkingUp, WalkingDown, Sitting, Standing, Sitting). These are descriptive variables.
- The test and train data is concatenated using rbind and the column names are set to be the variable names
- A data frame is created using data.frame to combine the 'identifers' and 'data' data frames
  - 10299 observations of 563 variables (subject and activity identifiers + 561 variables)
- Index values for variable names that contained ".mean." or ".std." were created. A separate index was created to find the index values containinng ".meanFreq." which wasn't desired (only values with mean() or std() at the end were chosen in this case)
- The data frame was subset to include only variables with mean() or std() in the name
  - 10299 observations of 68 variables (subject and activity identifiers + 66 variables containing mean() or std() in name)
- The data frame was reshaped using melt along the "Subject" and "Activity" columns. "Variable" and "Value" were the other two column names.
  - tidy <- melt(df.subset, id=c("Subject", "Activity"))
- Averages for each of the variables for each subject and activity were obtained.
  - averages <- tapply(tidy$Value, list(tidy$Activity, tidy$Subject, tidy$Variable), mean)
  - averages is a [1:6, 1:30, 1:66] 3-dimensional array
- The array was reshaped into a data frame 
  - tidymeans <- data.frame(melt(averages, id = c("Activity","Subject","Variable")))
  - 11880 observations of 4 variables ("Activity", "Subject", "Variable", "MeanValue")
- The data frame is written to a text file
  - write.table(tidymeans, file = "Means_by_Activity_Subject.txt", row.names=FALSE)

***To read the final tidy dataset, use read.table("Means_by_Activity_Subject.txt") and assign it to a desired variable.***
***To obtain all data and values, use source("run_analysis.R") with all files in the same directory.***


*From feature_info.txt contained with the project files*
> Feature Selection 
=================

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> - tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

> The set of variables that were estimated from these signals are: 

> - mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

> - gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

> The complete list of variables of each feature vector is available in 'features.txt'
