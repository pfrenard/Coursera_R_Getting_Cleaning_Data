## loading libraries
library(readr)
library(dplyr)
library(zip)

## working directory

## check that we are in a directory like "..../project/data", 
## using regexp "project/data$" and grep
if (! grepl("Coursera_R_Getting_Cleaning_Data/data$",getwd()) ) { setwd("./data") }



#### Loading Files into memory
activities   <- "UCI HAR Dataset/activity_labels.txt"
features     <- "UCI HAR Dataset/features.txt"

file_X_test  <- "UCI HAR Dataset/test/X_test.txt.zip"
file_y_test  <- "UCI HAR Dataset/test/y_test.txt.zip"
file_s_test  <- "UCI HAR Dataset/test/subject_test.txt.zip"
file_X_train <- "UCI HAR Dataset/train/X_train.txt.zip"
file_y_train <- "UCI HAR Dataset/train/y_train.txt.zip"
file_s_train <- "UCI HAR Dataset/train/subject_train.txt.zip"

# features
cat(" Loading files .\n")
features_list <- read_table2(features,col_names=FALSE)
features_names <- pull(features_list,X2)

# activities
activities_list <- read_table2(activities,col_names=FALSE)
colnames(activities_list) <- c("Activity_ID","Activity_Name")

# subject, target, features data
cat(" Loading test and train files .\n")

s_test <- read_table(file_s_test,col_names=FALSE)
colnames(s_test)<-"Subject_ID"
y_test <- read_table(file_y_test,col_names=FALSE)
colnames(y_test)<-"Activity_ID"
X_test <- read_table(file_X_test,col_names=FALSE)
colnames(X_test) <- features_names

s_train <- read_table(file_s_train,col_names=FALSE)
colnames(s_train)<-"Subject_ID"
y_train <- read_table(file_y_train,col_names=FALSE)
colnames(y_train)<-"Activity_ID"
X_train <- read_table(file_X_train,col_names=FALSE)
colnames(X_train) <- features_names


# binding data all together
cat(" Building tbl_df .\n")

s <- rbind(s_test,s_train)
y <- rbind(y_test,y_train)
y <- merge(y,activities_list, by="Activity_ID")

X <- rbind(X_test,X_train)

tidy_data <- cbind(s,y,X)

cat(" tidy_data generated .\n")

#let's free up memory :)

#let's free up memory :)
rm(activities,features,file_s_test,file_s_train,file_y_test,file_y_train,file_X_test,file_X_train)
rm(s_test,s_train,y_test,y_train,X_test,X_train,features_list,features_names,activities_list)
rm(s,y,X)




## Extract only mean and standar deviation measures based on their names
all_cols <- names( tidy_data)

## mean and std columns and Subject_ID, Activity_ID, Activity_Name
## regexp on "mean(" "std" "Subject_ID" "Activity_"
subset_cols <- grep("(mean\\())|(std)|(Subject_ID)|(Activity_)", all_cols)

##
reduced_tidy_data <- tidy_data[subset_cols]
cat(" reduced_tidy_data generated .\n")




## creating tidy data grouped by Activities and Subjects and summaryze for all data with mean
mean_tidy_data <- reduced_tidy_data %>% group_by(Activity_Name,Subject_ID) %>% summarize_all(mean)

# add prefix mean before variable names that are not Activity_* and Subject_ID
names(mean_tidy_data) <- gsub("^f","mean_f",   sub("^t","mean_t", names(mean_tidy_data)) )
cat(" mean_reduced_tidy_data generated .\n")



## Now writing into csv file 
write_csv(tidy_data,"./tidy_data.csv")
write_csv(reduced_tidy_data,"./reduced_tidy_data.csv")
write_csv(grpby_tidy_data,"./mean_tidy_data.csv")
cat(" 3 csv files generated .\n")

## zip them to be < 50 Mb ( limit of github)
zipr("./tidy_data.csv.zip","./tidy_data.csv")
zipr("./reduced_tidy_data.csv.zip","./reduced_tidy_data.csv")
zipr("./mean_tidy_data.csv.zip","./mean_tidy_data.csv")
cat(" 3 csv files ziped .\n")

## deleting csv files
unlink("./tidy_data.csv")
unlink("./reduced_tidy_data.csv")
unlink("./mean_tidy_data.csv")





