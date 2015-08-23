# Tidy Data Set

###1. Merges the training and the test sets to create one data set.
##### The first step in my code merges the data from each set, the test set and the training set, to create one set of each. I used rbind( ) to combine the Subject_ID and Activity to the X set of data, the used cbind( ) to combine the completed training and test sets to create one big data frame.

###2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#####To extract the data I needed, I looked at the 'features.txt' file from the orginal folder and noted which columns in the set contained either "-mean( )" or "-std( )". I selected only those columns from the entire data set and created a narrower data frame of 68 columns. (The first 2 columns were Subject_ID and Activity, and colums 3-68 where the selected columns from the 'features.txt' file). 

###3. Uses descriptive activity names to name the activities in the data set
#####From there, I coerced the Activity column to be of the class 'Factor', then renamed the factor levels from numeric to character to give the data activity names. For example, I renamed 1 -> "WALKING", 2 -> "WALKING_UPSTAIRS", etc. There were 6 different activities.

###4. Appropriately labels the data set with descriptive variable names. 
#####To label columns 3-68, I used the same feature names from the 'features.txt' list using the select( ) function from dplyr.

###5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#####For the hardest task, I used many functions from the reshape2 and tidyr package to tidy up the data set. First, I used the melt function to put all the feature names under one column as its own 'variable', using the "Subject_ID" and "Activity" columns as the id. The 4th column displayed the value. Next, I simplified the variable column to only list "mean" or "std", then grouped the data by the first 3 columns, and found the average of the values column. From there, I used the separate function from tidyr to separate the "mean" and "std" values to become their own columns with the values listed underneath. This left us with a tidy data set of 180 rows and 4 columns, with each column as one variable and each row an observation.
