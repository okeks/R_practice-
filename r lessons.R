summary(segmentationOriginal)
str(segmentationOriginal)
dim(segmentationOriginal)
segData <- subset(segmentationOriginal, Case == "Train")
cellID <- segData$Cell
class <- segData$Class
case <- segData$Case
segData <- segData[, -(1:3)]
names(segData)
statusColNum <- grep("Status", names(segData))
statusColNum
segData <- segData[, -statusColNum]

library(e1071)
# skewness for one predictor
skewness(segData$AngleCh1)
??skewness
?apply
skewValues <- apply(segData, 2, skewness)
head(skewValues)
?hist
hist(segData$AreaCh1 ,plot = TRUE)
library(caret)
Ch1AreaTrans <- BoxCoxTrans(segData$AreaCh1) # This finds the appropriate transformation and applies them to the new data
Ch1AreaTrans$lambda
playing <- segData[1:4,1:4]

newones <- for(i in 1:ncol(playing)){
     BoxCoxTrans(playing[,i])$lambda   
}
newones
predict(Ch1AreaTrans,head(segData$AreaCh1))
# The original Data
 head(segData$AreaCh1)
 # After transformation
 predict(Ch1AreaTrans, head(segData$AreaCh1))
 #Another preprocess one, can be used for PCA)
 pcaObject <- prcomp(segData,center = TRUE, scale. = TRUE)
 pcaObject
 # Calculate the cumulative percentage of variance which each component
# accounts for.
 percentVariance <- pcaObject$sd^2/sum(pcaObject$sd^2)*100
 percentVariance[1:3]
 head(pcaObject$x[, 1:5])
 head(pcaObject$rotation[, 1:3])  #stores the variable loadings, where rows correspond to predictor variables and columns are associated with the components:
 head(pcaObject$rotation[,])
 spatialSign(segData)
 segData
 trans <- preProcess(segData,method = c("BoxCox", "center", "scale", "pca"))
 trans
 # Apply the transformations:
transformed <- predict(trans, segData) 
 head(transformed[, 1:5])
 #testing for nearzero variance
 nearZeroVar(segData)

 #filter on between correlations
 #calculating correlations between predictor variables 
 correlations <- cor(segData)
 correlations[1:5,1:5]

 #to visually examine correlation structure
 library(corrplot)
 corrplot(correlations, order = "hclust")
 
 #lets find the highly correlated predictors in our dataset
 highcorr <- findCorrelation(correlations,cutoff = 0.75)
 length(highcorr)
 ?paste
 #delecting from segdata
 filteredSegdata <- segData[,-highcorr]
 pairs(visuals, main="Scatterplot Matrix") # equivalent to plot(vISUALS)
 
 library(caret)
 data(cars)
levels(cars) 
library(mlbench)
data(Glass)
str(Glass)
#using visualization to understand predictor variables 
visuals <- Glass[,1:9]
dim(visuals)
ncol(visuals)
hist(visuals[,3])
for (i in 1:ncol(visuals)){
        hist(visuals[,i], xlab = names(visuals[i]), main = paste(names(visuals[i]), "Histogram"), col="green")  
}
visuals <- Glass[,1:9]
par(mfrow = c(3, 3))
for (i in 1:ncol(visuals)) {
        boxplot(visuals[ ,i], ylab = names(visuals[i]), horizontal=T,
                main = paste(names(visuals[i]), "Boxplot"), col="green")
}
?density
library(car)
summary(powerTransform(Glass[,1:9], family="yjPower"))$result[,1:2]
for(i in 1:ncol(visuals)){
        play <- summary(BoxCoxTrans(visuals[,i])$lambda)
} 

play
library(car)
summary(powerTransform(Glass[,1:9], family="yjPower"))$result[,1:2]

library(mlbench)
data(Soybean)
str(Soybean)
 
soybeanData <- Soybean[,2:36] 
library(VIM)
aggr(Soybean, prop = c(T, T), bars=T, numbers=T, sortVars=T)

library(AppliedPredictiveModeling)
data(twoClassData)
str(predictors)
str(classes)

#setting the random number seed so we can reproduce the results
set.seed(1)
# setting list to False so that the returned value returns a matrix row of numbers is generated 
library(caret)
trainingRows <- createDataPartition(classes,p = .80, list= FALSE)
head(trainingRows)
nrow(trainingRows)
#subset the data into objects for training 
trainPredictors <- predictors[trainingRows,]
trainClasses <- classes[trainingRows]
# LETS DO THE REMAINING FOR THE REMAINING 20%
testPredictors <- predictors[-trainingRows,]
testClasses <- classes[-trainingRows]
str(trainPredictors)
str(testPredictors)

###Resampling 
# To generate multiple splits, the function createDataPartition can be used with an additional argument (times)
set.seed(1)
# To generate the information needed for three resampled versions of the training set
repeatedSplits <- createDataPartition(trainClasses,p = .80, times = 3)
str(repeatedSplits)
# using the createFolds function we can create K-fold cross validation
set.seed(1)
cvSplits <- createFolds(trainClasses, k = 10, returnTrain = TRUE)
str(cvSplits)
#getting the first set of row numbers 
fold1 <- cvSplits[[1]]
fold1
cvPredictors1 <- trainPredictors[fold1,]
cvClasses1 <- trainClasses[fold1]
nrow(trainPredictors)
nrow(cvPredictors1)
# For knn3, we can estimate the 5-nearest Neighbor with
trainPredictors <- as.matrix(trainPredictors)
knnFit <- knn3(x = trainPredictors, y=trainClasses, k=5)
knnFit
# To assign new samples to classes, the predict method is used with the model object, The standard convention is
testPredictions <- predict(knnFit, newdata = testPredictors, type = "class")
head(testPredictions)
library(caret)
data("GermanCredit")
data(GermanCreditTrain)
data("GermanCreditTest")

str(GermanCredit)
set.seed(1056)
svmFit <- train(Class ~ ., data = GermanCreditTrain, method= "svmRadial", preProc = c('center','scale'))

library(AppliedPredictiveModeling)
data(ChemicalManufacturingProcess)











library(caret)
data(oil)
str(oilType)
tb = round(table(oilType) / 96, 2)
barchart(tb, horizontal = F, main = 'Percentage Distribution of in original samples')

sampNum = 60
set.seed(23123)
list_table = vector(mode="list",length=30)
length(list_table)
for(i in 1:length(list_table))
        list_table[[i]] = round(table(sample(oilType,size = sampNum))/60,2)
        
barchart(list_table[[1]], horizontal = F, main = 'Percentage distribution in random sample- 1')     
        
        
        
        
        
        
























  