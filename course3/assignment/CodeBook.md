# Code book for Getting and cleaning data - Coursera Course Project

This code book describes the content of the [tidy_data.csv](tidy_data.csv) file and how it was obtained.

This code book is organized in 3 sections
* Data format: describes the format in which the data is presented,
* Data variables: describes the variables characterising each observation in the data set,
* Data transformations: describes the transformations that allowed cleaning the data.

## Data format

The data is presented in a csv file with comma-separated values.
The data's header, containing the variable names, is given in the file's first row.
All following rows contain the actual data.

## Data variables

Each row contains a subject identifier, an activity name and the 79 signal measurements (on mean and standard deviation measurements) for that subject and that activity.

Factor variables
* `subject`: the id of the subject; integer, varies from 1 to 30
* `activity`: the name of the activity; string denoting any of the 6 possible activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING)

Numeric variables
* measurements on the time domain signals (\#40 variables)
    * the average and standard deviation values for the **body acceleration** in the X, Y, Z directions
        * `timeDomainBodyAccelerometerMeanX` (from `tBodyAcc-mean()-X`)
        * `timeDomainBodyAccelerometerMeanY` (from `tBodyAcc-mean()-Y`)
        * `timeDomainBodyAccelerometerMeanZ` (from `tBodyAcc-mean()-Z`)
        * `timeDomainBodyAccelerometerStandardDeviationX` (from `tBodyAcc-std()-X`)
        * `timeDomainBodyAccelerometerStandardDeviationY` (from `tBodyAcc-std()-Y`)
        * `timeDomainBodyAccelerometerStandardDeviationZ` (from `tBodyAcc-std()-Z`)
    * the average and standard deviation values for the **gravity acceleration** in the X, Y, Z directions
        * `timeDomainGravityAccelerometerMeanX` (from `tGravityAcc-mean()-X`)
        * `timeDomainGravityAccelerometerMeanY` (from `tGravityAcc-mean()-Y`)
        * `timeDomainGravityAccelerometerMeanZ` (from `tGravityAcc-mean()-Z`)
        * `timeDomainGravityAccelerometerStandardDeviationX` (from `tGravityAcc-std()-X`)
        * `timeDomainGravityAccelerometerStandardDeviationY` (from `tGravityAcc-std()-Y`)
        * `timeDomainGravityAccelerometerStandardDeviationZ` (from `tGravityAcc-std()-Z`)
    * the average and standard deviation values for the **body acceleration jerk** in the X, Y, Z directions
        * `timeDomainBodyAccelerometerJerkMeanX` (from `tBodyAccJerk-mean()-X`)
        * `timeDomainBodyAccelerometerJerkMeanY` (from `tBodyAccJerk-mean()-Y`)
        * `timeDomainBodyAccelerometerJerkMeanZ` (from `tBodyAccJerk-mean()-Z`)
        * `timeDomainBodyAccelerometerJerkStandardDeviationX` (from `tBodyAccJerk-std()-X`)
        * `timeDomainBodyAccelerometerJerkStandardDeviationY` (from `tBodyAccJerk-std()-Y`)
        * `timeDomainBodyAccelerometerJerkStandardDeviationZ` (from `tBodyAccJerk-std()-Z`)
    * the average and standard deviation values for the **body angular velocity** in the X, Y, Z directions
        * `timeDomainBodyGyroscopeMeanX` (from `tBodyGyro-mean()-X`)
        * `timeDomainBodyGyroscopeMeanY` (from `tBodyGyro-mean()-Y`)
        * `timeDomainBodyGyroscopeMeanZ` (from `tBodyGyro-mean()-Z`)
        * `timeDomainBodyGyroscopeStandardDeviationX` (from `tBodyGyro-std()-X`)
        * `timeDomainBodyGyroscopeStandardDeviationY` (from `tBodyGyro-std()-Y`)
        * `timeDomainBodyGyroscopeStandardDeviationZ` (from `tBodyGyro-std()-Z`)
    * the average and standard deviation values for the **body angular velocity jerk** in the X, Y, Z directions
        * `timeDomainBodyGyroscopeJerkMeanX` (from `tBodyGyroJerk-mean()-X`)
        * `timeDomainBodyGyroscopeJerkMeanY` (from `tBodyGyroJerk-mean()-Y`)
        * `timeDomainBodyGyroscopeJerkMeanZ` (from `tBodyGyroJerk-mean()-Z`)
        * `timeDomainBodyGyroscopeJerkStandardDeviationX` (from `tBodyGyroJerk-std()-X`)
        * `timeDomainBodyGyroscopeJerkStandardDeviationY` (from `tBodyGyroJerk-std()-Y`)
        * `timeDomainBodyGyroscopeJerkStandardDeviationZ` (from `tBodyGyroJerk-std()-Z`)
    * the average and standard deviation values for the **magnitude of body acceleration**
        * `timeDomainBodyAccelerometerMagnitudeMean` (from `tBodyAccMag-mean()`)
        * `timeDomainBodyAccelerometerMagnitudeStandardDeviation` (from `tBodyAccMag-std()`)
    * the average and standard deviation values for the **magnitude of gravity acceleration**
        * `timeDomainGravityAccelerometerMagnitudeMean` (from `tGravityAccMag-mean()`)
        * `timeDomainGravityAccelerometerMagnitudeStandardDeviation` (from `tGravityAccMag-std()`)
    * the average and standard deviation values for the **magnitude of body acceleration jerk**
        * `timeDomainBodyAccelerometerJerkMagnitudeMean` (from `tBodyAccJerkMag-mean()`)
        * `timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation` (from `tBodyAccJerkMag-std()`)
    * the average and standard deviation values for the **magnitude of body angular velocity**
        * `timeDomainBodyGyroscopeMagnitudeMean` (from `tBodyGyroMag-mean()`)
        * `timeDomainBodyGyroscopeMagnitudeStandardDeviation` (from `tBodyGyroMag-std()`)
    * the average and standard deviation values for the **magnitude of body angular velocity jerk**
        * `timeDomainBodyGyroscopeJerkMagnitudeMean` (from `tBodyGyroJerkMag-mean()`)
        * `timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation` (from `tBodyGyroJerkMag-std()`)
* measurements on the frequency domain signals (\#39 variables)
    * the average, standard deviation and weighted average of the frequency components values for the **body acceleration** in the X, Y, Z directions
        * `frequencyDomainBodyAccelerometerMeanX` (from `fBodyAcc-mean()-X`)
        * `frequencyDomainBodyAccelerometerMeanY` (from `fBodyAcc-mean()-Y`)
        * `frequencyDomainBodyAccelerometerMeanZ` (from `fBodyAcc-mean()-Z`)
        * `frequencyDomainBodyAccelerometerStandardDeviationX` (from `fBodyAcc-std()-X`)
        * `frequencyDomainBodyAccelerometerStandardDeviationY` (from `fBodyAcc-std()-Y`)
        * `frequencyDomainBodyAccelerometerStandardDeviationZ` (from `fBodyAcc-std()-Z`)
        * `frequencyDomainBodyAccelerometerMeanFrequencyX` (from `fBodyAcc-meanFreq()-X`)
        * `frequencyDomainBodyAccelerometerMeanFrequencyY` (from `fBodyAcc-meanFreq()-Y`)
        * `frequencyDomainBodyAccelerometerMeanFrequencyZ` (from `fBodyAcc-meanFreq()-Z`)
    * the average, standard deviation and weighted average of the frequency components values for the **body acceleration jerk** in the X, Y, Z directions
        * `frequencyDomainBodyAccelerometerJerkMeanX` (from `fBodyAccJerk-mean()-X`)
        * `frequencyDomainBodyAccelerometerJerkMeanY` (from `fBodyAccJerk-mean()-Y`)
        * `frequencyDomainBodyAccelerometerJerkMeanZ` (from `fBodyAccJerk-mean()-Z`)
        * `frequencyDomainBodyAccelerometerJerkStandardDeviationX` (from `fBodyAccJerk-std()-X`)
        * `frequencyDomainBodyAccelerometerJerkStandardDeviationY` (from `fBodyAccJerk-std()-Y`)
        * `frequencyDomainBodyAccelerometerJerkStandardDeviationZ` (from `fBodyAccJerk-std()-Z`)
        * `frequencyDomainBodyAccelerometerJerkMeanFrequencyX` (from `fBodyAccJerk-meanFreq()-X`)
        * `frequencyDomainBodyAccelerometerJerkMeanFrequencyY` (from `fBodyAccJerk-meanFreq()-Y`)
        * `frequencyDomainBodyAccelerometerJerkMeanFrequencyZ` (from `fBodyAccJerk-meanFreq()-Z`)
    * the average, standard deviation and weighted average of the frequency components values for the **body angular velocity** in the X, Y, Z directions
        * `frequencyDomainBodyGyroscopeMeanX` (from `fBodyGyro-mean()-X`)
        * `frequencyDomainBodyGyroscopeMeanY` (from `fBodyGyro-mean()-Y`)
        * `frequencyDomainBodyGyroscopeMeanZ` (from `fBodyGyro-mean()-Z`)
        * `frequencyDomainBodyGyroscopeStandardDeviationX` (from `fBodyGyro-std()-X`)
        * `frequencyDomainBodyGyroscopeStandardDeviationY` (from `fBodyGyro-std()-Y`)
        * `frequencyDomainBodyGyroscopeStandardDeviationZ` (from `fBodyGyro-std()-Z`)
        * `frequencyDomainBodyGyroscopeMeanFrequencyX` (from `fBodyGyro-meanFreq()-X`)
        * `frequencyDomainBodyGyroscopeMeanFrequencyY` (from `fBodyGyro-meanFreq()-Y`)
        * `frequencyDomainBodyGyroscopeMeanFrequencyZ` (from `fBodyGyro-meanFreq()-Z`)
    * the average, standard deviation and weighted average of the frequency components values for the **magnitude of body acceleration**
        * `frequencyDomainBodyAccelerometerMagnitudeMean` (from `fBodyAccMag-mean()`)
        * `frequencyDomainBodyAccelerometerMagnitudeStandardDeviation` (from `fBodyAccMag-std()`)
        * `frequencyDomainBodyAccelerometerMagnitudeMeanFrequency` (from `fBodyAccMag-meanFreq()`)
    * the average, standard deviation and weighted average of the frequency components values for the **magnitude of body acceleration jerk**
        * `frequencyDomainBodyAccelerometerJerkMagnitudeMean` (from `fBodyBodyAccJerkMag-mean()`)
        * `frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation` (from `fBodyBodyAccJerkMag-std()`)
        * `frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency` (from `fBodyBodyAccJerkMag-meanFreq()`)
    * the average, standard deviation and weighted average of the frequency components values for the **magnitude of body angular velocity**
        * `frequencyDomainBodyGyroscopeMagnitudeMean` (from `fBodyBodyGyroMag-mean()`)
        * `frequencyDomainBodyGyroscopeMagnitudeStandardDeviation` (from `fBodyBodyGyroMag-std()`)
        * `frequencyDomainBodyGyroscopeMagnitudeMeanFrequency` (from `fBodyBodyGyroMag-meanFreq()`)
    * the average, standard deviation and weighted average of the frequency components values for the **magnitude of body angular velocity jerk**
        * `frequencyDomainBodyGyroscopeJerkMagnitudeMean` (from `fBodyBodyGyroJerkMag-mean()`)
        * `frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation` (from `fBodyBodyGyroJerkMag-std()`)
        * `frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency` (from `fBodyBodyGyroJerkMag-meanFreq()`)

## Data transformations
* the information was scattered accross multiple files and had to be combined
* the subject ids were recovered from the `subject_train.txt` and `subject_test.txt` files
* the activity ids were recovered from the `y_train.txt` and `y_test.txt` files
* the activity names corresponding to each activity id were recovered from the `activity_labels.txt`
* the 561 measurement values were recovered from the `X_train.txt` and `X_test.txt` files
* the labels for all the 561 measurements were recovered from the `features.txt`
* only the measurements on the mean and standard deviation were kept (labels including "-mean" or "-std" characters; 79 features)
* the resulting tidy data set contains the average of the values of each variable for each subject and each activity
