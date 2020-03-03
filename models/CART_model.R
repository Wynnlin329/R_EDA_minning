#���JC50 churn��ƶ�
churn <- read.csv("C:\\Users\\summe\\OneDrive\\���\\R\\DM\\data\\churn.csv", header=T)
churnTrain <- read.csv("C:\\Users\\summe\\OneDrive\\���\\R\\DM\\data\\churnTrain.csv", header=T)
#�ҫ��V�m
data_train = churnTrain[,-3]  # �ư� "area_code"���
churn.tree=rpart(churn~.,data=data_train)
churn.tree

# ø�sCART�M����
plot(churn.tree)
text(churn.tree,cex = .8) #cex���ܦr��j�p

# �ܼƭ��n��
churn.tree$variable.importance

#�V�m�˥����V�c�x�}(confusion matrix)�P�w�����T�v
y = churnTrain$churn
y_hat=predict(churn.tree,newdata=churnTrain,type="class")
table.train=table(y,y_hat)
#�w�����T�v = �x�}�﨤�﨤�`�M / �x�}�`�M
cat("Correct Classification Ratio(train)=", sum(diag(table.train))/sum(table.train)*100,"%\n")

#���ռ˥����V�c�x�}(confusion matrix)�P�w�����T�v
y = churnTest$churn
y_hat=predict(churn.tree,newdata=churnTest,type="class")
table.test=table(y,y_hat)
#�w�����T�v = �x�}�﨤�﨤�`�M / �x�}�`�M 
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")

#ø�s Gain Chart & Lift Chart
setwd("c:/R_WORK")
source('Gain_lift_Chart.r', encoding = 'Big5') #�Ѯv�g��UDF
y = ifelse(churnTest$churn=='yes',1,0) #�O�o�n�⥿���ন1�A�t���ন0
y_hat=predict(churn.tree,newdata=churnTest,type="class")   
y_prob = predict(churn.tree,newdata=churnTest,type="prob") #�w���y�����v

#�I�s�Ѯv�g��UDF
DT =Gain_Lift_Chart(y,y_hat,y_prob) 
par(mfrow = c(1, 2))
# Gain Chart
plot(DT$row_index, DT$target_rto, xlab = "����H�Ʋֿn�ʤ���",  ylab = "���ҤH�Ʋֿn�ʤ���" ,type = "l", main = "Gain 
Chart")
#Lift Chart
plot(DT$row_index, DT$lift, xlab = "����H�Ʋֿn�ʤ���", ylab = "Lift",type = "l", main = "Lift Chart")

# ���ռ˥�����
y_prob = predict(churn.tree,newdata=churnTest,type="prob")[,1] #�����ҹw�����v
# ROC Curve
install.packages("ROCR")
library(ROCR)
pred <- prediction(y_prob, labels = churnTest$churn)
# tpr: True Positive Ratio ���T�w������;
# fpr: False Positive Ration�~�P������
perf <- performance(pred, "tpr", "fpr") 
plot(perf)
points(c(0,1),c(0,1),type="l",lty=2)  #�e��u
#AUC
perf <- performance(pred, "auc")
( AUC = perf@y.values[[1]] )
( Gini = (AUC-0.5) *2 )*100

# Iift chart
perf <- performance(pred, "lift" , "rpp") 
plot(perf)

# ���J UDF: Gain_lift_Chart
source('Lorenz_Curve.r', encoding = 'Big5')  #�Ѯv�g��UDF
# ���ռ˥�����
y_p = ifelse(churnTest$churn=='yes',1,0) 
y_n = ifelse(churnTest$churn=='yes',0,1)
y_prob = predict(churn.tree,newdata=churnTest,type="prob") #�w���y�����v
# ø�s�ϫ�
DT_l =Lorenz_Curve(y_p,y_n,y_prob) 
par(mfrow=c(1,1))
# ø�s Lorenz Curve 
plot(DT_l$target_rto,DT_l$nontarget_rto , xlab = "�ϨҤH�Ʋֿn�ʤ���", ylab = "���ҤH�Ʋֿn�ʤ���" ,type = "l", main = "Lorenz Curve ")
points(c(0,1),c(0,1),type="l",lty=2)  #�e��u








