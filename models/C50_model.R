#�V�m�˥�70%, ���ռ˥�30%
install.packages("caret")
library(caret)#caret �i�H���A�b���˥����ɭԡA�S�x���|��
sample_Index <- createDataPartition(y=iris$Species,p=0.7,list=FALSE)#list:�M��榡

iris.train=iris[sample_Index,]
iris.test=iris[-sample_Index,]

#�T�{�V�m�˥��P���ռ˥����G�@�P
par(mfrow=c(1,1)) 
#��R��ø�ϵ������Φ� 1 X 2 �����
plot(iris.train$Species)
plot(iris.test$Species)

#�ҫ��V�m
iris.C50tree=C5.0(Species~ . ,data=iris.train)
summary(iris.C50tree)
plot(iris.C50tree)

#�ҫ����� 
#�V�m�˥����V�c�x�}(confusion matrix)�P�w�����T�v
y = iris$Species[sample_Index]
y_hat= predict(iris.C50tree,iris.train,type='class')
table.train=table(y,y_hat)
cat("Total records(train)=",nrow(iris.train),"\n")
#�w�����T�v = �x�}�﨤�﨤�`�M / �x�}�`�M
cat("Correct Classification Ratio(train)=", 
      sum(diag(table.train))/sum(table.train)*100,"%\n")
#���ռ˥����V�c�x�}(confusion matrix)�P�w�����T�v
y = iris$Species[-sample_Index]
y_hat= predict(iris.C50tree,iris.test,type='class')#class:��r
table.test=table(y,y_hat)
cat("Total records(test)=",nrow(iris.test),"\n")
cat("Correct Classification Ratio(test)=", 
sum(diag(table.test))/sum(table.test)*100,"%\n")
