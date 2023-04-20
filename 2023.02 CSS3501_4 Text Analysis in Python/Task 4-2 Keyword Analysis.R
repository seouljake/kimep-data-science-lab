
getwd()


# install.packages("readxl")
library(readxl)
library(ggplot2)

v1 = read_excel("results/v1.xlsx")
v1$keywords <- ordered(v1$keywords,levels=v1$keywords)


v2 = read_excel("results/v2_melted.xlsx")
v2$Keyword <- ordered(v2$Keyword,levels=unique(v2$Keyword))
v2$Period <- factor(v2$Period)



p<-ggplot(dat=v1,aes(x=keywords,y=counts))+
  geom_bar(stat="identity")
p



p<-ggplot(dat=v2,aes(x=Keyword,y=Frequency,fill=Period))+
  geom_bar(stat="identity",position=position_dodge())
p

