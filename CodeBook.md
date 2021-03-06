# CodeBook for Course Project at the Getting and cleaning data course from Coursera.org

This is a codebook for tidy_data_part5.txt set generated by the run_analysis.R script. Details about what the script does can be found in the README.md file in this repository.

## About this data set (excerpt from README.txt from the original data set):
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

All measurements are done for X, Y and Z coordinate and are therefore dividied into three measurements.

## Transformation of original data set:
Data set was originally divided into two sets (training and testing). By using run_analysis.R we combine both test and train data to obtain one single set which we then further analyse. During this transformation we renamed the 561 variables to avoid duplicate names ('-', '(' and ')' were replaced by dots). For our transformation, we only used the columns which contain mean and standard deviation values of the measurements from the original data set. 

The following variables are used in data set which is finished in part 5 of the assignment:
	
	1. Activity
	  * Describes the activity at which the measurement was taken
	  * Values:
	    * Walking
		* WalkingUpstairs
		* WalkingDownstairs
		* Sitting
		* Standing
		* Laying
	2. SubjectID
	  * Subject identifier: int 1...30
	3. tBodyAcc.mean...X
	4. tBodyAcc.mean...Y                
	5. tBodyAcc.mean...Z
	6. tGravityAcc.mean...X
	7. tGravityAcc.mean...Y
	8. tGravityAcc.mean...Z               
	9. tBodyAccJerk.mean...X
	10. tBodyAccJerk.mean...Y
	11. tBodyAccJerk.mean...Z
	12. tBodyGyro.mean...X               
	13. tBodyGyro.mean...Y
	14. tBodyGyro.mean...Z
	15. tBodyGyroJerk.mean...X
	16. tBodyGyroJerk.mean...Y
	17. tBodyGyroJerk.mean...Z
	18. tBodyAccMag.mean..
	19. tGravityAccMag.mean..
	20. tBodyAccJerkMag.mean..
	21. tBodyGyroMag.mean..
	22. tBodyGyroJerkMag.mean..
	23. fBodyAcc.mean...X
	24. fBodyAcc.mean...Y
	25. fBodyAcc.mean...Z
	26. fBodyAcc.meanFreq...X
	27. fBodyAcc.meanFreq...Y
	28. fBodyAcc.meanFreq...Z
	29. fBodyAccJerk.mean...X
	30. fBodyAccJerk.mean...Y
	31. fBodyAccJerk.mean...Z
	32. fBodyAccJerk.meanFreq...X
	33. fBodyAccJerk.meanFreq...Y
	34. fBodyAccJerk.meanFreq...Z
	35. fBodyGyro.mean...X
	36. fBodyGyro.mean...Y
	37. fBodyGyro.mean...Z
	38. fBodyGyro.meanFreq...X
	39. fBodyGyro.meanFreq...Y
	40. fBodyGyro.meanFreq...Z
	41. fBodyAccMag.mean..
	42. fBodyAccMag.meanFreq..
	43. fBodyBodyAccJerkMag.mean..
	44. fBodyBodyAccJerkMag.meanFreq..
	45. fBodyBodyGyroMag.mean..
	46. fBodyBodyGyroMag.meanFreq..
	47. fBodyBodyGyroJerkMag.mean..
	48. fBodyBodyGyroJerkMag.meanFreq..
	49. angle.tBodyAccMean.gravity.
	50. angle.tBodyAccJerkMean..gravityMean.
	51. angle.tBodyGyroMean.gravityMean.
	52. angle.tBodyGyroJerkMean.gravityMean.
	53. angle.X.gravityMean.
	54. angle.Y.gravityMean.
	55. angle.Z.gravityMean.
	56. tBodyAcc.std...X
	57. tBodyAcc.std...Y
	58. tBodyAcc.std...Z
	59. tGravityAcc.std...X
	60. tGravityAcc.std...Y
	61. tGravityAcc.std...Z
	62. tBodyAccJerk.std...X
	63. tBodyAccJerk.std...Y
	64. tBodyAccJerk.std...Z
	65. tBodyGyro.std...X
	66. tBodyGyro.std...Y
	67. tBodyGyro.std...Z
	68. tBodyGyroJerk.std...X
	69. tBodyGyroJerk.std...Y
	70. tBodyGyroJerk.std...Z
	71. tBodyAccMag.std..
	72. tGravityAccMag.std..
	73. tBodyAccJerkMag.std..
	74. tBodyGyroMag.std..
	75. tBodyGyroJerkMag.std..
	76. fBodyAcc.std...X
	77. fBodyAcc.std...Y
	78. fBodyAcc.std...Z
	79. fBodyAccJerk.std...X
	80. fBodyAccJerk.std...Y
	81. fBodyAccJerk.std...Z
	82. fBodyGyro.std...X
	83. fBodyGyro.std...Y
	84. fBodyGyro.std...Z
	85. fBodyAccMag.std..
	86. fBodyBodyAccJerkMag.std..
	87. fBodyBodyGyroMag.std..
	88. fBodyBodyGyroJerkMag.std..
	
## Variables for tidy data set (part 5 of the assignment)

For part 5, all data was grouped by Activity and SubjectID. The columns now represent the mean of all measurements from one activity of one subject. In tidy_data_part5.txt all columns therefore have a AVG_ at the start of the name.

