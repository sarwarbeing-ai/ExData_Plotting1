#Plot2 week4 Baltimore city
datafile1<-"summarySCC_PM25.rds"
data1<-readRDS(datafile1)
png(filename="plot2.png",width = 480,height=480)

library(dplyr)
data1.year.fips<-select(data1,fips,Emissions,year)
data1.fips_24510<-data1.year.fips[data1.year.fips$fips=="24510",] #Baltimore city
total_1999<-sum(data1.fips_24510[data1.fips_24510$year==1999,]$Emissions)
total_2002<-sum(data1.fips_24510[data1.fips_24510$year==2002,]$Emissions)
total_2005<-sum(data1.fips_24510[data1.fips_24510$year==2005,]$Emissions)
total_2008<-sum(data1.fips_24510[data1.fips_24510$year==2008,]$Emissions)
total<-c(total_1999,total_2002,total_2005,total_2008)

year<-c(1999,2002,2005,2008)

barplot(total,
     main=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008"),
     ylab=expression("Total PM"[2.5]*" Emission "),col=
       c("#000000","#FF0000","#0000FF","#FF00FF"),
     names.arg=year)
dev.off()

