The original code contains test and train data sets, each with its own subject_test.txt, X_test.txt and y_test.txt.

In order to clean the data it was necessary to:

## Merges the training and the test sets to create one data set.
	The code combines the columns of all of the test data sets as well as all of those for the train data set.
	The code then combines the rows of the resulting data sets.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
	The code then goes on and extract only those values that contain either mean() or std() in their column name.
## Uses descriptive activity names to name the activities in the data set
	The code integrates the human readable label instead of the numeric one for the outcome.
## Appropriately labels the data set with descriptive variable names. 
	The code labels each column accordingly.