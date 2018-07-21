# Getting and cleaning data - Coursera Course Project

This project is based on the data collected from the accelerometers from the Samsung Galaxy S smartphone.

A short description of the data
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A full description of the data is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Contents

This repository contains the following files
* [README.md](README.md): provides an overview of the dataset and how is was created
* [CodeBook.md](CodeBook.md): descibes the contents of the dataset and the transformations used to obtain it
* [run_analysis.R](run_analysis.R): the R script used to clean the data
* [tidy_data.csv](tidy_data.csv): the resulting clean data set

## Cleaning the data

The processes involved in retrieving and cleaning the data
* retrieve the dataset from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* unzip the archive
* get the labels for activities and measurements
    * the activity labels are stored in the `activity_labels.txt` file
    * the measurements labels are stored in the `features.txt` file
* process the train set and test set separately
    * mix information from 3 files:
        * for the train set: `subject_train.txt` (subject id), `y_train.txt` (activity id), `X_train.txt` (measurement values)
        * for the test set: `subject_test.txt` (subject id), `y_test.txt` (activity id), `X_test.txt` (measurement values)
    * rename the activity ids with the corresponding activity labels
    * rename the labels of the data set with descriptive measurements labels
    * keep only the measurements on the mean and standard deviation (79 out of 561 features)
* merge the training and test sets to create one data set
* create a new data set (the *tidy data set*) with the average of each variable for each activity and each subject

The end result is shown in the [tidy_data.csv](tidy_data.csv) file.
