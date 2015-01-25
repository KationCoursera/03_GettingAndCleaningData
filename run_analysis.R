run_analysis <- function() {
  
  require("plyr")
  require("ddplyr")
  require("rstring")
  
  ##################
  # PART 1 & 3 & 4 #
  ##################
  
  # Goes as follows:
  # 1. Read all data into variables
  # 2. Raname the column names from x files to match the feature list from feature.txt
  # 3. Rename the column from y files to Activity -> also create a factor from integers and rename the levels to more descriptive values (PART 3)
  # 4. Rename the column from subjects file to SubjectID
  # 5. Combine columns SubjectID, Activity (y files) and all the measurements (x files)
  
  ## Read data into variables
  
  ## IF YOU ARE CLONING THIS REPO, USE THE FOLLOWING LOAD:
  
  x_test <- read.table("UCI HAR Dataset//test//X_test.txt")
  y_test <- read.table("UCI HAR Dataset//test//Y_test.txt")
  subject_test <- read.table("UCI HAR Dataset//test//subject_test.txt")
  
  x_train <- read.table("UCI HAR Dataset//train//X_train.txt")
  y_train <- read.table("UCI HAR Dataset//train//Y_train.txt")
  subject_train <- read.table("UCI HAR Dataset//train//subject_train.txt")
  
  x_col_names <- read.table("UCI HAR Dataset//features.txt")
  
  ## IF YOU ARE COPYING THIS SCRIPT AND HAVE ALL THE DATA FILES IN YOUR WORKING DIRECTORY, USE THE FOLLOWING LOAD:
  
  #x_test <- read.table("X_test.txt")
  #y_test <- read.table("Y_test.txt")
  #subject_test <- read.table("subject_test.txt")
  
  #x_train <- read.table("X_train.txt")
  #y_train <- read.table("Y_train.txt")
  #subject_train <- read.table("subject_train.txt")
  
  #x_col_names <- read.table("features.txt")
    
  # Read column names and shave of the indices
  
  
  x_col_names <- x_col_names[,2]
  x_col_names <- make.names(x_col_names,unique=TRUE);
  
  # Assign column names to x_data
  
  colnames(x_test) <- x_col_names
  colnames(x_train) <- x_col_names
  
  # Rename columns to Activity and refactor Activities from numbers to descriptive values - PART 3
  
  y_train_renamed <- rename(y_train,c('V1' = 'Activity'))
  y_train_renamed$Activity <- as.factor(y_train_renamed$Activity)
  y_train_renamed$Activity <- revalue(y_train_renamed$Activity,c("1"="Walking", "2"="WalkingUpstairs", "3"="WalkingDownstairs", "4"="Sitting","5"="Standing","6"="Laying"))
  
  y_test_renamed <- rename(y_test,c('V1' = 'Activity'))  
  y_test_renamed$Activity <- as.factor(y_test_renamed$Activity)
  y_test_renamed$Activity <- revalue(y_test_renamed$Activity,c("1"="Walking", "2"="WalkingUpstairs", "3"="WalkingDownstairs", "4"="Sitting","5"="Standing","6"="Laying"))
  
  ## Rename columns from V1 to SubjectID to be more descriptive
  
  subject_test_renamed <- rename(subject_test,c('V1' = 'SubjectID'))
  subject_train_renamed <- rename(subject_train,c('V1' = 'SubjectID'))
  
  ## Bind activity and subject columns to measured data
  
  data_train <- cbind(subject_train_renamed,y_train_renamed,x_train)
  data_test <-cbind(subject_test_renamed,y_test_renamed,x_test)
  
  ## Merge data sets
  
  data <- rbind(data_train,data_test)
  
  ##########
  # PART 2 # - Select only columns Activity, SubjectID and all measurements containing mean and standard deviation of each measurement
  ##########
  
  # If we go through feature.txt we can see that there are measurements containing mean (for mean), std (for standard deviation) AND Mean (for mean)
  
  data_f <- select(data,Activity,SubjectID,contains("mean"),contains("std"),contains("Mean"))
  
  ##########
  # Part 5 #
  ##########
  
  ## Calculate mean of each variable for each Activity and each SubjectID
  
  data_part5 <- ddply(data_f,c("Activity","SubjectID"),numcolwise(mean))  
  
  ## Rename the column, they now represent the average of each measurement 
  
  colnames(data_part5)[3:88] <- str_c("AVG_",colnames(data_part5)[3:88])
  
  write.table(data_part5,"tidy_data_part5.txt",row.name=FALSE)
  
}