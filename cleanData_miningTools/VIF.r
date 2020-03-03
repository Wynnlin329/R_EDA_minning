VIF <- function(variable,data,data_name)
{ 
  var.nums <- length(variable)         #�Υh�ܼƼƶq
  vif.table <- matrix(,nrow=var.nums,ncol=2)  #�Ω��x�s�p�⵲�G
  for(i in 1:var.nums)            #�`���p����U���ܼƪ�VIF
  {
    text=""
    for(ii in variable[-i])
    {
      text=paste(text,ii,sep="+")
    }
    text=paste(text, ",data=",sep="")
    text=paste(text,data_name,sep="")
    text=paste(variable[i],substr(text, 2, nchar(text)),sep="~")   
    text=paste("temp.lm <- lm(",text,sep="")
    text=paste(text,")",sep="")
    eval(parse(text=text))        #����lm()
    temp.d <- summary(temp.lm)      #���or2   
    vif.table[i,1] <- variable[i]     #�е��ܶq
    vif.table[i,2] <- round(1/(1-temp.d$r.squared),2) #�p��VIF�A��ܨ��p��
  }
  colnames(vif.table) <- c("Var.", "VIF")  #��Header
  vif.table <- as.data.frame(vif.table)     #��Ƭ��ƾڮ�
  return(vif.table)                             #��^��
}

# �I�s VIF
iris_vif <- iris[-5]
VIF(names(iris_vif),iris_vif, "iris_vif")