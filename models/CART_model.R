#載入C50 churn資料集
churn <- read.csv("C:\\Users\\summe\\OneDrive\\文件\\R\\DM\\data\\churn.csv", header=T)
churnTrain <- read.csv("C:\\Users\\summe\\OneDrive\\文件\\R\\DM\\data\\churnTrain.csv", header=T)
#模型訓練
data_train = churnTrain[,-3]  # 排除 "area_code"欄位
churn.tree=rpart(churn~.,data=data_train)
churn.tree

# 繪製CART決策樹
plot(churn.tree)
text(churn.tree,cex = .8) #cex表示字體大小

# 變數重要性
churn.tree$variable.importance

#訓練樣本的混淆矩陣(confusion matrix)與預測正確率
y = churnTrain$churn
y_hat=predict(churn.tree,newdata=churnTrain,type="class")
table.train=table(y,y_hat)
#預測正確率 = 矩陣對角對角總和 / 矩陣總和
cat("Correct Classification Ratio(train)=", sum(diag(table.train))/sum(table.train)*100,"%\n")

#測試樣本的混淆矩陣(confusion matrix)與預測正確率
y = churnTest$churn
y_hat=predict(churn.tree,newdata=churnTest,type="class")
table.test=table(y,y_hat)
#預測正確率 = 矩陣對角對角總和 / 矩陣總和 
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")

#繪製 Gain Chart & Lift Chart
setwd("c:/R_WORK")
source('Gain_lift_Chart.r', encoding = 'Big5') #老師寫的UDF
y = ifelse(churnTest$churn=='yes',1,0) #記得要把正例轉成1，負例轉成0
y_hat=predict(churn.tree,newdata=churnTest,type="class")   
y_prob = predict(churn.tree,newdata=churnTest,type="prob") #預測流失機率

#呼叫老師寫的UDF
DT =Gain_Lift_Chart(y,y_hat,y_prob) 
par(mfrow = c(1, 2))
# Gain Chart
plot(DT$row_index, DT$target_rto, xlab = "全體人數累積百分比",  ylab = "正例人數累積百分比" ,type = "l", main = "Gain 
Chart")
#Lift Chart
plot(DT$row_index, DT$lift, xlab = "全體人數累積百分比", ylab = "Lift",type = "l", main = "Lift Chart")

# 測試樣本評分
y_prob = predict(churn.tree,newdata=churnTest,type="prob")[,1] #取正例預測機率
# ROC Curve
install.packages("ROCR")
library(ROCR)
pred <- prediction(y_prob, labels = churnTest$churn)
# tpr: True Positive Ratio 正確預測正例;
# fpr: False Positive Ration誤判為正例
perf <- performance(pred, "tpr", "fpr") 
plot(perf)
points(c(0,1),c(0,1),type="l",lty=2)  #畫虛線
#AUC
perf <- performance(pred, "auc")
( AUC = perf@y.values[[1]] )
( Gini = (AUC-0.5) *2 )*100

# Iift chart
perf <- performance(pred, "lift" , "rpp") 
plot(perf)

# 載入 UDF: Gain_lift_Chart
source('Lorenz_Curve.r', encoding = 'Big5')  #老師寫的UDF
# 測試樣本評分
y_p = ifelse(churnTest$churn=='yes',1,0) 
y_n = ifelse(churnTest$churn=='yes',0,1)
y_prob = predict(churn.tree,newdata=churnTest,type="prob") #預測流失機率
# 繪製圖型
DT_l =Lorenz_Curve(y_p,y_n,y_prob) 
par(mfrow=c(1,1))
# 繪製 Lorenz Curve 
plot(DT_l$target_rto,DT_l$nontarget_rto , xlab = "反例人數累積百分比", ylab = "正例人數累積百分比" ,type = "l", main = "Lorenz Curve ")
points(c(0,1),c(0,1),type="l",lty=2)  #畫虛線









