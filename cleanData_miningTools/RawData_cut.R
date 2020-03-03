# 準備資料
data(chickwts)
str(chickwts)
table(chickwts$feed)

#將資料 by feed分成6小群
splt1 = split(chickwts$weight, chickwts$feed)
splt1

# 用指標協助資料切割
chickwts[,2] #資料筆數全要, 但只要第二欄

chickwts[1,] #只取一筆資料，但欄位全要

#搭配sample函式隨機切割資料    # replace取後不放回
chickwts[ sample(1:nrow(chickwts) ,5, replace= F), ] #隨機取5筆資料，但欄位全要


#邏輯值
#製作兒童健檢資料
High <- c( 120, 134, 110, 158, 100, 101, 140, 105)
Weight <- sample(20:25,8,replace = TRUE)
Gender <- c("男", "女", "男", "男", "男", "女", "女", "女")

High > 130
High[High > 130] #想知道身高130以上的身高分布
Gender[High >130] #想知道身高130以上的性別分布

report <- data.frame(High, Weight, Gender)
boy.pass <- report[Gender == "男" & High>130 , ] #挑選身高大於130的男童
boy.pass


#使用 rownames做為切割條件
iris
rownames(iris)

#切割rownames是7的倍數的觀察值
iris[ as.integer(rownames(iris))%% 7 == 0, ]

# subset( 欲切割的物件, 切割條件, 欄位挑選)
iris
subset(iris,  iris$Sepal.Length>7)

# subset( 欲切割的物件, 切割條件, 欄位挑選)
iris
subset(iris,  iris$Sepal.Length>7, select= -Species)#-就是不要的

# subset( 欲切割的物件, 切割條件, 欄位挑選)
iris
subset(iris,  iris$Sepal.Length>7, select= c(Sepal.Length, Species) )