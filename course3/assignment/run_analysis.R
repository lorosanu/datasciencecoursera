#!/usr/bin/Rscript

library(reshape2)

# download the data's archive and extract only the necessary files
archiveurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
archivefile <- "UCI_HAR_dataset.zip"
datadir <- "UCI_HAR_dataset"
nfiles <- c(
    "UCI HAR Dataset/features.txt",
    "UCI HAR Dataset/activity_labels.txt",
    "UCI HAR Dataset/train/subject_train.txt",
    "UCI HAR Dataset/train/y_train.txt",
    "UCI HAR Dataset/train/X_train.txt",
    "UCI HAR Dataset/test/subject_test.txt",
    "UCI HAR Dataset/test/y_test.txt",
    "UCI HAR Dataset/test/X_test.txt")

download.file(archiveurl, dest=archivefile)
unzip(archivefile, exdir=datadir, files=nfiles, junkpaths=TRUE)

#======================================
# load the entire dataset
#======================================

# load subject ids
loadSubjects <- function(dir, subset){
    fn <- file.path(dir, paste("subject_", subset, ".txt", sep=""))
    subjects <- read.table(fn, col.names=c("subjectID"))
    subjects$subjectID <- as.numeric(subjects$subjectID)

    subjects
}

# load activity ids and activity names
loadActivities <- function(dir, subset){
    fn1 <- file.path(dir, "activity_labels.txt")
    fn2 <- file.path(dir, paste("y_", subset, ".txt", sep=""))
    labels <- read.table(fn1, col.names=c("activityID", "activityName"))
    activities <- read.table(fn2, col.names=c("activity"))
    activities$activity <- factor(
        activities$activity, 
        levels=labels[,1], 
        labels=labels[,2])

    activities
}

# load measurements on on mean and standard deviation
loadMeasurements <- function(dir, subset){
    # load variable names
    fn <- file.path(dir, "features.txt")
    variables <- read.table(fn, col.names=c("varID", "varName"))
    featids <- grep("(-mean)|(-std)", variables$varName)

    # load mean and standard deviation measurements
    fn <- file.path(dir, paste("X_", subset, ".txt", sep=""))
    data <- read.table(fn)
    names(data) <- variables$varName
    data <- data[, featids]

    # rename variables
    subexp <- data.frame(
        pattern=c(
            "^t", "^f", "Acc", "Gyro", "Mag",
            "-mean\\(\\)-", "-mean\\(\\)", "-std\\(\\)-", "-std\\(\\)",
            "-meanFreq\\(\\)-", "-meanFreq\\(\\)", "BodyBody"),
        replacement=c(
            "timeDomain", "frequencyDomain", "Accelerometer", "Gyroscope",
            "Magnitude", "Mean", "Mean", "StandardDeviation",
            "StandardDeviation", "MeanFrequency", "MeanFrequency", "Body"))

    fnames <- names(data)
    for (i in 1:nrow(subexp)){
        fnames <- sub(subexp[i, 1], subexp[i, 2], fnames)
    }
    names(data) <- fnames

    data
}

getData <- function(dir, subset){
    subjects <- loadSubjects(dir, subset)
    activities <- loadActivities(dir, subset)
    data <- loadMeasurements(dir, subset)

    # combine the retrieved information: subject, activity, measurements
    if (nrow(data) == nrow(subjects) && nrow(subjects) == nrow(activities)){
        data <- cbind(
            subject=subjects$subjectID,
            activity=activities$activity,
            data)
    }

    data
}

# load the train and test data sets
traindata <- getData(datadir, "train")
testdata <- getData(datadir, "test")

# merge the train and test data sets to create a single dataset
data <- rbind(traindata, testdata)
data <- data[order(data$subject),]
data$subject <- as.factor(data$subject)

#======================================
# prepare the tidy data set
#======================================

tidydata <- melt(data, id=c("subject", "activity"))
tidydata <- dcast(tidydata, subject+activity ~ variable, mean)

write.table(tidydata, "tidy_data.txt", row.name=FALSE, quote=FALSE)
write.csv(tidydata, "tidy_data.csv", row.names=FALSE)
