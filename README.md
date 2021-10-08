# Getting-and-Cleaning-Data-Course-Project
First of all, I downloaded file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to my working dirtory, then I uses the tidyverse package and readr package to clean the data.

Secondly, I did some preparation.
I loaded the X_train.txt, y_train.txt and subject_train.txt in the train folder to R, and merged them all as set1. Same thing with test folder, except as name set2. Both datasets's first two columns were renamed with "subject" and "activity".
I also loaded the features.txt to R, too.

Thirdly, I clean the data follwing the five steps as required.

Lastly, after the cleaning process, I got a merged data set from step 1, which named 'mergedata', a tidy data set with the average of each variable for each activity and each subject from step 5, which named 'avgact' and 'avgsub'
