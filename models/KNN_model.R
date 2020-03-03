install.packages("class")
library(class)
data(iris)
#(1)�]�w�üƺؤl
set.seed(123)
#(2)���o��Ƶ���
n <- nrow(iris)
#(3)���o�V�m�˥��ƪ�index�A70%�ؼҡA30%����
train_idx <- sample(seq_len(n), size = round(0.7 * n))
#(4)���X�V�m��ƻP���ո��
traindata <- iris[train_idx,]
testdata <- iris[ - train_idx,]
train_y <- traindata[,5]
test_y <- testdata[,5]
#(5)�]�wK�AK�q�`�i�H�]�w����Ƶ��ƪ������
k_set <- as.integer(sqrt(n)) 
#(6)�إ߼ҫ�
pred <- knn(train = traindata[-5], test = testdata[-5], cl = train_y, k = k_set)
#(7) �V�c�x�}�p��ǽT��
message("�ǽT�סG",sum(diag(table(test_y,pred))) / sum(table(test_y,pred)) *100,"%")#diag�׹﨤










