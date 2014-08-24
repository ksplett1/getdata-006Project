 
    ## ##################################################################

    ## Description:

    ## Return a csv file with a tidy data set that contains the mean of mean and standard deviation
	## measures from a wearable computing data set
	
	## algorithm: mean function of R aggregate package

    ## Input Files:
	## activity_labels.txt: Activity names
	## features.txt: Variable names
	## 
    ## 'train/subject_train.txt': Each row identifies the subject who performed the activity for each 
	##                            window sample. Its range is from 1 to 30. 
    ## 'train/y_train.txt': Training labels.
    ## 'train/X_train.txt': Training set.
    ##
    ## 'test/subject_test.txt': Each row identifies the subject who performed the activity for each 
	##                            window sample. Its range is from 1 to 30. 
    ## 'test/y_test.txt': Training labels.
    ## 'test/X_test.txt': Training set.

    ## Output Files:
	## TidyDataset.csv
	
	## Original data sources:
	## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	
	## Measurements from the wearable devices come from accelerometer and gyroscope 
	## 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
	
	## Data used for this project:
    ## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

	## Project Description:
	## 	You should create one R script called run_analysis.R that does the following.
	## 1. Merges the training and the test sets to create one data set.
	## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
	## 3. Uses descriptive activity names to name the activities in the data set
	## 4. Appropriately labels the data set with descriptive variable names.
	## 5. Creates a second, independent tidy data set with the average of each variable for each 
	## activity and each subject.


    ## Notes:    

    ## assumes setwd() has been done before program runs
    ## assumes working directory set to the root directory:
	##        getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset
    ##
	## 20140823  Initial Version
	##

    ## ##################################################################

# note: assume setwd is done before sourcing this R program. For example:
# setwd("C:/myClasses/cloudera/GettingAndCleaningData/Project/data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

# read test files

testsubjects <- read.fwf("./test/subject_test.txt", widths=c(2))
testlabels  <- read.fwf("./test/y_test.txt", widths=c(1))
testset <- read.table("./test/X_test.txt", header = FALSE)

# read column names and modify to more user-friendly names
#     replace space or dash with underscore (colnumber_colname)
#     remove parentheses
#     replace individual "(" and ")" with "_"
#     replace all: find "__" replace with "_"
#     remove underscore at end

colnames <- readLines("./features.txt")
colheaders = sapply(colnames,  function(x){ gsub(" |-|,","_", x) })
colheaders <- gsub("\\(\\)","", colheaders )
colheaders <- gsub("\\(|\\)","_", colheaders )
colheaders <- gsub("__","_", colheaders )
colheaders <- gsub("_$","", colheaders )

# rename columns in each test df
colnames(testsubjects)[1] <- "subjectid"
colnames(testlabels)[1] <- "activity"
colnames(testset) <-  colheaders 

# combine subjectid, activity, and test data frames
test_df <- cbind(testsubjects, testlabels)
test_df <- cbind(test_df, testset)


# read training files
# note: read.table automatically converts the data to numbers
trainsubjects <- read.fwf("./train/subject_train.txt", widths=c(2))
trainlabels  <- read.fwf("./train/y_train.txt", widths=c(1))
trainset <- read.table("./train/X_train.txt", header = FALSE)

# rename columns in each training df
colnames(trainsubjects)[1] <- "subjectid"
colnames(trainlabels)[1] <- "activity"
# colnames(trainset) <- datacolnames
colnames(trainset) <-  colheaders 

# combine subjectid, activity, and training data frames
train_df <- cbind(trainsubjects, trainlabels)
train_df <- cbind(train_df, trainset)

# combine test and train data frames
completeset_df <- rbind(train_df, test_df)

# select only mean and std columns for analysis
completeset_df <- completeset_df [,grepl("subjectid|activity|_mean|_std", tolower(names(completeset_df)))]

# replace activity numbers with descriptive activity names
completeset_df$activity <- as.character(sapply(completeset_df$activity, 
       function(x){ switch(x,
                        "WALKING",
                        "WALKING_UPSTAIRS",
                        "WALKING_DOWNSTAIRS",
                        "SITTING",
                        "STANDING",
                        "LAYING")
                  }))

# compute mean
mean_df <- aggregate(completeset_df[3:length(names(completeset_df))], 
           by=list(completeset_df$subjectid, completeset_df$activity), FUN=mean, na.rm=TRUE)
colnames(mean_df)[1] <- "subjectid"
colnames(mean_df)[2] <- "activity"

# write mean df (ie, tidy data set) to text file
# write.csv(mean_df, "TidyDataset.csv")
write.table(mean_df,"TidyDataset.txt", row.name=FALSE )