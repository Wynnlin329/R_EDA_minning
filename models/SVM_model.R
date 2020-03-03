install.packages("e1071")
library(e1071)
data(iris)
data <- iris
# 玻ネ家籔代刚妓セ
n=0.3*nrow(data)
test.index=sample(1:nrow(data),n)
Train=data[-test.index,]
Test=data[test.index,]
# 家
svm = svm(Species ~ . ,data=Train)
summary(svm)
# 代刚妓セ箇代タ絋瞯
Ypred = predict(svm, Test)
#  睼瞔痻皚 (箇代瞯Τ93.33%)
message("非絋",sum(diag(table(Test$Species,Ypred))) / sum(table(Test$Species,Ypred)) *100,"%")

