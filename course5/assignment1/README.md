## Introduction

It is now possible to collect a large amount of data about personal
movement using activity monitoring devices such as a 
[Fitbit](http://www.fitbit.com),
[Nike Fuelband](http://www.nike.com/us/en_us/c/nikeplus-fuelband), or
[Jawbone Up](https://jawbone.com/up).
These type of devices are part of the "quantified self" movement -- 
a group of enthusiasts who take measurements about themselves regularly 
to improve their health, to find patterns in their behavior, 
or because they are tech geeks. 
But these data remain under-utilized both because the raw data are hard to
obtain and there is a lack of statistical methods and software for
processing and interpreting the data.

This assignment makes use of data from a personal activity monitoring device.
This device collects data at 5 minute intervals through out the day.
The data consists of two months of data from an anonymous individual
collected during the months of October and November, 2012
and include the number of steps taken in 5 minute intervals each day.

## Data

The data for this assignment can be downloaded from the 
[course web site](https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip).

The variables included in this dataset are:
* **steps**: number of steps taking in a 5-minute interval
* **date**: date on which the measurement was taken in YYYY-MM-DD format
* **interval**: identifier for the 5-minute interval in which the measurement was taken

The dataset is stored in a CSV file 
and there are a total of 17,568 observations in this dataset.

## Assignment

Write a report that completes the following tasks:
* load and preprocess the data
    * read the data
    * process/transform the data into a format suitable for analysis
* find out what is the mean total number of steps taken per day
    * ignore the missing values in the dataset
    * make a histogram of the total number of steps taken each day
    * calculate and report the **mean** and **median** total number of steps taken per day
* find out what is the average daily activity pattern
    * make a time series plot of the 5-minute interval (x-axis)
      and the average number of steps taken, averaged across all days (y-axis)
    * which 5-minute interval, on average across all the days in the dataset,
      contains the maximum number of steps?
* impute missing values
    * calculate and report the total number of missing values in the dataset
    * devise a strategy for filling in all of the missing values in the dataset.
      The strategy does not need to be sophisticated.
      For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc.
    * create a new dataset that is equal to the original dataset but with the missing data filled in.
    * make a histogram of the total number of steps taken each day
      and calculate and report the **mean** and **median** total number of steps taken per day.
      Do these values differ from the estimates from the first part of the assignment?
      What is the impact of imputing missing data on the estimates of the total daily number of steps?
* find out if there there are differences in activity patterns between weekdays and weekends?
    * the `weekdays()` function may be of some help here.
      Use the dataset with the filled-in missing values for this part.
    * create a new factor variable in the dataset with two levels -- 
      "weekday" and "weekend" indicating whether a given date is a weekday or weekend day.
    * make a panel plot containing a time series plot of 
      the 5-minute interval (x-axis) 
      and the average number of steps taken, 
      averaged across all weekday days or weekend days (y-axis).

Complete the entire assignment in a **single R markdown** document 
that can be processed by **knitr** and be transformed into an HTML file.

Make sure to include the code that was used to generate the presented output.
When writing code chunks in the R markdown document, always use `echo = TRUE`
so that someone else will be able to read the code.

## Proposed solution

The generated Markdown report for this assignment can be found [here](PA1_template.md)
