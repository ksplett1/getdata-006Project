getdata-006Project
==================

Coursera project for Getting and Cleaning Data (class getdata-006)

Project: Create a Tidy data set based on a wearable computing data set 
         (original README.txt file included in github repository for more information)

Project Description:
 You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each 
   activity and each subject.

To run:
======================================
1. Download project data set from:
       https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Download run_analysis.R file from:
       https://github.com/ksplett1/getdata-006Project

3. Run R. Set working directory to your directory that corresponds to this subdirectory in the zip file:
       getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset

4. Source run_analysis.R file 

5. Output text file will be created in the working directory.


Program output:
======================================
run_analysis.R creates a file called "TidyDataset.txt" in the R working directory.

The tidy data set is a text file with a header record of descriptive variable names followed by observation records (one 
record per subject ID activity).


Output record for each observation:
======================================
1st field: Observation number (sequential record number)
2nd field: The subject ID is the identifier of the subject who carried out the experiment.
3rd field: The activity is represented by an activity label.
followed by measurement fields:
Mean of the mean and standard deviation measures for each activity of each subject ID :
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- Time and frequency domain variables. 
 
Please refer to the code book for detailed descriptions.


The dataset includes information or data from the following files 
(info below taken from the original README.txt file for the Human Activity Recognition Using Smartphones Dataset project) :
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is 
from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in 
standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 
'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the 
total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window 
sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on 
Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living 
(IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their 
institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
