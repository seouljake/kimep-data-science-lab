##############################
# References
##############################

# Bar plots
# http://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization

# Line plots
# http://www.sthda.com/english/wiki/ggplot2-line-plot-quick-start-guide-r-software-and-data-visualization

# Resolution and Dimension of image files
# https://www.christophenicault.com/post/understand_size_dimension_ggplot2/

# Color palettes
# http://www.sthda.com/english/wiki/ggplot2-colors-how-to-change-colors-automatically-and-manually

##############################
# directories and libraries
##############################
# set working directory
getwd()
setwd("C:/Users/seoul/Dropbox/00 technical/github/kimep-data-science-lab/2023.02 CSS3501_2 Data Visualization in R/")
getwd()

# libraries
#install.packages("readxl")
#install.packages("ggplot2")

library(ggplot2)
library(readxl)



##############################
# import data
##############################
v1 <- read_excel("v1.xlsx")
v1
v1$Month <- factor(v1$Month)
v1$RoomType <- factor(v1$RoomType)
v1

# read in v2

v3_1 <- read_excel("v3_clubdeluxe.xlsx")
# read in v3_ files for the other five rooms

v4 <- read_excel("v4.xlsx")
v4$RoomType <- factor(v4$RoomType)


# read in v5

v6 <- read_excel("v6.xlsx")
v6$RoomType <- factor(v6$RoomType)
v6$RevenueType <- factor(v6$RevenueType)





##############################
### V1 - Total Percentages by Month and Room Type
##############################
v1

# line plot
p <- ggplot(data=v1,aes(x=Month,y=Total_Percent,group=RoomType))+
  geom_line()+
  geom_point()+
  xlab("Month")+
  ylab("Percent")+
  ggtitle("Monthly Total Percentages by Room Type")
p

# change theme
p <- ggplot(data=v1,aes(x=Month,y=Total_Percent,group=RoomType))+
  geom_line()+
  geom_point()+
  theme_minimal()+
  xlab("Month")+
  ylab("Percent")+
  ggtitle("Monthly Total Percentages by Room Type")
p

# change line
p <- ggplot(data=v1,aes(x=Month,y=Total_Percent,group=RoomType))+
  geom_line(aes(linetype=RoomType))+
  geom_point()+
  theme_minimal()+
  xlab("Month")+
  ylab("Percent")+
  ggtitle("Monthly Total Percentages by Room Type")
p

# color lines
p <- ggplot(data=v1,aes(x=Month,y=Total_Percent,group=RoomType))+
  geom_line(aes(color=RoomType))+
  geom_point()+
  theme_minimal()+
  xlab("Month")+
  ylab("Percent")+
  ggtitle("Monthly Total Percentages by Room Type")
p

# color lines and points
p <- ggplot(data=v1,aes(x=Month,y=Total_Percent,group=RoomType))+
  geom_line(aes(color=RoomType))+
  geom_point(aes(color=RoomType))+
  theme_minimal()+
  xlab("Month")+
  ylab("Percent")+
  ggtitle("Monthly Total Percentages by Room Type")
p

# legend title and labels
legend_title <- "Room Type"
legend_labels <- c("Club Deluxe King","Executive","King","One-Bedroom Club","One-Bedroom Suite","Superior King")

p <- ggplot(data=v1,aes(x=Month,y=Total_Percent,group=RoomType))+
  geom_line(aes(color=RoomType))+
  geom_point(aes(color=RoomType))+
  theme_minimal()+
  scale_color_discrete(name = legend_title, labels = legend_labels)+
  xlab("Month")+
  ylab("Percent")+
  ggtitle("Monthly Total Percentages by Room Type")
p

ggsave("v1.png",plot = p, dpi = 500)


############################################################
### V2 - Total Percentages by Month and Revenue Type
############################################################

# Using the data in v2.xlsx
# Produce and save a line plot
# indicating Monthly total percentages by revenue type



############################################################
### V3 - Bar, Food and Room Percentages by Month, for each room
############################################################

# 1. 'Club Deluxe King Room'
# 2. 'Executive Suite'
# 3. 'King Suite'
# 4. 'One-Bedroom Club Room'
# 5. 'One-Bedroom Suite'
# 6. 'Superior King Room'

v3_1
roomname<-"Club Deluxe King Room"
dat <- v3_1
dat$Month <- factor(dat$Month)
dat$RevenueType <- factor(dat$RevenueType)


# line plot
p <- ggplot(data=dat,aes(x=Month,y=Percent,group=RevenueType))+
  geom_line(aes(color=RevenueType))+
  geom_point(aes(color=RevenueType))+
  theme_minimal()+
  xlab("Month")+
  ylab("Percent")+
  ggtitle(paste("\nMonthly Percentages by Revenue Type\n",roomname,sep=""))
p


# change legend title and labels
legend_title <- "Revenue Type"
legend_labels <- c("Bar","Food","Room","Total")

p <- ggplot(data=dat,aes(x=Month,y=Percent,group=RevenueType))+
  geom_line(aes(color=RevenueType))+
  geom_point(aes(color=RevenueType))+
  theme_minimal()+
  scale_color_discrete(name = legend_title, labels = legend_labels)+
  xlab("Month")+
  ylab("Percent")+
  ggtitle(paste("\nMonthly percentages by Revenue Type\n",roomname,sep=""))
p

ggsave("v3_clubdeluxe.png",plot = p, dpi = 500)



