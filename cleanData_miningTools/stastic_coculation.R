#某商店上周七天的營業額
x <- c(85,34,55,62,63,68,76)
mean(x)  #平均數
range(x) #組距範圍
median(x) #中位數
sd(x) #標準差
var(x) #變異數
sd(x)^2 #標準差的平方
max(x) #最大值
min(x) #最小值
quantile(x) #分位數, 50%的位置是63


#製作兒童健檢資料
High <- c( 120, 134, 110, 158, 100, 101, 140, 105)
Weight <- sample(20:28,8)
cor(High,Weight)  #相關係數

# 使用空氣品質資料 airquality
data(airquality)
head(airquality,6)

cor(airquality[,1:4], use = "pairwise") #pairwise產出兩兩相關的相關係數矩陣

pairs(airquality[,1:4]) #繪圖