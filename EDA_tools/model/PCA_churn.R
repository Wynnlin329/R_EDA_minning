install.packages("C50")
library(C50)
data(churn)
churn <- read.csv("C:\\Program Files\\R\\R-3.6.2\\library\\C50\\data\\churn.csv", header=T)
churnTrain <- read.csv("C:\\Program Files\\R\\R-3.6.2\\library\\C50\\data\\churnTrain.csv", header=T)
data <- churnTrain[,c(-1,-3,-4,-5,-20)] # ���n��1, 3, 4, 5, 20��(��r���Ʊ� )
pca_Traindt <- princomp( data , cor=T) # cor=T ��줣�P
summary(pca_Traindt)
screeplot(pca_Traindt,type="lines") # ø�s�~�Y��
print(pca_Traindt$loadings, digits = 8, cutoff=0)  #cutoff=0���ܱ���0�]�n���

p <- predict(pca_Traindt) #������X�D����
head(p,5)
head(p[,c(1:7)],5) #���X7�ӥD�����A�ରNEW_data�N�i�H�a�i�h�ҫ��AEX:new_data = p[,c(1:7)]
 