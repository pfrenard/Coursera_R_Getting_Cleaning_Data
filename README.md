<!--- README - "Getting & Cleaning Data / Week 4 / Assignment" -->

# Data Load

Data have been loaded from following files
- "UCI HAR Dataset/test/X_test.txt", Data for test
- "UCI HAR Dataset/test/y_test.txt", target for test - what we try to predict
- "UCI HAR Dataset/test/subject_test.txt", subjects for test
- "UCI HAR Dataset/train/X_train.txt", Data for training ML algorithms
- "UCI HAR Dataset/train/y_train.txt", target for training ML algorithms
- "UCI HAR Dataset/train/subject_train.txt", subjects for training

Features Names have been loaded from the file, "UCI HAR Dataset/features.txt"
Activities Names are loaded from  the file "UCI HAR Dataset/activity_labels.txt"

# Data Merge
All these data can be merged using the following process :

- read data from subject, which will create one column and n rows, the column name is **"Subject_ID"**.
- read data from target, which will create one column and n rows, the column name is **"Activity_ID"**.
- read data from data, which will create 561 columns and n rows, the columns name are from the **features.txt** file.
- bind these columns using the cbind function which will create a table of n rows and 563 columns
- read activities names from **activities_label.txt**, which will create 2 columns **"Activity_ID"** and **"Activity_Name"** and 6 rows
- merge **"Activity_Name"** with all data using **"Activity_ID"**


# Tidy Data
## 1 : Tidy Data from test and train dataset
*tidy_data* tbl_df is produced at the end of this process (read and merge data) with

 - 1 variable per column
 - 1 observation per row
 - there is only one table for this experiment

A file *tidy_data.csv.zip* is also produced at the end of the script.

## 2 : Tidy Data with only mean() and std()
As requested, a reduced data set with only *mean()* and *std()* values for all the mesures is produced.
*meanFreq()* has not been taken into account and all these measures are out of scope.
A regexp is used to select the good columns.

*reduced_tidy_data* tbl_df is generated and also saved into file *reduced_tidy_data.csv.zip*.

## 3 : Activities names
As requested, a column is available with Activities Names, called *Activity_Name*. *Activitiy_ID* column has been kept into the table.
*Activity_Name* is a <character> column.

## 4 : Variables names
Variables names are directly the one used by the original dataset and provided into the *"features.txt"* file.

## 5 : Average of each variable for each activity and each subject
From the *reduced_tidy_data* dataset, a second one is generated using group_by function to group frist by *Activity_Name* column and then by *Subject_ID*, and then function summarize is used to do apply mean function to this group by.
Names of all variables have been modified adding *"mean_"* before them to noticed that they are averages.

The generated new data set is called *mean_tidy_data* and file *"mean_tidy_data.csv.zip"* is generated.
