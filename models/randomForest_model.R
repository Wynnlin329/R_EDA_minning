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
iris.RFtree = randomForest(Species ~ ., data=iris.train, importane=T, proximity =TRUE, ntree=100)
#importane:T ��ܭ��n�ܼ�,proximity =TRUE �w���~�ت����v��,ntree=300 300�ʾ�(��˦���,�ݸ�Ʀh��)
print(iris.RFtree )

#�ܼƭ��n��
(round(importance(iris.RFtree ),2))

#�V�m�˥����V�c�x�}(confusion matrix)�P�w�����T�v
table.rf=iris.RFtree$confusion
cat("CORRECTION RATIO(train)=", sum(diag(table.rf)/sum(table.rf))*100,"%\n")

#���ռ˥����V�c�x�}(confusion matrix)�P�w�����T�v
y = iris$Species[-sample_Index]
y_hat = predict(iris.RFtree ,newdata=iris.test)
table.test=table(y,y_hat)
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")


#���s�ҫ�
(iris.clutRF=randomForest(iris[,-5]))

#ø�� Multi-Dimension plot 
MDSplot(iris.clutRF,iris$Species)