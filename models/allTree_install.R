# 一次安裝所有packages
packages <- c("C50","tree", "rpart","randomForest")
for (i in packages){  install.packages(i) }
  #一次載入packages
sapply(packages, FUN = library, character.only = TRUE)
search()