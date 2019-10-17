library(tidyverse)
library(dplyr)
library(data.table)
library(rCBA)
library(arules)
library(arulesViz)
library(datasets)
library(sqldf)

MyData<-read.csv("order_products__train.csv",sep=",")
MyData<-MyData[1:500,]
#iris_data<-data("iris")

MyProducts<-read.csv("products.csv",sep=",")

DataTable<-merge(MyData,MyProducts,by="product_id")

prod_id<-unique(DataTable$product_name)
prod_id<-sort(prod_id)
prod_id<-as.character(prod_id)

#eee<-unique(MyData$order_id)
#eee<-as.data.frame(as.matrix(eee))

#df <- data.frame(matrix(ncol = length(ddd)+1, nrow = 1))
#colnames(df) <- c("order_id",sort(ddd))

#df <- data.frame(matrix(ncol = 3, nrow = 0))
#x <- c("name", "age", "gender")
#colnames(df) <- x

#df <- rbind(df,data.frame(1==1,11109=1)
            
#df[1,1]<-3
#ccc<-9
#Cols.chosen<-append(Cols.chosen,ccc)
#df[1,Cols.chosen]<-2



#i <- c(1:50)

#for (val in i)
#{
  
#}
       
#for (val in i)
#{
#  if(MyData[val,3]<MyData[val+1,3])
#  {
#    print("SameLine")
#  }
#  else
#  {
#    print("DifferentLine")
#  }
#}

#bbb<-c(1,2,3,4)
#bbb<-append(bbb,5)

#MyData[MyData$order_id == 1]
#MyData[2,2]

#creating DF
df <- data.frame(matrix(ncol = length(prod_id)+1, nrow = 1))
colnames(df) <- c("order_id",sort(prod_id))

#init 'for'
ord_id<-c(unique(MyData$order_id))

counter<-0

for (val in ord_id)
{
  aaa<-DataTable %>% filter(order_id == val)
  aaa_vec<-(aaa$product_name)
  aaa_vec<-as.character(aaa_vec)
  counter<-counter+1
  df[counter,aaa_vec]<-TRUE
  df[counter,1]<-val
  
}
#df[1,c("Active Dry Yeast")]<-TRUE

#aaa<-MyData %>% filter(order_id == 2)

xxxx<-df[,2:dim(df)[2]]
xxxx[is.na(xxxx)] <- FALSE
xxxx<-as.matrix(xxxx)
rules <- apriori(xxxx,
                 parameter = list(supp = 0.5, conf = 0.9, target = "rules"))
                 #, parameter = list(supp = 0.001, conf = 0.8))
itemFrequencyPlot(xxxx,topN=20,type="absolute")

summary(rules)
options(digits=2)
inspect(rules[1:5])
#, parameter = list(supp = 0.001, conf = 0.8))


#aaa<-MyData %>% filter(order_id == 1)
#aaa_vec<-c(aaa$product_id)
#aaa_vec<-as.character(aaa_vec)
#df[1,aaa_vec]<-1


#ddd_vec<-c("1","2","3","4","5","7","8","9","10")
#df[1,ddd_vec]<-100

#df[4,4]<-9
