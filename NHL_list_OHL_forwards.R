library(ggplot2)
library(dplyr)

#set working directory
setwd("~/Documents/hockey/Prospects")

#read csv file and create data frame called OHLstats
OHLstats <- read.csv("OHL-skaters.csv", header = TRUE)

#filter players by NHL 2018 Draft List and create data frame called prospects
prospects <- filter(OHLstats, Name %in% c("Ty Dellandrea", "Cam Hillis", "Blade Jenkins",
        "Barrett Hayton", "Serron Noel", "Akil Thomas", "Ryan McLeod", "Allan McShane", "Kody Clark",
        "Pavel Gogolev", "Andrei Svechnikov", "Sam Bitten", "Liam Foudy",
        "Semyon Der-Arguchintsev", "Mitchell Hoelscher", "Albert Michnac"))

#create a data frame with only the stats per games played - to be used in tableau
tableau=select(prospects,-1,-3:-10)

#write csv file to working directory to graph in tableau
write.csv(tableau, file = paste(Sys.Date(), sep="_","OHL_forwards.csv"), row.names = F)

#********************************************************************************************
#create bar plot

p <-ggplot(tableau, aes(x = reorder(Name, P1.GP), y = P1.GP))
p + geom_bar(stat="identity", fill="steelblue") + 
  theme_minimal() + 
  coord_flip() + 
  ggtitle("2018 NHL Draft Rank OHL Forwards") +
  labs(x="", y="Points/GP")








