#���ͦʸU���|�����
Sys.setlocale(category = "LC_ALL", locale = "cht")
profile <- data.frame(
  id = paste("0000000", as.character( seq(from=1, to=1000000, by=1)),sep='' ) ,
  age = round(rnorm(1000000,25,3)),
  gender = sample(c("�k��", "�k��"), size = 1000000, replace = TRUE),
  group = sample(c("�۫~�H", "���K��","����H"), size = 1000000, replace = TRUE),
  zone = sample(c("�x�W","����"), size=1000000, replace=TRUE)
)
install.packages("sqldf")
library(sqldf)
profile$id <- sqldf("SELECT substr(id,-7,7) FROM profile")
profile_final <- data.frame(id = profile$id,
                            age = profile$age,
                            gender = profile$gender,
                            group = profile$group,
                            zone = profile$zone)
names(profile_final)[1] <- 'id'
head(profile_final,10)
#�ɮ׿�X
write.table(profile_final, file = "profile.csv", quote = FALSE, sep = ",", row.names = FALSE, 
            col.names =TRUE )

#���ͦʸU���|���@�~�����O���
trans_df <- data.frame(data_month=character(),
                       id=character(),
                       product=character(),
                       Logicals=logical(),
                       Characters=character(),
                       amt=integer()
)
#�C�벣�X�����O����
for(i in 1:12)
{
  id = sample(profile_final$id, size = round(runif(1,300000,700000)), replace = TRUE)
  i_month <- ifelse(nchar(i)==1,paste('0',i,sep=''),i)
  tmp_df <- data.frame(
    data_month = paste('2019/',i_month,'/01',sep=''),
    id = id,
    product = sample(c("�����", "�~���","���x","�ൣ","CD","DVD","������",'�ͬ����f'), size = 
                       length(id), replace = TRUE),
    amt = round(runif(length(id),50,699))
  )
  trans_df <- rbind(trans_df,tmp_df)
}
#�ɮ׿�X
write.table(trans_df, file = "trans.csv", quote = FALSE, sep = ",", row.names = FALSE, col.names 
            =TRUE )