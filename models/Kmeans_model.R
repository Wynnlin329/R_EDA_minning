iris_new <- iris[, -5]
set.seed(123)
Cluster_km <- kmeans(iris_new, nstart=15,centers=4) # center�N�O�]�w�s��
# nstart �O�����s�H�N�� k �Ӥ����I������, �@���ĳ nstart >= 10
table(Cluster_km$cluster, iris[, 5])#�[����s���G�P������O���t�O

plot(iris_new $Petal.Width, iris_new $Petal.Length, col=Cluster_km$cluster)
Cluster_km

#�̨Ϊ����s�� K �p��M�w�H
WSS_ratio <- rep(NA, times = 10)
for (k in 1:length(WSS_ratio)) 
{
  Cluster_km <- kmeans(iris_new, nstart=15,centers=k)     
  WSS_ratio[k] <- Cluster_km$tot.withinss
}
#�e�~�Y��
plot(WSS_ratio, type="b", main = "�~�Y��")