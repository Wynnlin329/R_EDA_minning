install.packages('C50')
library(C50)
?(churn)
data(churn)
churn <- read.csv("C:\\Program Files\\R\\R-3.6.2\\library\\C50\\data\\churn.csv", header=T)
churnTrain <- read.csv("C:\\Program Files\\R\\R-3.6.2\\library\\C50\\data\\churnTrain.csv", header=T)
str(churnTrain)

