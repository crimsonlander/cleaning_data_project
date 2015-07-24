# Getting and Cleaning Data course project

## Files

### selected_features.txt

List of features used for analisis. 

### run_analisis.R

R script to be run to extract tidy data.

### tidy_data.txt

Resulting tidy data.
This file will be generated as a result of running run_analisis.R.

## Algorithm

* Download and extract dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Read lists of all features and features representing means and standard deviations of measurements from files.
* For both train and test sets: read features, activities and subjects from files, select only required fields, delete the rest.
* Merge train and test sets.
* Assign labels to activities.
* Calculate means grouping by activities and subjects.
* Save the result in file tidy_data.txt
