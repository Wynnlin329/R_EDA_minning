#�b�u�@�ؿ��s�Wtrycatch2.r��
tryCatch(
  {
    x = "1"
    z = sqrt(x)
  },
  # �J�� warning �ɪ��ۭq�B�z���
  warning = function(msg) {
    message(paste("[Warning]",msg,"\n"))
    return(NULL)
  },
  # �J�� error �ɪ��ۭq�B�z���
  error = function(msg) {
    message(paste("[Error]",msg,"\n"))
    return(NA)
  }
) 
ifelse(exists("z"),z,"z does not exist!")
a= x
a

source("trycatch2.r", echo = TRUE)