# input data
setwd("c:/R_WORK")
x=read.table("NaiveBayes_MailLoan.csv", header=T, sep=",")
install.packages("klaR") #  �w�ˤu�@�]
library(klaR)
#�ؼ�
fit_Bayes1=NaiveBayes(�ӿ�U��~.,x[,-1])
#�d�ݼҫ�
fit_Bayes1
#�w���ҫ�
pre_Bayes1=predict(fit_Bayes1,x[,-1])
pre_Bayes1
table(x$�ӿ�U��,pre_Bayes1$class)
#  �V�c�x�}
message("�ǽT�סG",sum(diag(table(x$�ӿ�U��,pre_Bayes1$class))) / sum(table(x$�ӿ�U��,pre_Bayes1$class)) *100,"%")