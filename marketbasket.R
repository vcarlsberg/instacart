library(tidyverse)
library(dplyr)
library(data.table)

MyData<-read.csv("order_products__train.csv",sep=",")
MyData<-MyData[1:10000,]
#iris_data<-data("iris")

ddd<-unique(MyData$product_id)
sort(ddd)

#eee<-unique(MyData$order_id)
#eee<-as.data.frame(as.matrix(eee))

df <- data.frame(matrix(ncol = length(ddd)+1, nrow = 1))
colnames(df) <- c("order_id",sort(ddd))

#df <- data.frame(matrix(ncol = 3, nrow = 0))
#x <- c("name", "age", "gender")
#colnames(df) <- x

#df <- rbind(df,data.frame(1==1,11109=1)
            
#df[1,1]<-3
#ccc<-9
#Cols.chosen<-append(Cols.chosen,ccc)
#df[1,Cols.chosen]<-2



i <- c(1:50)

for (val in i)
{
  
}
       
for (val in i)
{
  if(MyData[val,3]<MyData[val+1,3])
  {
    print("SameLine")
  }
  else
  {
    print("DifferentLine")
  }
}

bbb<-c(1,2,3,4)
bbb<-append(bbb,5)

MyData[MyData$order_id == 1]
MyData[2,2]

#creating DF
df <- data.frame(matrix(ncol = 39123+1, nrow = 3))
colnames(df) <- c("order_id",sort(ddd))

#init 'for'
order_id<-c(unique(MyData$order_id))

counter<-0

for (val in order_id)
{
  aaa<-MyData %>% filter(order_id == 1)
  aaa_vec<-c(aaa$product_id)
  aaa_vec<-as.character(aaa_vec)
  counter<-counter+1
  df[counter,aaa_vec]<-1
  df[counter,1]<-val
}


aaa<-MyData %>% filter(order_id == 1)
aaa_vec<-c(aaa$product_id)
aaa_vec<-as.character(aaa_vec)
df[1,aaa_vec]<-1


ddd_vec<-c("1","2","3","4","5","7","8","9","10")
df[1,ddd_vec]<-100

df[4,4]<-9
