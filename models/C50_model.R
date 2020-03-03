#訓練樣本70%, 測試樣本30%
install.packages("caret")
library(caret)#caret 可以讓你在切樣本的時候，特徵不會變
sample_Index <- createDataPartition(y=iris$Species,p=0.7,list=FALSE)#list:清單格式

iris.train=iris[sample_Index,]
iris.test=iris[-sample_Index,]

#確認訓練樣本與測試樣本分佈一致
par(mfrow=c(1,1)) 
#讓R的繪圖視窗切割成 1 X 2 的方塊
plot(iris.train$Species)
plot(iris.test$Species)

#模型訓練
iris.C50tree=C5.0(Species~ . ,data=iris.train)
summary(iris.C50tree)
plot(iris.C50tree)

#模型成效 
#訓練樣本的混淆矩陣(confusion matrix)與預測正確率
y = iris$Species[sample_Index]
y_hat= predict(iris.C50tree,iris.train,type='class')
table.train=table(y,y_hat)
cat("Total records(train)=",nrow(iris.train),"\n")
#預測正確率 = 矩陣對角對角總和 / 矩陣總和
cat("Correct Classification Ratio(train)=", 
      sum(diag(table.train))/sum(table.train)*100,"%\n")
#測試樣本的混淆矩陣(confusion matrix)與預測正確率
y = iris$Species[-sample_Index]
y_hat= predict(iris.C50tree,iris.test,type='class')#class:文字
table.test=table(y,y_hat)
cat("Total records(test)=",nrow(iris.test),"\n")
cat("Correct Classification Ratio(test)=", 
sum(diag(table.test))/sum(table.test)*100,"%\n")

