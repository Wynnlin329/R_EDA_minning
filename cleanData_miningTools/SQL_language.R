#SQL�y�k�B�z���
install.packages("sqldf")
library(sqldf)
sqldf("SELECT * FROM iris")
sqldf("SELECT Species,count(*)as cnt FROM iris group by Species")

# sqldf�����G�^�ǬOdata.frame
class( sqldf("SELECT Species,count(*)as cnt FROM iris group by 
Species") )

sqldf("SELECT Species,count(*)as cnt FROM iris group by Species")

#���̤j�ȡB�̤p�ȻP������
sqldf("SELECT max([Sepal.Length]), min([Sepal.Length]), 
avg([Sepal.Length])  FROM iris" )





