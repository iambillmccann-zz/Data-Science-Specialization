library(dplyr)
library(caret)

pml_write_files = function(x){
    n = length(x)
    for(i in 1:n){
        filename = paste0("E:\Users\Bill\Documents\GitHub\Machine Learning\Prediction Files\problem_id_",i,".txt")
        write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
    }
}

prediction = predict(modelFitRF, testing)
answers = data.frame(prediction, testing$X)
pml_write_files(answers)