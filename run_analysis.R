#Download File
filePath <- paste(getwd(),"data",sep="/")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists(filePath)) {
  temp <- tempfile()
  download.file(url=fileUrl,destfile=temp,method="curl")
  unzip(zipfile=temp,exdir=filePath)
}

#Get train data set
train.Subject <- read.table(file.path(filePath,"UCI HAR Dataset","train","subject_train.txt"),header=FALSE)
train.X <- read.table(file.path(filePath,"UCI HAR Dataset","train","X_train.txt"),header=FALSE)
train.Y <- read.table(file.path(filePath,"UCI HAR Dataset","train","y_train.txt"),header=FALSE)

#Get test data set
test.Subject <- read.table(file.path(filePath,"UCI HAR Dataset","test","subject_test.txt"),header=FALSE)
test.X <- read.table(file.path(filePath,"UCI HAR Dataset","test","X_test.txt"),header=FALSE)
test.Y <- read.table(file.path(filePath,"UCI HAR Dataset","test","y_test.txt"),header=FALSE)

#Get features
features <- read.table(file.path(filePath, "UCI HAR Dataset", "features.txt"), header=FALSE)

#Get indexes for mean and standard deviation columns
indexes <- grep(pattern="mean\\(\\)|std\\(\\)", features[[2]])

#Extract mean and standard deviation columns from features
train.X_filtered <- train.X[indexes]
test.X_filtered <- test.X[indexes]

#Bind data rows
data.Subject <- rbind(train.Subject, test.Subject)
data.X <- rbind(train.X_filtered, test.X_filtered)
data.Y <- rbind(train.Y, test.Y)

#Get descriptive activity names
activities <- read.table(file.path(filePath,"UCI HAR Dataset", "activity_labels.txt"),header=FALSE, stringsAsFactors=FALSE)
data.Y_labeled <- data.frame(activities[data.Y[[1]],2])

#Label the data appropriately
names(data.Subject) <- "subject"
names(data.X) <- features[indexes,2]
names(data.Y_labeled) <- "activity"

#Bind data columns
data <- cbind(data.Subject, data.X, data.Y_labeled)

#Create summary data set
library(dplyr)
summary <- data %>% group_by(activity,subject) %>% summarise_each(funs(mean))
write.table(summary, file.path(filePath,"UCI HAR Dataset", "tidy_data.txt"), row.names=TRUE, sep=",")
