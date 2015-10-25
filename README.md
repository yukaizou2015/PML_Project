# Practical Machine Learning - Course Project

## Background
Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. These type of devices are part of the quantified self movement ? a group of enthusiasts who take measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. One thing that people regularly do is quantify how much of a particular activity they do, but they rarely quantify how well they do it. In this project, your goal will be to use data from accelerometers on the belt, forearm, arm, and dumbell of 6 participants. They were asked to perform barbell lifts correctly and incorrectly in 5 different ways. More information is available from the website here: <http://groupware.les.inf.puc-rio.br/har> (see the section on the Weight Lifting Exercise Dataset). 

## Data
The training data for this project are available here: <https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv>
The test data are available here: <https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv>
The data for this project come from this source: <http://groupware.les.inf.puc-rio.br/har>.

## What is contained in this repository
- project_analysis.R: the original codes for fitting and selecting the models and make predictions.
- report.Rmd: the R markdown file of the final report.
- report.html: the html file of the final report.
- pml-testing.csv: the testing dataset
- pml-testing_processed.csv: the testing dataset after cleaning
- pml-training.csv: the training dataset
- pml-training_processed.csv: the training dataset after cleaning
- pml-training_test.csv: the subset of testing data which was used for cross validation
- pml-training_train.csv: the subset of training data which was used for cross validation
- pml\_write\_files.R: the codes for creating files which contain answers for the 20 predictions
- problem\_answers: the subdirectory containing the 20 files created through pml\_write\_files.R.