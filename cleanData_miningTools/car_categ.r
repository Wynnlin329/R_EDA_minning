data(cars)
str(cars)
summary(cars)
# �N�t�פ���3��,
# �Ĥ@�� speed<12 ; �ĤG�� speed <15 ; �ĤT�� speed >= 15
cars$speed
x1 = cars$speed
new_cars_band = 1*(x1<12) + 2*(x1>=12 & x1<15) + 3*(x1>=15)
new_cars_band

# �N�Ʀr�����ন��r
label = c('�C','��','��?)
new_cars_band = label[new_cars_band]
new_cars_band

# �A�N�t�׼�����X�A�ܦ����ؼ���
# '�C' , '��' �ন '�@���⨮' ; '��' �ন'�]��'
# �ϥ� %in%
car_categ = c('�@���⨮','�]��')
new_cars_band_1 = 1*(new_cars_band %in% c('�C','��')) + 2*(new_cars_band %in? c('��'))
new_cars_band_1 = car_categ[new_cars_band_1]

new_cars_band_1

# �A�N���ؼ�����X
# '�@���⨮'�ন 1 ; '�]��'�ন 0
new_cars_band_2 = 1*(new_cars_band_1 %in% c('�@���⨮')) + 0*(new_cars_band_1 %in% c('�]��'))
# �]�i�ϥ� ifelse (����, �u, ��)�A???�G�@��
new_cars_band_2 = ifelse(new_cars_band_1 =='�@���⨮', 1,0)
new_cars_band_3 = ifelse(new_cars_band %in% c('�C','��') ,'�@���⨮','�]��')

# within�N���OSQL�y�k����Case When
# �N�t�פ���3��, �C: speed<12 ; ��: speed <15 ; �� speed >= 15
new_cars <- c?rs
new_cars <- within(new_cars,
                     {
                       speed_level <- NA #�@�w�n���w�@�ӭ�
                       speed_level[cars$speed<12] <- "�C"
                       speed_level[cars$speed>=12 & cars$speed<15] <- "��"
         ?             speed_level[cars$speed>=15] <- "��"
                     }
)
head(new_cars,5)

# ���ͷs���
new_cars <- cars
new_cars <- transform(new_cars,
                        new_var1 = new_cars$speed * new_cars$dist ,
                        new_var2 =?new_cars$dist * 100
)
head(new_cars,10)
