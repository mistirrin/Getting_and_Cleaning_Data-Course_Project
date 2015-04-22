# Getting_and_Cleaning_Data-Course_Project
Course-Project
==========================================

All of the data used to run run_analysis.R was retrieved from (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## run_analysis.R

run_analysis.R works by:
	* Grouping the subject, X and Y data sets for the train and test data sets.
	* Grouping both the train and test data set.
	* Filtering those columns that contain means and standard deviations. 
	* Naming the columns correctly.
	* Giving a human readable label to the outcome column.
	* Grouping the records by subject and activity.
	* Summarize the data by getting the mean.
	* Outputting the final, tidy data set (tidy_data.txt).

## Files

The code downloads the files from the source if needed.

`CodeBook.md` gives an overview on how the raw data was processed.

`run_analysis.R` code to reproduce the results of the analysis in R.
