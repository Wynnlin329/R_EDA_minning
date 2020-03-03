#SQL語法處理資料
install.packages("sqldf")
library(sqldf)
sqldf("SELECT * FROM iris")
sqldf("SELECT Species,count(*)as cnt FROM iris group by Species")

# sqldf的結果回傳是data.frame
class( sqldf("SELECT Species,count(*)as cnt FROM iris group by 
Species") )

sqldf("SELECT Species,count(*)as cnt FROM iris group by Species")

#取最大值、最小值與平均值
sqldf("SELECT max([Sepal.Length]), min([Sepal.Length]), 
avg([Sepal.Length])  FROM iris" )






