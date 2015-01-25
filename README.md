# Getting And Cleaning Data - Course project

This is a git repository for Course Project at Getting and cleaning data course from Coursera.org Data science signature track.

## Contents of this repository
	1. UCI HAR Dataset (folder) - the dataset which was used for this course project
	2. run_analysis.R - The file which runs the analysis of the dataset and performs the tasks given at the course
	3. tidy_data_part5.txt - result of running the script -> tidy dataset for part 5 of the assignment
	4. CodeBook.md - a file describing the variables in my dataset
	5. README.md - the file you are reading right now
	
## run_analysis.R  rundown:

1. Check if required packages are installed and loaded into library (plyr, ddplyr, rstring)
2. Load the data from the files (required files: X_test.txt, Y_test.txt, subject_test.txt, X_train.txt, Y_train.txt, subject_train.txt, features.txt) - there are two types of loading, one is commented out:
  * If you clone the repository, you should use the first option
  * If you are just copying the run_analysis.R into a working directory with all the data files in the same directory, use the second option
3. Once the data is loaded, we rename the columns in our x files (files containing 561 types of measurements) using the names from features.txt (details on naming can be found in the CodeBook.md)
4. Columns for y files (files containing data about activities at which measurements were done) are renamed from V1 to Activity
5. Activity column is factorized with names instead of numbers ("1"="Walking", "2"="WalkingUpstairs", "3"="WalkingDownstairs", "4"="Sitting","5"="Standing","6"="Laying" as explained in the activity_labels.txt)
6. Columns for subject numbers are renamed from V1 to SubjectID
7. Activity, SubjectID and x files columns are bound together using cbind for both test and training sets
8. Test and training set rows with all the columns are bound by using rbind
9. Only columns Activity, SubjectID and all measurements that are mean or standrad deviation are selected (we select columns Activity, SubjectID and any column containing the word "mean", "std" or "Mean")
  * The names mean, std and Mean were chosen by manually scrolling through the features.txt file and checking how the names are structured. All the columns containing either mean, std, or Mean were chosen for Part 2 of this course project
10. For part 5, we group the data by columns "Activity" and "SubjectID" and calculate the mean for each group for each column
11. Column names are renamed accordingly to reflect the new variables (mean)
12. The result is saved to file tidy_data_part5.txt
	
Details for variable names can be found in the CodeBook.md