#���G��
data(iris)
attach(iris)
plot(Petal.Length~Petal.Width, col=Species) #���G�ϫ��O

lmTrain <- lm(formula = Petal.Length ~ Petal.Width, data = iris) #²��j�k
abline(reg = lmTrain$coefficients, col = "red", lwd = 1) #���ø�s���U�u