# Reference: Ugulino, W.; Cardador, D.; Vega, K.; Velloso, E.; Milidiu, R.; Fuks, H. Wearable 
# Computing: Accelerometers' Data Classification of Body Postures and Movements. Proceedings of 
# 21st Brazilian Symposium on Artificial Intelligence. Advances in Artificial Intelligence - 
# SBIA 2012. In: Lecture Notes in Computer Science. , pp. 52-61. Curitiba, PR: Springer Berlin 
# / Heidelberg, 2012. ISBN 978-3-642-34458-9. DOI: 10.1007/978-3-642-34459-6_6. 
# Available from: http://groupware.les.inf.puc-rio.br/har
# Read more: http://groupware.les.inf.puc-rio.br/har#ixzz3pGSJUDfJ

library(caret); library(randomForest); library(dplyr)
setwd("~/Desktop/Coursera/Practical Machine Learning/PML_Project/")

training <- read.csv("pml-training.csv", na.strings = c("NA", "")); training.NAlist <- grep("NA", training); training <- select(training, -training.NAlist)
testing <- read.csv("pml-testing.csv", na.strings = c("NA", "")); testing.NAlist <- grep("NA", testing); testing <- select(testing, -testing.NAlist)

training[,-length(training)] <- data.frame(sapply(training[,-length(training)], as.numeric))
testing[,-length(testing)] <- data.frame(sapply(testing[,-length(testing)], as.numeric))

modFit <- train(classe ~ ., method = "rf", data = training[,-c(1,2)]); saveRDS(modFit, "mySavedModel001.rds")
modFit2 <- train(classe ~ ., method = "nb", data = training[,-c(1,2)]); saveRDS(modFit, "mySavedModel002.rds")
modFit3 <- randomForest(classe ~ ., data = training[,-c(1,2)]); saveRDS(modFit3, "mySavedModel003.rds")
modFit3

answers1 <- predict(modFit1, testing[,-c(1,2,length(testing))])
answers2 <- predict(modFit2, testing[,-c(1,2,length(testing))])
answers3 <- predict(modFit3, testing[,-c(1,2,length(testing))])

