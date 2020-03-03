install.packages("C50")
library(C50)
data(churn)
churn <- read.csv("C:\\Program Files\\R\\R-3.6.2\\library\\C50\\data\\churn.csv", header=T)
churnTrain <- read.csv("C:\\Program Files\\R\\R-3.6.2\\library\\C50\\data\\churnTrain.csv", header=T)
data <- churnTrain[,c(-1,-3,-4,-5,-20)] # 不要第1, 3, 4, 5, 20欄(文字都排掉 )
pca_Traindt <- princomp( data , cor=T) # cor=T 單位不同
summary(pca_Traindt)
screeplot(pca_Traindt,type="lines") # 繪製陡坡圖
print(pca_Traindt$loadings, digits = 8, cutoff=0)  #cutoff=0表示接近0也要顯示

p <- predict(pca_Traindt) #直接算出主成分
head(p,5)
head(p[,c(1:7)],5) #取出7個主成分，轉為NEW_data就可以帶進去模型，EX:new_data = p[,c(1:7)]
 