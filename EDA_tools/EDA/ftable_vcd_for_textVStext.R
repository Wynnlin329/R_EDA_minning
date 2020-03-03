#��e���R�� ftable
z <- data.frame(Main= c('�b','��','��','��','�b','��','�b'),
                sub=c('��','�S��','�S��','��','��','��','�S��') ,
                drink=c('tea','coffee','coffee','tea','coffee','tea','coffee'))
z

ftable(z, row.vars = 1:2, col.vars = "drink")
ftable(z, row.vars = "Main", col.vars = "drink")

#��R�e�{�ϯä��R�\��
install.packages("plyr")
library(plyr)
# ����40���H�����
df <- data.frame(
  group = c(rep('�ӤH��', 20), rep('���~��', 20)),
  sex = sample(c("M", "F"), size = 40, replace = TRUE),
  age = floor(runif(n = 40, min = 25, max = 40)),
  bill = floor(runif(n = 40, min = 199, max = 2600))
)
# �Q��group, sex�i����աA�íp��~�֪������ơB�зǮt�H��bill�`�M�P����
ddply(df, .(group, sex), summarize,
        mean_age = round(mean(age), 2),
        sd_age = round(sd(age), 2),
        sum_bill = sum(bill),
        mean_bill = round(mean(bill), 2)
)
#�p���Ƶ���count
ddply(df, c('group','sex'), nrow)
ddply(df, c('group','sex','age'), nrow) #�O���O�ܹ��ϯä��R������l���


#��vcd�p��C�p���ʤ���
install.packages("vcd")
library(vcd)
# ����40���H�����
df <- data.frame(
  group = c(rep('�ӤH��', 20), rep('���~��', 20)),
  sex = sample(c("M", "F"), size = 40, replace = TRUE),
  age = floor(runif(n = 40, min = 25, max = 40)),
  bill = floor(runif(n = 40, min = 199, max = 2600))
)
# bill���ʤ���??????
prop.table(df$bill)#prob ����Ʀr��۹�
data.frame(df$bill,prop.table(df$bill))

table(df$age)
#�ন�ʤ���
prop.table( table(df$age) )
#�G���C�p���ন�ʤ���
table(df$age, df$group)
prop.table(table(df$age, df$group) )  # ���椺�����[�` = 1

table(df$age)
#�ন�ʤ���
prop.table( table(df$age) )
#�G���C�p���ন�ʤ���
table(df$age, df$group)
prop.table(table(df$age, df$group) ,2 )  # �Ѽ�2���ܦU��[�` = 1
#�G���C�p���ন�ʤ���
table(df$age, df$group)
prop.table(table(df$age, df$group) ,1)  # �Ѽ�1���ܦU�C�[�` = 1

#ftable�f�tvcd
#��e���R�� ftable
z <- data.frame(Main= c('�b','��','��','��','�b','��','�b'), sub=c('��','�S��','�S��','��','��','��','
�S��') , drink=c('tea','coffee','coffee','tea','coffee','tea','coffee'))
z
ftable(z, row.vars = 1:2, col.vars = "drink")
prop.table( ftable(z, row.vars = 1:2, col.vars = "drink") )
