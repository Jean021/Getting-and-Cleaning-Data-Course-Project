#unzip the download file to working directory first
library(tidyverse)
library(readr)

training <- read_fwf('UCI HAR Dataset/train/X_train.txt')
ytra <- read_fwf('UCI HAR Dataset/train/y_train.txt')
subjecttra <- read_fwf('UCI HAR Dataset/train/subject_train.txt')
set1 <- bind_cols(subjecttra,ytra,training)
names(set1)[1:2] <- c('subject','activity')

test <- read_fwf('UCI HAR Dataset/test/X_test.txt')
ytes <- read_fwf('UCI HAR Dataset/test/y_test.txt')
subjecttes <- read_fwf('UCI HAR Dataset/test/subject_test.txt')
set2 <- bind_cols(subjecttes,ytes,test)
names(set2)[1:2] <- c('subject','activity')

features <- read_delim('UCI HAR Dataset/features.txt',col_names = F)

#step 1:Merges the training and the test sets to create one data set
mergedata <- bind_rows(set1,set2)

#step 2:Extracts only the measurements on the mean and standard deviation for each measurement
index <- grep("mean?\\W|std",features$X2)
index <- index+2
measuredata <- mergedata[,c(1,2,index)]

#step 3:Uses descriptive activity names to name the activities in the data set
activity <- read_delim('UCI HAR Dataset/activity_labels.txt',col_names = F)
newcode <- activity$X2
measuredata$activity <- newcode[measuredata$activity]

#step 4:Appropriately labels the data set with descriptive variable names
names(measuredata)[3:68] <- features$X2[index-2]

#step 5:From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
tidydata <- measuredata  %>% 
  group_by(activity,subject) %>% summarize_each(funs(mean))
names(tidydata)[3:68] <- paste('avg',features$X2[index-2],sep = '')


write.table(tidydata,'tidydata.txt',row.name=FALSE)

