#�Y�ө��W�P�C�Ѫ���~�B
x <- c(85,34,55,62,63,68,76)
mean(x)  #������
range(x) #�նZ�d��
median(x) #�����
sd(x) #�зǮt
var(x) #�ܲ���
sd(x)^2 #�зǮt������
max(x) #�̤j��
min(x) #�̤p��
quantile(x) #�����, 50%����m�O63


#�s�@�ൣ���˸��
High <- c( 120, 134, 110, 158, 100, 101, 140, 105)
Weight <- sample(20:28,8)
cor(High,Weight)  #�����Y��

# �ϥΪŮ�~���� airquality
data(airquality)
head(airquality,6)

cor(airquality[,1:4], use = "pairwise") #pairwise���X�������������Y�Ưx�}

pairs(airquality[,1:4]) #ø��