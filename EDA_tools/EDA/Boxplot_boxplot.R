# �Q��churnTrain��ƶ�
boxplot(total_day_minutes, horizontal=TRUE, xlab="�դѳq�ܤ�����", 
          col="pink")
# ��ܥդѡB�ߤW�P�b�]���q�ܤ�����
dt <- data.frame(total_eve_minutes, total_night_minutes, 
                   total_day_minutes)
boxplot(dt, horizontal=TRUE, xlab="�q�ܤ�����", col="pink")

# ��ܥդѡB�ߤW�P�b�]���q�ܤ�����
boxplot(dt, horizontal=FALSE, xlab="�q�ܤ�����", 
          col=terrain.colors(3))
legend("topright", title="����������", c('eve','night','day'), 
         fill=terrain.colors(3), horiz=FALSE, ncol = 1, cex = 0.6)
# col=terrain.colors(3)��ܦa�y��3��
# �ϨҪ�nocl��������ơFcex����r���j�p

# ���ժ���Ž�ϡA�˵��b���P�a�Ϭy���Ȥ�P���y���Ȥ��ߤW�q�ܮɶ�������
boxplot(total_eve_minutes~area_code*churn,horizontal=FALSE, 
        xlab="�]�߳q�ܤ�����",col=terrain.colors(3))











