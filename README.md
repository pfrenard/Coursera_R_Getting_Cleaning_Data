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
All these data can be merged using the following process :

- read data from subject, which will create one column and n rows, the column name is **"Subject_ID"**.
- read data from target, which will create one column and n rows, the column name is **"Activity_ID"**.
- read data from data, which will create 561 columns and n rows, the columns name are from the **features.txt** file.
- bind these columns using the cbind function which will create a table of n rows and 563 columns
- read activities names from **activities_label.txt**, which will create 2 columns **"Activity_ID"** and **"Activity_Name"** and 6 rows
- merge **"Activity_Name"** with all data using **"Activity_ID"**


# Data meaning

## Subject
There are 30 subjects in this experiment, identified from 1 to 30.
They are volunteers within an age bracket of 19-48 years.

## Target Activities
There are 6 different activities performed by the volunteers, identified from 1 to 6.
These activities are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
They were performed wearing a smartphone (Samsung Galaxy SII), and embedded accelerometer and gyroscope were used to capture data.


## Data
These data were captured from accelerometer and gyroscope, were pre-processed by applying filters and sampled in sliding windows of 2.56 s and 50% overlap. Each windows has 128 readings.

Each record is providing :
- Triaxal acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

## Tidy Data with only mean and standard deviation

A regexp is used to extract only columns with name like
- *mean(* , to select only names with "mean()" and avoid "meanFreq()"
- *std* , to select only names with "std()"
- *Subject_ID*, to select "Subject_ID"
- *Activity_*, to select "Activity_ID" and "Activity_Name"

## Tidy Data group by Activities and Subjects

Tidy Data can be group by **Activity_Name** and then by **Subject_ID**.
For Activity, one can use **Activity_ID** or **Activity_Name**, here **Activity_Name** is used.


## Data
### Original Data set
Original Data set has been modified and contains only the following files:

- ./UCI HAR Dataset/train/subject_train.txt
- ./UCI HAR Dataset/train/X_train.txt
- ./UCI HAR Dataset/train/y_train.txt
- ./UCI HAR Dataset/activity_labels.txt
- ./UCI HAR Dataset/features.txt
- ./UCI HAR Dataset/features_info.txt
- ./UCI HAR Dataset/README.txt
- ./UCI HAR Dataset/test/subject_test.txt
- ./UCI HAR Dataset/test/X_test.txt
- ./UCI HAR Dataset/test/y_test.txt
