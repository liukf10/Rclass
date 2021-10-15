setwd("E:/Rclass") #设置工作路径(即数据文件所在路径) 自己修改成自己的路径
load("diabets.RData") #读取R数据格式文件 可以路径不完整
#或者
load("E:/Rclass/diabets.RData") #通过完整路径读取数据文件
class(diabets) #查看数据diabets的数据类型
dim(diabets) #diabets是数据框 查看行列个数
diabets$Sex 
diabets$GLU
diabets[1,] #查看第一行数据
diabets[,1] #查看第一列数据
diabets[c(1,5:3),1] #查看第1,5,4,3行的第一列数据

#实现方式1 
#通过提取每一行数据判断 然后循环计算出结果
j = 0
for (i in 1:nrow(diabets)) {
  x <- diabets[i,]; #选取第i行
  class(x) #仍然是数据框格式
  #x2 <- unlist(x) #如果转成向量，Female会变成数字或者数字变字符
  if(x[1,1] == "Female" & x[1,2] < 6.1 & x[1,2] > 3.9){
    j = j + 1
  }
}

#实现方法2
#利用subset提取数据框中满足条件的数据
a <- subset(diabets, Sex == "Female")
#或者利用逻辑判断来提取特定数据
pos = diabets$Sex == "Female"
a <- diabets[pos,]
nrow(a)


