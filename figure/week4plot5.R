#Plot5 week4 Baltimore city   ##ggplot2
datafile1<-"summarySCC_PM25.rds"
datafile2<-"Source_Classification_Code.rds"
data1<-readRDS(datafile1)
source_mapping<-readRDS(datafile2)
png(filename="plot5.png",width = 600,height=480)


vehicle<-grepl("vehicle",source_mapping$SCC.Level.Two,ignore.case = TRUE)

sources_related_to_motor_vehicle<-source_mapping[vehicle,]$SCC

data_related_to_motor_vehicle<-data1[data1$SCC %in% sources_related_to_motor_vehicle,]

#Baltimore city 
vehicle_data<-data_related_to_motor_vehicle[data_related_to_motor_vehicle$fips=="24510",]

ggplot(vehicle_data,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="#FF00FF") +
  labs(x=NULL)+
  labs(y=expression("Total PM"[2.5]*" Emission ")) + 
  labs(title=expression("PM"[2.5]*" Emissions, 1999-2008 ,Baltimore city related to motor vehicle"))

dev.off()

