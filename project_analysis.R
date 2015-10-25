library(caret); library(randomForest); library(dplyr)
setwd("~/Desktop/Coursera/Practical Machine Learning/PML_Project/")

# Read in data and perform data cleaning
training <- read.csv("pml-training.csv", na.strings = c("NA", "")); training.NAlist <- grep("NA", training); training <- select(training, -training.NAlist)
testing <- read.csv("pml-testing.csv", na.strings = c("NA", "")); testing.NAlist <- grep("NA", testing); testing <- select(testing, -testing.NAlist)
training[,-length(training)] <- data.frame(sapply(training[,-length(training)], as.numeric))
testing[,-length(testing)] <- data.frame(sapply(testing[,-length(testing)], as.numeric))
        write.csv(training, "pml-training_processed.csv", row.names=FALSE)
        write.csv(testing, "pml-testing_processed.csv", row.names=FALSE)

# Create subset within the training data set for cross validation
inTrain <- createDataPartition(y=training$X, p=0.7, list=FALSE)
training.train <- training[inTrain,]; write.csv(training.train, file = "pml-training_train.csv", row.names = FALSE)
training.test <- training[-inTrain,]; write.csv(training.test, file = "pml-training_test.csv", row.names = FALSE)

# Train with three methods
modFit <- train(classe ~ ., method = "lda", data = training.train[,-c(1,2)]); saveRDS(modFit, "mySavedModel001.rds")
        modFit.time <- system.time(train(classe ~ ., method = "lda", data = training.train[,-c(1,2)]))
modFit2 <- train(classe ~ ., method = "rpart", data = training.train[,-c(1,2)]); saveRDS(modFit2, "mySavedModel002.rds")
        modFit2.time <- system.time(train(classe ~ ., method = "rpart", data = training.train[,-c(1,2)]))
modFit3 <- randomForest(classe ~ ., data = training.train[,-c(1,2)]); saveRDS(modFit3, "mySavedModel003.rds")
        modFit3.time <- system.time(randomForest(classe ~ ., data = training.train[,-c(1,2)]))

mod.time <- data.frame(lda = as.matrix(modFit.time)[3], rpart = as.matrix(modFit2.time)[3], 
                       randomForest = as.matrix(modFit3.time)[3], row.names = "elapsed time (sec)")
        write.table(mod.time, "3 Models_elapsed time.txt")
answers1 <- predict(modFit, training.test[,-c(1,2,length(training.test))])
answers2 <- predict(modFit2, training.test[,-c(1,2,length(training.test))])
answers3 <- predict(modFit3, training.test[,-c(1,2,length(training.test))])

# Cross Validation
confusionMatrix(training.test$classe, answers1)
confusionMatrix(training.test$classe, answers2)
confusionMatrix(training.test$classe, answers3)

# Use the whole training set to make prediction
finalMod <- randomForest(classe ~ ., data = training[,-c(1,2)]); saveRDS(finalMod, "mySavedModel_final.rds")
finalMod.predict <- predict(finalMod, newdata = testing[,-c(1,2,length(testing))])
finalMod.predict
