# Read X,Y, Subjects Test & Train datasets.
xTest <- read.table("./test/X_test.txt")
xTrain <- read.table("./train/X_train.txt")
yTest <- read.table("./test/y_test.txt")
yTrain <- read.table("./train/y_train.txt")
sTest <- read.table("./test/subject_test.txt")
sTrain <- read.table("./train/subject_train.txt")

# Combine Test & Training dataset. Not X and Y yet.
xFinal <- rbind(xTest, xTrain)
yFinal <- rbind(yTest, yTrain)
sFinal <- rbind(sTest, sTrain)

# First Labels (not sensors)
names(sFinal) <- c("Subject")
names(yFinal) <- c("Activity")

# Prep y Activities with real names.
activity.code <- c("WALKING"=1, "WALKING_UPSTAIRS"=2, "WALKING_DOWNSTAIRS"=3, "SITTING"=4, "STANDING"=5, "LAYING"=6)
yFinal$V1 <- names(activity.code)[match(yFinal$V1, activity.code)]

# To get the mean of each sensor. (by col, for training + test)
sensorMean <- apply(xFinal, 2, mean)
# To get the std dev of each sensor. (by col, for training + test)
sensorSd <- apply(xFinal, 2, sd)

# Combine S, Y and X.
zFinal <- cbind(sFinal, yFinal, xFinal)

# melt and dcast, to extract tidydata on the mean of each feature from each Subject + Activity
zMelt <- melt(zFinal, id=c("Subject", "Activity"))
tidyData<-dcast(zMelt, Subject + Activity ~ variable, fun.aggregate=mean)

# Output in a file.
write.table(tidyData, "GetClean_CourseProject_YR.txt")