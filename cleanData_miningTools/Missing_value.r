install.packages("mice")#安裝 mice 套件
library(mice)#載入 mice 套件

#隨機產生遺漏值
install.packages("missForest") #安裝產生遺漏值套件
library(missForest)

data <- prodNA(iris, noNA = 0.05)#在Iris 資料中隨機產生5%遺漏值
complete.cases(data)# 當一筆資料是完整的，回傳TRUE；當一筆資料有遺漏值，回傳FALSE

#檢視遺漏值
summary(data)
md.pattern(data)


#圖形化檢視遺漏值
install.packages("VIM") #安裝圖形檢視遺漏值套件
library(VIM) #載入圖形檢視遺漏值套件
aggr_plot <- aggr(data, col = c('navyblue', 'red'), numbers=TRUE, sortVars=TRUE, 
                    labels=names(data), cex.axis=.7, gap=3, 
                    ylab=c("Histogram of missing data", "Pattern"))
#刪除所有遺漏值資料
new_data <- data[complete.cases(data), ]

#利用資料探勘模型來取代遺漏值

mice.data <- mice(data,
                  m = 3,                     # 產生三個遺漏值被填補好的資料表
                  maxit = 30,            # 最大疊代數max iteration
                  method = "cart",  # 使用CART決策樹，進行遺漏值預測
                  seed = 188)           # 令抽樣每次都一樣

new_data1 <- complete(mice.data, 1) #第一個結果
new_data2 <- complete(mice.data, 2) #第二個結果
new_data3 <- complete(mice.data, 3) #第三個結果

Training_data_set <- new_data2 #選用第二個結果來當成模型訓練資料集
kmeans(Training_data_set[-5] , nstart=20, centers=5) #跑分群演算法
mice.data <- mice(data,
                    m = 3,                     # 產生三個遺漏值被填補好的資料表
                    maxit = 30,            # 最大疊代數max iteration
                    method = " rf ",      # 使用隨機森林，進行遺漏值預測
                    seed = 188)           # 令抽樣每次都一樣

# 使用隨機森林，進行遺漏值預測
mice.data <- mice(data,
                    m = 1, 
                    maxit = 30,            
                    method = "rf",  
                    seed = 188)

new_data1 <- complete(mice.data, 1) 


summary(data)
summary(new_data1 )

kmeans(new_data1 [-5] , nstart=20, centers=5)
