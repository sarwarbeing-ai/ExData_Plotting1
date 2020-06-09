#Plot1 week4 
datafile1<-"summarySCC_PM25.rds"
data1<-readRDS(datafile1)

png(filename="plot1.png",width = 480,height=480)

library(dplyr)
data1.year<-select(data1,Emissions,year)
total_1999<-sum(data1.year[data1.year$year==1999,]$Emissions)
total_2002<-sum(data1.year[data1.year$year==2002,]$Emissions)
total_2005<-sum(data1.year[data1.year$year==2005,]$Emissions)
total_2008<-sum(data1.year[data1.year$year==2008,]$Emissions)
total<-c(total_1999,total_2002,total_2005,total_2008)

year<-c(1999,2002,2005,2008)
barplot(total,
        main=expression("PM"[2.5]*" Emissions, 1999-2008 from all types of sources"),
        ylab=expression("Total PM"[2.5]*" Emission "),col=
          c("#000000","#FF0000","#0000FF","#FF00FF"),
        names.arg=year)
dev.off()
