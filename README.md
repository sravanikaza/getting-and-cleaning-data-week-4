# getting-and-cleaning-data-week-4
One of the most widely used applications of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms and applications to attract new users.

In this project, the data is collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone is  retrieved, worked with, and cleaned, to prepare a tidy data  and this can be used for later analysis.

This repository contains the following files:

README.md, this file, which provides an overview of the data set and how it was created. tidy_data.txt, which contains the data set. CodeBook.md, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data). run_analysis.R, the R script that was used to create the data set (see the Creating the data set section below) Study design

The source data set that this project was based on was obtained from the Human Activity Recognition Using Smartphones Data Set, which describes how the data was initially collected as follows:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.


Creating the data set

The R script run_analysis.R can be used to create the data set. It retrieves the source data set and transforms it to produce the final data set by implementing the following steps (see the Code book for details, as well as the comments in the script itself):

Download and unzip source data. Read data. Merge the training and the test sets to create one data set. Extract only the measurements on the mean and standard deviation for each measurement. Use descriptive activity names to name the activities in the data set. a second, independent tidy set with the average of each variable for each activity and each subject. Write the data set to the tidy_data.txt file. The tidy_data.txt in this repository was created by running the run_analysis.R script using R version 3.2.2 (2015-08-14) on Windows 10 64-bit edition.

This script requires the dplyr package (version 0.4.3 was used).
