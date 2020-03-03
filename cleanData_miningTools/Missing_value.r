install.packages("mice")#�w�� mice �M��
library(mice)#���J mice �M��

#�H�����Ϳ�|��
install.packages("missForest") #�w�˲��Ϳ�|�ȮM��
library(missForest)

data <- prodNA(iris, noNA = 0.05)#�bIris ��Ƥ��H������5%��|��
complete.cases(data)# ��@����ƬO���㪺�A�^��TRUE�F��@����Ʀ���|�ȡA�^��FALSE

#�˵���|��
summary(data)
md.pattern(data)


#�ϧΤ��˵���|��
install.packages("VIM") #�w�˹ϧ��˵���|�ȮM��
library(VIM) #���J�ϧ��˵���|�ȮM��
aggr_plot <- aggr(data, col = c('navyblue', 'red'), numbers=TRUE, sortVars=TRUE, 
                    labels=names(data), cex.axis=.7, gap=3, 
                    ylab=c("Histogram of missing data", "Pattern"))
#�R���Ҧ���|�ȸ��
new_data <- data[complete.cases(data), ]

#�Q�θ�Ʊ��ɼҫ��Ө��N��|��

mice.data <- mice(data,
                  m = 3,                     # ���ͤT�ӿ�|�ȳQ��ɦn����ƪ�
                  maxit = 30,            # �̤j�|�N��max iteration
                  method = "cart",  # �ϥ�CART�M����A�i���|�ȹw��
                  seed = 188)           # �O��˨C�����@��

new_data1 <- complete(mice.data, 1) #�Ĥ@�ӵ��G
new_data2 <- complete(mice.data, 2) #�ĤG�ӵ��G
new_data3 <- complete(mice.data, 3) #�ĤT�ӵ��G

Training_data_set <- new_data2 #��βĤG�ӵ��G�ӷ��ҫ��V�m��ƶ�
kmeans(Training_data_set[-5] , nstart=20, centers=5) #�]���s�t��k
mice.data <- mice(data,
                    m = 3,                     # ���ͤT�ӿ�|�ȳQ��ɦn����ƪ�
                    maxit = 30,            # �̤j�|�N��max iteration
                    method = " rf ",      # �ϥ��H���˪L�A�i���|�ȹw��
                    seed = 188)           # �O��˨C�����@��

# �ϥ��H���˪L�A�i���|�ȹw��
mice.data <- mice(data,
                    m = 1, 
                    maxit = 30,            
                    method = "rf",  
                    seed = 188)

new_data1 <- complete(mice.data, 1) 


summary(data)
summary(new_data1 )

kmeans(new_data1 [-5] , nstart=20, centers=5)
