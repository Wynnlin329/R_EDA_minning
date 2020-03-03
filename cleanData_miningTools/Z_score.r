# scale參數 center=T表示用平均值計算，scale=Ｔ表示除以標準差
data <- c(1, 2, 3, 6, 3)
scale(data, center=T,scale=T)
tmp <- c(2,3,8,NA,4,NA,9,12,NA)     
is.na(tmp)
