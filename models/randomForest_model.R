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
iris.RFtree = randomForest(Species ~ ., data=iris.train, importane=T, proximity =TRUE, ntree=100)
#importane:T 顯示重要變數,proximity =TRUE 預測品種的機率值,ntree=300 300棵樹(抽樣次數,看資料多少)
print(iris.RFtree )

#變數重要性
(round(importance(iris.RFtree ),2))

#訓練樣本的混淆矩陣(confusion matrix)與預測正確率
table.rf=iris.RFtree$confusion
cat("CORRECTION RATIO(train)=", sum(diag(table.rf)/sum(table.rf))*100,"%\n")

#測試樣本的混淆矩陣(confusion matrix)與預測正確率
y = iris$Species[-sample_Index]
y_hat = predict(iris.RFtree ,newdata=iris.test)
table.test=table(y,y_hat)
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")


#分群模型
(iris.clutRF=randomForest(iris[,-5]))

#繪圖 Multi-Dimension plot 
MDSplot(iris.clutRF,iris$Species)