These are the resulting variables:

	1. Activity
	  * Describes the activity at which the measurement was taken
	  * Values:
	    * Walking
		* WalkingUpstairs
		* WalkingDownstairs
		* Sitting
		* Standing
		* Laying
	2. SubjectID
	  * Subject identifier: int 1...30
	3. AVG_tBodyAcc.mean...X
	4. AVG_tBodyAcc.mean...Y                
	5. AVG_tBodyAcc.mean...Z
	6. AVG_tGravityAcc.mean...X
	7. AVG_tGravityAcc.mean...Y
	8. AVG_tGravityAcc.mean...Z               
	9. AVG_tBodyAccJerk.mean...X
	10. AVG_tBodyAccJerk.mean...Y
	11. AVG_tBodyAccJerk.mean...Z
	12. AVG_tBodyGyro.mean...X               
	13. AVG_tBodyGyro.mean...Y
	14. AVG_tBodyGyro.mean...Z
	15. AVG_tBodyGyroJerk.mean...X
	16. AVG_tBodyGyroJerk.mean...Y
	17. AVG_tBodyGyroJerk.mean...Z
	18. AVG_tBodyAccMag.mean..
	19. AVG_tGravityAccMag.mean..
	20. AVG_tBodyAccJerkMag.mean..
	21. AVG_tBodyGyroMag.mean..
	22. AVG_tBodyGyroJerkMag.mean..
	23. AVG_fBodyAcc.mean...X
	24. AVG_fBodyAcc.mean...Y
	25. AVG_fBodyAcc.mean...Z
	26. AVG_fBodyAcc.meanFreq...X
	27. AVG_fBodyAcc.meanFreq...Y
	28. AVG_fBodyAcc.meanFreq...Z
	29. AVG_fBodyAccJerk.mean...X
	30. AVG_fBodyAccJerk.mean...Y
	31. AVG_fBodyAccJerk.mean...Z
	32. AVG_fBodyAccJerk.meanFreq...X
	33. AVG_fBodyAccJerk.meanFreq...Y
	34. AVG_fBodyAccJerk.meanFreq...Z
	35. AVG_fBodyGyro.mean...X
	36. AVG_fBodyGyro.mean...Y
	37. AVG_fBodyGyro.mean...Z
	38. AVG_fBodyGyro.meanFreq...X
	39. AVG_fBodyGyro.meanFreq...Y
	40. AVG_fBodyGyro.meanFreq...Z
	41. AVG_fBodyAccMag.mean..
	42. AVG_fBodyAccMag.meanFreq..
	43. AVG_fBodyBodyAccJerkMag.mean..
	44. AVG_fBodyBodyAccJerkMag.meanFreq..
	45. AVG_fBodyBodyGyroMag.mean..
	46. AVG_fBodyBodyGyroMag.meanFreq..
	47. AVG_fBodyBodyGyroJerkMag.mean..
	48. AVG_fBodyBodyGyroJerkMag.meanFreq..
	49. AVG_angle.tBodyAccMean.gravity.
	50. AVG_angle.tBodyAccJerkMean..gravityMean.
	51. AVG_angle.tBodyGyroMean.gravityMean.
	52. AVG_angle.tBodyGyroJerkMean.gravityMean.
	53. AVG_angle.X.gravityMean.
	54. AVG_angle.Y.gravityMean.
	55. AVG_angle.Z.gravityMean.
	56. AVG_tBodyAcc.std...X
	57. AVG_tBodyAcc.std...Y
	58. AVG_tBodyAcc.std...Z
	59. AVG_tGravityAcc.std...X
	60. AVG_tGravityAcc.std...Y
	61. AVG_tGravityAcc.std...Z
	62. AVG_tBodyAccJerk.std...X
	63. AVG_tBodyAccJerk.std...Y
	64. AVG_tBodyAccJerk.std...Z
	65. AVG_tBodyGyro.std...X
	66. AVG_tBodyGyro.std...Y
	67. AVG_tBodyGyro.std...Z
	68. AVG_tBodyGyroJerk.std...X
	69. AVG_tBodyGyroJerk.std...Y
	70. AVG_tBodyGyroJerk.std...Z
	71. AVG_tBodyAccMag.std..
	72. AVG_tGravityAccMag.std..
	73. AVG_tBodyAccJerkMag.std..
	74. AVG_tBodyGyroMag.std..
	75. AVG_tBodyGyroJerkMag.std..
	76. AVG_fBodyAcc.std...X
	77. AVG_fBodyAcc.std...Y
	78. AVG_fBodyAcc.std...Z
	79. AVG_fBodyAccJerk.std...X
	80. AVG_fBodyAccJerk.std...Y
	81. AVG_fBodyAccJerk.std...Z
	82. AVG_fBodyGyro.std...X
	83. AVG_fBodyGyro.std...Y
	84. AVG_fBodyGyro.std...Z
	85. AVG_fBodyAccMag.std..
	86. AVG_fBodyBodyAccJerkMag.std..
	87. AVG_fBodyBodyGyroMag.std..
	88. AVG_fBodyBodyGyroJerkMag.std..




















