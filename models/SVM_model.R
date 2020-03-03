install.packages("e1071")
library(e1071)
data(iris)
data <- iris
# ���ͫؼһP���ռ˥�
n=0.3*nrow(data)
test.index=sample(1:nrow(data),n)
Train=data[-test.index,]
Test=data[test.index,]
# �ؼ�
svm = svm(Species ~ . ,data=Train)
summary(svm)
# ���ռ˥��w�����T�v
Ypred = predict(svm, Test)
#  �V�c�x�} (�w���v��93.33%)
message("�ǽT�סG",sum(diag(table(Test$Species,Ypred))) / sum(table(Test$Species,Ypred)) *100,"%")
