# �Q�νu�Ϭ��Ͷ�
years <- sort(round(runif(10,2000,2010),0))
newbornbaby <- sort(round(runif(10,200,1000),0))
dt <- data.frame(newbornbaby,years)

par(mfrow=c(3,2)) #�b�@�i�e���W��X3*2�ӹϫ�
plot(newbornbaby ~ years , data=dt, type='l', col=1) #�u�e�u
plot(newbornbaby ~ years , data=dt, type='b', col=2) #�e�u�P�I
plot(newbornbaby ~ years , data=dt, type='c', col=3) #��'b'���ϥh�I
plot(newbornbaby ~ years , data=dt, type='h', col=4) #�����u
plot(newbornbaby ~ years , data=dt, type='s', col=5) #�����