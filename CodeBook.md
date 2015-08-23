#Code Book for run_analysis.R Script

####The first 2 columns are the Subject_IDs and Activity.

####Columns 3 and 4 represent the means and standard deviations which were extracted from the 'features.txt' file, which include all the features that had "-mean( )" or "-std( )" in the name. The values in the column represent the average for each of the measurements, mean or standard deviation, broken down my each activity and each subject. This leaves us with a data frame of 180 rows because 30 Subjects x 6 Activies = 180 Observations. Below is a list of the column names.

#####Column Number = Column Name
* 1 = Subject_ID
	*ID number for each of the 30 volunteers labelled 1-30
* 2 = Activity
	*6 Activities: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, or Laying
* 3 = mean: mean, or average
* 4 = std: standard deviation


