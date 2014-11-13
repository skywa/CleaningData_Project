Coursera (Johns Hopkins) Getting and Cleaning Data Course Project
====================

The intent of this project is to read and clean a dataset from the Human Activity Recognition Using Smartphones Dataset as described below.

The data and label files were read in and combined into a data frame. This was subset to contain the average value for each variable for each activity and subject. The choice was made to make it a "long" dataset (where there are columns for subject, activity, variable, and value) instead of "wide" (where each variable would be it's own column and the rows would contain each subject for all activities) so that ordering and subsetting could be done with activity factors.

***To read the final tidy dataset, use read.table("Means_by_Activity_Subject.txt") and assign it to a desired variable.***
***To obtain all data and values, use source("run_analysis.R") with all files in the same directory.***

##The following files were used in this project:

- **README.md**: this file containing an explanation of the project
- **CodeBook.md**: description of the process and variables

##CODE:
- **run_analysis.R**: Code used to read in data, clean it, and convert it to a tidy data set

##INPUTS:
- **X_test.txt**: variable data (e.g. acceleration for x, y, z directions)
- **X_train.txt**: variable data (e.g. acceleration for x, y, z directions)
- **y_test.txt**: activity labels for variable data
- **y_test.txt**: activity labels for variable data
- **subject_test.txt**: subject (participant) label for variable data
- **subject_train.txt**: subject (participant) labels for variable data
- **activity_labels.txt**: activity labels (e.g. Walking, Sitting)
- **features.txt**: variable labels

##OUTPUT:
- **Means_by_Activity_Subject.txt**: A tidy dataset containing the average value for each variable for each activity and subject. 


*From README.txt contained with the data*

> Human Activity Recognition Using Smartphones Dataset
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

> For each record it is provided:
======================================
> 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

> The dataset includes the following files:
=========================================
>
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

> The following files are available for the train and test data. Their descriptions are equivalent. 
> 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

> Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

> For more information about this dataset contact: activityrecognition@smartlab.ws

> License:
========
> Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

> [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

> This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

> Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
