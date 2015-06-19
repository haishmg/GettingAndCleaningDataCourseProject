# GettingAndCleaningDataCourseProject

Initially I am loading the dplyr package , which will be used in the part5

##First part
Getting the current Working directory, downloading the file from the internet, unzipping the file. used read.table to read all the test and train data files into the respecitve data frames.

##Fourth part
Labels the data set with descriptive variable names(subject and activity). This I am doing ahead only as I had already coded this and came across the same in the questions

##Second part
Greps for all mean() and std() names in the columns and gets the respective rows , totall 66 rows and two additional rows, which are sunject and activity


##Third part
Used to replace the values for all the activities with the activity names

## Fourth part is done in between first and second part

##Fifth Part -- Used group by and summarise_each functions to generate data. It has 180 rows with data for each subject for each activity and mean of all the other columns 
