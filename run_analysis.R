
##Libraries to include
library("dplyr")


##First Part
dir <- paste(getwd(),"/fitbit.zip",sep="")
fileName <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileName,dir)
con <- unzip(dir)
train_dir <- paste(getwd(),"/UCI HAR Dataset/train",sep="")
test_dir <- paste(getwd(),"/UCI HAR Dataset/test",sep="")
features_dir <- paste(getwd(),"/UCI HAR Dataset",sep="")


X_train <- read.table(paste(train_dir,"/X_train.txt",sep=""), header = FALSE)
subject_train <- read.table(paste(train_dir,"/subject_train.txt",sep=""), header = FALSE)
Y_train <- read.table(paste(train_dir,"/Y_train.txt",sep=""), header = FALSE)
train <- cbind(X_train,subject_train,Y_train)

X_test <- read.table(paste(test_dir,"/X_test.txt",sep=""), header = FALSE)
subject_test <- read.table(paste(test_dir,"/subject_test.txt",sep=""), header = FALSE)
Y_test <- read.table(paste(test_dir,"/Y_test.txt",sep=""), header = FALSE)
test <- cbind(X_test,subject_test,Y_test)
data <- rbind(train,test)

## Fourth part -- labels the data set with descriptive variable names
features <- read.table(paste(features_dir,"/features.txt",sep=""), header = FALSE)
col_names <- c(as.character(features$V2),"subject","activity")
names(data) <- col_names

##Second part
indices <- c(grep("mean()", names(data), fixed= TRUE),grep("std()", names(data), fixed=TRUE),grep("subject", names(data), fixed=TRUE),grep("activity", names(data), fixed=TRUE))
df_mean_sd <- data[,indices]
##df_mean_sd has 68 records including subject and activity

##Third part
activities <- read.table(paste(features_dir,"/activity_labels.txt",sep=""), header = FALSE)
df_mean_sd$activity[df_mean_sd$activity == 1] <- "WALKING"
df_mean_sd$activity[df_mean_sd$activity == 2] <- "WALKING_UPSTAIRS"
df_mean_sd$activity[df_mean_sd$activity == 3] <- "WALKING_DOWNSTAIRS"
df_mean_sd$activity[df_mean_sd$activity == 4] <- "SITTING"
df_mean_sd$activity[df_mean_sd$activity == 5] <- "STANDING"
df_mean_sd$activity[df_mean_sd$activity == 6] <- "LAYING"


## Fourth part is done in between first and second part

##Fifth Part -- It has 180 rows with data for each subject for each activity and mean of all the other columns 
tidy_data_set <- df_mean_sd %>% group_by(activity,subject) %>% summarise_each(funs(mean))



