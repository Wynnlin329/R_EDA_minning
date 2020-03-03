# input data
setwd("c:/R_WORK")
x=read.table("NaiveBayes_MailLoan.csv", header=T, sep=",")
install.packages("klaR") #  杆
library(klaR)
#家
fit_Bayes1=NaiveBayes(ビ快禪蹿~.,x[,-1])
#琩家
fit_Bayes1
#箇代家
pre_Bayes1=predict(fit_Bayes1,x[,-1])
pre_Bayes1
table(x$ビ快禪蹿,pre_Bayes1$class)
#  睼瞔痻皚
message("非絋",sum(diag(table(x$ビ快禪蹿,pre_Bayes1$class))) / sum(table(x$ビ快禪蹿,pre_Bayes1$class)) *100,"%")