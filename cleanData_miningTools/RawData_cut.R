# �ǳƸ��
data(chickwts)
str(chickwts)
table(chickwts$feed)

#�N��� by feed����6�p�s
splt1 = split(chickwts$weight, chickwts$feed)
splt1

# �Ϋ��Ш�U��Ƥ���
chickwts[,2] #��Ƶ��ƥ��n, ���u�n�ĤG��

chickwts[1,] #�u���@����ơA�������n

#�f�tsample�禡�H�����θ��    # replace���ᤣ��^
chickwts[ sample(1:nrow(chickwts) ,5, replace= F), ] #�H����5����ơA�������n


#�޿��
#�s�@�ൣ���˸��
High <- c( 120, 134, 110, 158, 100, 101, 140, 105)
Weight <- sample(20:25,8,replace = TRUE)
Gender <- c("�k", "�k", "�k", "�k", "�k", "�k", "�k", "�k")

High > 130
High[High > 130] #�Q���D����130�H�W����������
Gender[High >130] #�Q���D����130�H�W���ʧO����

report <- data.frame(High, Weight, Gender)
boy.pass <- report[Gender == "�k" & High>130 , ] #�D�鶴���j��130���k��
boy.pass


#�ϥ� rownames�������α���
iris
rownames(iris)

#����rownames�O7�����ƪ��[���
iris[ as.integer(rownames(iris))%% 7 == 0, ]

# subset( �����Ϊ�����, ���α���, ���D��)
iris
subset(iris,  iris$Sepal.Length>7)

# subset( �����Ϊ�����, ���α���, ���D��)
iris
subset(iris,  iris$Sepal.Length>7, select= -Species)#-�N�O���n��

# subset( �����Ϊ�����, ���α���, ���D��)
iris
subset(iris,  iris$Sepal.Length>7, select= c(Sepal.Length, Species) )