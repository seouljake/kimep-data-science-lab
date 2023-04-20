
getwd()


# install.packages("readxl")
library(readxl)
library(ggplot2)

v1 = read_excel("v1.xlsx")
v1$keywords <- ordered(v1$keywords,levels=v1$keywords)


v2 = read_excel("v2_melted.xlsx")
v2$Keyword <- ordered(v2$Keyword,levels=unique(v2$Keyword))
v2$Period <- factor(v2$Period)

ts = read_excel("ts.xlsx")
ts$Year <- ordered(ts$Year,levels=unique(ts$Year))
ts$Keyword <- ordered(ts$Keyword,levels=unique(ts$Keyword))



# Plot Top 25 Keyword Frequencies
p<-ggplot(dat=v1,aes(x=keywords,y=counts))+
  geom_bar(stat="identity")
p


# Plot Top 25 Keyword Frequencies, two Periods
p<-ggplot(dat=v2,aes(x=Keyword,y=Frequency,fill=Period))+
  geom_bar(stat="identity",position=position_dodge())+
  ggtitle("Sanat's Top 25 Keyword Frequencies")
p


# Keyword Time-Series
p<-ggplot(dat=ts,aes(x=Year,y=Frequency,group=Keyword))+
  geom_line(aes(color=Keyword))+
  geom_point(aes(color=Keyword))
p
