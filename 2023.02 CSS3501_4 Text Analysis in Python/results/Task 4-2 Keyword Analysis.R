
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
  geom_bar(stat="identity")+
  scale_x_discrete(guide = guide_axis(angle = 45)) +
  ggtitle("Jacob's Top 25 Keyword Frequencies")
p

ggsave("top25.png",plot = p,height=110,width=200,units="mm",dpi = 500)


# Plot Top 25 Keyword Frequencies, two Periods
p<-ggplot(dat=v2,aes(x=Keyword,y=Frequency,fill=Period))+
  geom_bar(stat="identity",position=position_dodge())+
  scale_x_discrete(guide = guide_axis(angle = 45)) +
  ggtitle("Jacob's Top 25 Keyword Frequencies, Two Periods")
p

ggsave("top25_2periods.png",plot = p,height=110,width=200,units="mm",dpi = 500)


# Keyword Time-Series
p<-ggplot(dat=ts,aes(x=Year,y=Frequency,group=Keyword))+
  geom_line(aes(color=Keyword))+
  geom_point(aes(color=Keyword))+
  ggtitle("Jacob's Keyword Time Series for Selected Keywords")
p

ggsave("keyword timeseries.png",plot = p,height=110,width=200,units="mm",dpi = 500)


