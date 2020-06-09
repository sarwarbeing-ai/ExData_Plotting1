#Plot3 week4   ##ggplot2
datafile1<-"summarySCC_PM25.rds"

data1<-readRDS(datafile1)
png(filename="plot3.png",width = 600,height=480)

library(dplyr)
data2<-select(data1,fips,Emissions,type,year)
data2<-data2[data2$fips=="24510",] #Baltimore city

ggplot(data2,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(.~type) + 
  labs(x=NULL)+
labs(y=expression("Total PM"[2.5]*" Emission ")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off()
