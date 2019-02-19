# -------Loading R Libraries-------#
# Install dplyr library if you didn't during the course

library(dplyr)
library(stringr)


####################################
# 0. ------ Loading Dataset -------#
####################################

# Lets check the dataset exists
filename <- 'getdata_projectfiles_UCI HAR Dataset.zip'
dataurl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

if (!file.exists(filename)) {
  download.file(dataurl, filename, mode="wb") # If file doesn't exist in our wd - then we download it
}

data_folder <- 'UCI HAR Dataset'
if (!file.exists(data_folder)) { # Zip archive contains folder "UCI HAR Dataset" so if file been unpacked then we must see this cat in our wd. 
  unzip(filename) # If don't have this directory - then we need to unzip the file
}

# Well done!
# Now we need to read the data
# Lets start from reading the tables

#Features and activities
features <- read.table(file.path(data_folder, "features.txt"), as.is=TRUE)
activity_labels <- read.table(file.path(data_folder, "activity_labels.txt"))

# Train objects
train_subjects <- read.table(file.path(data_folder, 'train', 'subject_train.txt'))
train_values <- read.table(file.path(data_folder, 'train', 'X_train.txt'))
train_activity <- read.table(file.path(data_folder, 'train', 'y_train.txt'))

# Test objects
test_subjects <- read.table(file.path(data_folder, 'test', 'subject_test.txt'))
test_values <- read.table(file.path(data_folder, 'test', 'X_test.txt'))
test_activity <- read.table(file.path(data_folder, 'test', 'y_test.txt'))

#Setting up column names, table doesn't have any by default.
colnames(features) <- c("feature_id", "feature_name")
colnames(activity_labels) <- c("activity_id", "activity_label")

colnames(train_subjects) <- "subject_id"
colnames(train_values) <- features$feature_name
colnames(train_activity) <- "activity_id"

colnames(test_subjects) <- "subject_id"
colnames(test_values) <- features$feature_name
colnames(test_activity) <- "activity_id"


####################################
# 1.       Merging Dataset         #
####################################

#Compiling 
train <- cbind(train_subjects, train_values, train_activity)
test <- cbind(test_subjects, test_values, test_activity)
dataset <- rbind(train, test)

#My PC lag on processing this dataset so I remove unusing variables to make the code to be doing faster
rm(train, test, test_subjects, test_values, test_activity, train_subjects, train_values, train_activity, dataurl)


####################################
# 2.    Extracting measurements    #
####################################

# Getting all of the mean and standard deviation containing names
required_names_index <- grep("-(mean|std)", colnames(dataset))
required_names_index <- c(1, length(dataset), required_names_index)
dataset <- dataset[, required_names_index]


####################################
# 3.  Descriptive activity names   #
####################################
replaces <- colnames(dataset)
replace_from <- unique(regmatches(colnames(dataset), regexpr('-(mean|std)', colnames(dataset)))) # Hooking up all non-tidy headers of requested value
if (length(replace_from) > 0){
  replace_to <- sapply(replaces, function(elem){ paste(toupper(substr(elem,2,2)), substr(elem, 3, nchar(elem)), sep="") }, USE.NAMES = FALSE) # Tidy version of hooked headers
  for (i in 1:length(replace_from)){
    colnames(dataset) <- gsub(replace_from[i], replace_to[1], colnames(dataset))
  }  
}

colnames(dataset) <- gsub('\\(|\\)', '', colnames(dataset))

dataset$activity_name <- factor(dataset$activity_id, levels = activity_labels[,1], labels = activity_labels[,2])
dataset <- dataset[,c(1, length(colnames(dataset)), 3:length(colnames(dataset))-1)]


####################################
# 4.     Appropriately labels      #
####################################

cnames <- colnames(dataset)

cnames <- gsub('^t', 'time', cnames)
cnames <- gsub('^f', 'frequency', cnames)
cnames <- gsub('(Body)+', 'Body', cnames)
cnames <- gsub('Acc', 'Accelerometer', cnames)
cnames <- gsub('Gyro', 'Gyroscope', cnames)
cnames <- gsub('Mag', 'Magnitude', cnames)
cnames <- gsub('Freq', 'Frequency', cnames)

colnames(dataset) <- cnames


####################################
# 5.        Means dataset          #
####################################

dataset_means <- dataset %>%
  group_by(subject_id, activity_id, activity_name) %>%
  summarise_all(funs(mean))

####################################
# -    Write dataset into file     #
####################################
write.table(dataset_means, "tidy_data.txt", row.names = FALSE, quote = FALSE)