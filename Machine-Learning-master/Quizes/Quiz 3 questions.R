setwd("~/GitHub/Machine Learning")

# Question 1.

library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
library(rattle)
library(dplyr)

set.seed(125)
inTrain = createDataPartition(segmentationOriginal$Case, p=0.6)[[1]]

training = segmentationOriginal %>% filter(Case == "Train")
testing = segmentationOriginal %>% filter(Case == "Test")
modFit = train(Class ~ ., method="rpart", data=training)
print(modFit$finalModel)

plot(modFit$finalModel, uniform=TRUE, main="Classification Tree")
text(modFit$finalModel, use.n=TRUE, all=TRUE, cex=.8)

# Question 4

library(ElemStatLearn)
data(SAheart)
# SAheart = SAheart %>% mutate(chd = as.factor(chd))
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

set.seed(13234)
modFit = glm(chd ~ age + alcohol + obesity + tobacco + typea + ldl, data=trainSA, family="binomial")
# modFit = train(chd ~ age + alcohol + obesity + tobacco + typea + ldl,data=trainSA, method="glm", family=binomial())

missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}

prediction = predict(modFit, testSA, type=c("response"))
missClass(testSA$chd, prediction)
prediction = predict(modFit, trainSA, type=c("response"))
missClass(trainSA$chd, prediction)
