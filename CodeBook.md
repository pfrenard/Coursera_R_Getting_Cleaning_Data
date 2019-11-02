<!--- CodeBook - "Getting & Cleaning Data / Week 4 / Assignment" -->


# Original Readme
This Code Book is just an addition to the original one from
 **Human Activity Recognition Using Smartphones Dataset Version 1.0**
The file is still present in this repository.

# tidy_data.csv
This file contains all data from  the test and train dataset. Units are the same.
Column names are directly generated from  the features.txt file.

str(tidy_data) gives the following output (truncated here)

'data.frame':	10299 obs. of  564 variables: <br>
 $ Subject_ID                          : num  2 2 2 2 2 2 2 2 2 2 ...<br>
 $ Activity_ID                         : num  1 1 1 1 1 1 1 1 1 1 ...<br>
 $ Activity_Name                       : chr  "WALKING" "WALKING" "WALKING" "WALKING" ...<br>
 $ tBodyAcc-mean()-X                   : num  0.257 0.286 0.275 0.27 0.275 ...<br>
 $ tBodyAcc-mean()-Y                   : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...<br>
 $ tBodyAcc-mean()-Z                   : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...<br>
 $ tBodyAcc-std()-X                    : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...<br>
 $ tBodyAcc-std()-Y                    : num  -0.92 -0.967 -0.97 -0.973 -0.967 ...<br>
 $ tBodyAcc-std()-Z                    : num  -0.668 -0.945 -0.963 -0.967 -0.978 ...<br>
...<br>


 **Subject_ID** is the ID (from  1 to 30)<br>
 **Activity_ID** is the ID of the activity (from 1 to 6)<br>
 **Activity_Name** is the name of the activity ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")<br>
 All the following variables are the sensor signals from the smartphone, allready pre-processed, but without any modification from the original dataset.

# reduced_tidy_data.csv
This file contains the same data as the previous one except that only *mean()* and *std()* variables are kept.
Units are the same.

str(reduced_tidy_data) gives the following output (truncated here)

'data.frame':	10299 obs. of  69 variables:<br>
 $ Subject_ID                 : num  2 2 2 2 2 2 2 2 2 2 ...<br>
 $ Activity_ID                : num  1 1 1 1 1 1 1 1 1 1 ...<br>
 $ Activity_Name              : chr  "WALKING" "WALKING" "WALKING" "WALKING" ...<br>
 $ tBodyAcc-mean()-X          : num  0.257 0.286 0.275 0.27 0.275 ...<br>
 $ tBodyAcc-mean()-Y          : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...<br>
 $ tBodyAcc-mean()-Z          : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...<br>
 $ tBodyAcc-std()-X           : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...<br>
 $ tBodyAcc-std()-Y           : num  -0.92 -0.967 -0.97 -0.973 -0.967 ...<br>
 $ tBodyAcc-std()-Z           : num  -0.668 -0.945 -0.963 -0.967 -0.978 ...<br>
...<br>

**Subject_ID** is the ID (from  1 to 30)<br>
**Activity_ID** is the ID of the activity (from 1 to 6)<br>
**Activity_Name** is the name of the activity ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")<br>
All the following variables are the sensor signals from the smartphone, allready pre-processed, but without any modification from the original dataset.<br>

# mean_tidy_data.csv
This file contains data modified from the original dataset.
A *group by* process has been applied on *Activity_Name* and *Subject_ID*, and then a *mean* for each group for all available variables.
Units are the same, but as we are dealing with average, the *mean_* prefix has been added to the name of variables.

str(mean_tidy_data) gives the following output (truncated here)<br>

Classes ‘grouped_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	35 obs. of  69 variables:<br>
 $ Activity_Name                   : chr  "LAYING" "LAYING" "LAYING" "LAYING" ...<br>
 $ Subject_ID                      : num  25 26 27 28 29 30 8 11 14 15 ...<br>
 $ Activity_ID                     : num  6 6 6 6 6 6 4 4 4 4 ...<br>
 $ mean_tBodyAcc-mean()-X          : num  0.282 0.273 0.277 0.278 0.279 ...<br>
 $ mean_tBodyAcc-mean()-Y          : num  -0.0233 -0.0162 -0.0168 -0.0192 -0.0185 ...<br>
 $ mean_tBodyAcc-mean()-Z          : num  -0.111 -0.108 -0.111 -0.11 -0.109 ...<br>
 $ mean_tBodyAcc-std()-X           : num  -0.354 -0.623 -0.661 -0.649 -0.574 ...<br>
 $ mean_tBodyAcc-std()-Y           : num  -0.122 -0.586 -0.63 -0.574 -0.598 ...<br>
 $ mean_tBodyAcc-std()-Z           : num  -0.359 -0.705 -0.683 -0.686 -0.606 ...<br>
...<br>

**Subject_ID** is the ID (from  1 to 30)<br>
**Activity_ID** is the ID of the activity (from 1 to 6)<br>
**Activity_Name** is the name of the activity ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")<br>
All the following variables are the average value of the sensor signals from the smartphone, allready pre-processed, group by *Activity_Name* and *Subject_ID*.<br>
