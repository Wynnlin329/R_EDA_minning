#餘弦相似度 (COSINE)
#下面的數據實際上是故意選擇了一個完美的線性關係：y = 0.10 + 0.01 x
# 所以相關係數 = 1
x <- c(1,2,3,5,8)
y <- c(0.11,0.12,0.13,0.15,0.18)
a <- matrix(c(x,y),c(5,2)) #5*2矩陣
a
#餘弦函數 = 0.921
# consine = xy /(||x|| * ||y||)
cos_sita_xy <- ( a[,1] %*% a[,2] ) /  
    ( sum(a[,1]^2)^0.5 * sum(a[,2]^2)^0.5)
#相關係數 = 1
cor(a[,1],a[,2])