iris_new <- iris[, -5]
set.seed(123)
Cluster_km <- kmeans(iris_new, nstart=15,centers=4) # center就是設定群數
# nstart 是指重新隨意放 k 個中心點的次數, 一般建議 nstart >= 10
table(Cluster_km$cluster, iris[, 5])#觀察分群結果與實際類別的差別

plot(iris_new $Petal.Width, iris_new $Petal.Length, col=Cluster_km$cluster)
Cluster_km

#最佳的分群數 K 如何決定？
WSS_ratio <- rep(NA, times = 10)
for (k in 1:length(WSS_ratio)) 
{
  Cluster_km <- kmeans(iris_new, nstart=15,centers=k)     
  WSS_ratio[k] <- Cluster_km$tot.withinss
}
#畫陡坡圖
plot(WSS_ratio, type="b", main = "陡坡圖")