# Using the data in the five v3_ Excel files
# Produce and save five line plots
# indicating monthly percentages by revenue type for each room type





############################################################
# V4 - Annual Total Percentages by Room Type
############################################################


v4

# bar plot
p <- ggplot(data=v4,aes(x=RoomType,y=Total_Percent))+
  geom_bar(stat="identity")+
  xlab("Room Type")+
  ylab("Percent")+
  theme_minimal()+
  ggtitle("Annual Total Percentages by Room Type")
p


# change bar colors and borders
p <- ggplot(data=v4,aes(x=RoomType,y=Total_Percent))+
  geom_bar(stat="identity", color="gold", fill="purple")+
  xlab("Room Type")+
  ylab("Percent")+
  theme_minimal()+
  ggtitle("Annual Total Percentages by Room Type")
p

# rotate axis labels
p <- ggplot(data=v4,aes(x=RoomType,y=Total_Percent))+
  geom_bar(stat="identity", color="gold", fill="purple")+
  xlab("Room Type")+
  ylab("Percent")+
  scale_x_discrete(guide = guide_axis(angle = 60)) +
  theme_minimal()+
  ggtitle("Annual Total Percentages by Room Type")
p

# edit axis labels
x_axis_labels <- c("Club Deluxe King","Executive","King","One-Bedroom Club","One-Bedroom Suite","Superior King")

p <- ggplot(data=v4,aes(x=RoomType,y=Total_Percent))+
  geom_bar(stat="identity", color="gold", fill="purple")+
  xlab("Room Type")+
  ylab("Percent")+
  scale_x_discrete(guide = guide_axis(angle = 60),labels=x_axis_labels) +
  theme_minimal()+
  ggtitle("Annual Total Percentages by Room Type")
p

# resize axis labels
x_axis_labels <- c("Club Deluxe King","Executive","King","One-Bedroom Club","One-Bedroom Suite","Superior King")

p <- ggplot(data=v4,aes(x=RoomType,y=Total_Percent))+
  geom_bar(stat="identity", color="gold", fill="purple")+
  xlab("Room Type")+
  ylab("Percent")+
  scale_x_discrete(guide = guide_axis(angle = 45),labels=x_axis_labels) +
  theme(axis.text.x=element_text(size=rel(0.5)))+
  theme_minimal()+
  ggtitle("Annual Total Percentages by Room Type")
p


# flip coordinate axes
x_axis_labels <- c("Club Deluxe King","Executive","King","One-Bedroom Club","One-Bedroom Suite","Superior King")

p <- ggplot(data=v4,aes(x=RoomType,y=Total_Percent))+
  geom_bar(stat="identity", color="gold", fill="purple")+
  xlab("Room Type")+
  ylab("Percent")+
  scale_x_discrete(guide = guide_axis(angle = 0),labels=x_axis_labels) +
  theme(axis.text.x=element_text(size=rel(0.5)))+
  theme_minimal()+
  coord_flip()+
  ggtitle("Annual Total Percentages by Room Type")
p

ggsave("v4.png",plot = p, dpi = 500)

# specify dimensions
ggsave("v4.png",plot = p,height=100,width=200,units="mm",dpi = 500)




############################################################
# V5 - Annual Total Percentages by Revenue Type
############################################################

# Using the data in v5
# Produce and save a bar plot plot
# indicating annual total percentages by revenue type




############################################################
### V6 - annual room, bar, food percentages by room type
############################################################
v6

# bar plot with two groups
legend_title <- "Revenue Type"
legend_labels <- c("Bar","Food","Room","Total")

p <- ggplot(data=v6,aes(x=RoomType,y=Percent,fill=RevenueType))+
  geom_bar(stat="identity",position=position_dodge())+
  theme_minimal()+
  xlab("Room Type")+
  ylab("Total Percent")+
  scale_fill_discrete(name = legend_title, labels = legend_labels)+
  scale_x_discrete(guide = guide_axis(angle = 45),labels=x_axis_labels) +
  theme(axis.text.x=element_text(size=rel(0.8)))+
  ggtitle("Annual Room, Bar and Food Percentages by Room Type")
p

# change color scheme

palette_choice <- "Set3"

p <- ggplot(data=v6,aes(x=RoomType,y=Percent,fill=RevenueType))+
  geom_bar(stat="identity",position=position_dodge())+
  theme_minimal()+
  xlab("Room Type")+
  ylab("Total Percent")+
  scale_x_discrete(guide = guide_axis(angle = 45),labels=x_axis_labels) +
  theme(axis.text.x=element_text(size=rel(0.8)))+
  scale_fill_brewer(palette=palette_choice,name = legend_title, labels = legend_labels)+
  ggtitle("Annual Room, Bar and Food Percentages by Room Type")
p


palette_choice <- "BuPu"

p <- ggplot(data=v6,aes(x=RoomType,y=Percent,fill=RevenueType))+
  geom_bar(stat="identity",position=position_dodge())+
  theme_minimal()+
  xlab("Room Type")+
  ylab("Total Percent")+
  scale_x_discrete(guide = guide_axis(angle = 45),labels=x_axis_labels) +
  theme(axis.text.x=element_text(size=rel(0.8)))+
  scale_fill_brewer(palette=palette_choice,name = legend_title, labels = legend_labels)+
  ggtitle("Annual Room, Bar and Food Percentages by Room Type")
p

ggsave("v6.png",plot = p,height=110,width=200,units="mm",dpi = 500)





