# merge()�A�p�PSQL�y�k���� join 
# ���إ߸��
a <- data.frame(T_name=c('Tony','Orozco','Justin'), Age=c(25,24,26))
a
b <- data.frame(T_name=c('Tony','Orozco','Justin','Carol'), 
                Salary=c(20000,25000,30000,18000)    )
b
# merge()�A�p�PSQL�y�k���� join 
#�w�]�O inner join 
merge( a , b, by.x="T_name", by.y="T_name")

# all.x=TRUE�N�O left join 
merge(b, a, by.x="T_name", by.y="T_name", all.x=TRUE)
