#Read train and test data
train0 <- read.table("X_train.txt")
test0 <- read.table("X_test.txt")

#Read in subject identifier for train and test data
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")

#Read in activity identifier and labels
activity_train <- read.table("y_train.txt")
activity_test <- read.table("y_test.txt")
activity_labels <- read.table("activity_labels.txt")
colnames(activity_labels) <- c("index", "activity")

#Read in variable labels
labels <- read.table("features.txt", sep = " ", header = FALSE)

#Identifiers (subject, activity) data frame
identifiers <- data.frame(rbind(subject_train, subject_test), 
                          rbind(activity_train, activity_test))
colnames(identifiers) <- c("Subject", "Activity")
identifiers$Subject <- as.factor(identifiers$Subject)
identifiers$Activity <- factor(identifiers$Activity, 
                               labels = c("Walking","WalkingUp",
                                          "WalkingDown","Sitting"
                                          ,"Standing","Laying"))

#Combine train and test data and add names
data <- rbind(train0, test0)
colnames(data) <- labels[,2]

#Combine identifiers and data
df <- data.frame(identifiers, data) 

#Find variables with mean or standard deviation in name
index_mean <- grep(".mean.", names(df))
index_meanFreq <- grep(".meanFreq.", names(df)) #don't include meanFreq
index_std <- grep(".std.", names(df))
index <- setdiff(sort(union(index_mean, index_std)),index_meanFreq)

#Subset data for mean and standard deviation variables (include identifiers in 1st and 2nd columns)
df.subset <- df[,c(1,2,index)]

#Variable names to use (made in file)
labels2 <- read.table("labels2.txt") #names for variables
colnames(df.subset) <- c("Subject","Activity",as.character(labels2[,2]))

##Calculate means for each variable for each subject and activity
library(reshape2)

#Reshape data set to have subject, activity, variable, and value columns
tidy <- melt(df.subset, id=c("Subject", "Activity"))
colnames(tidy) <- c("Subject", "Activity", "Variable", "Value")

#Get averages for each variable by activity and subject 
averages <- tapply(tidy$Value, list(tidy$Activity, tidy$Subject, 
                                    tidy$Variable), mean)

#Reshape data set (from 3 dimensions to 2 with activity, subject, variable, and mean value colums)
tidymeans <- data.frame(melt(averages, 
                             id = c("Activity","Subject","Variable")))
colnames(tidymeans) <- c("Activity", "Subject", "Variable", "MeanValue")

#Write to file
write.table(tidymeans, file = "Means_by_Activity_Subject.txt", row.names=FALSE)
