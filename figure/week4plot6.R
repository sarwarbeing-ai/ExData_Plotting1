#Plot6 week4 Baltimore city   ##ggplot2
datafile1<-"summarySCC_PM25.rds"
datafile2<-"Source_Classification_Code.rds"
data1<-readRDS(datafile1)
source_mapping<-readRDS(datafile2)
png(filename="plot6.png",width = 600,height=480)


vehicle<-grepl("vehicle",source_mapping$SCC.Level.Two,ignore.case = TRUE)

sources_related_to_motor_vehicle<-source_mapping[vehicle,]$SCC

data_related_to_motor_vehicle<-data1[data1$SCC %in% sources_related_to_motor_vehicle,]

#Baltimore city 
vehicle_data_balti<-data_related_to_motor_vehicle[data_related_to_motor_vehicle$fips=="24510",]

vehicle_data_balti$City<-rep("Baltimore City",nrow(vehicle_data_balti))

#Los Angeles
vehicle_data_los<-data_related_to_motor_vehicle[data_related_to_motor_vehicle$fips=="06037",]
vehicle_data_los$City<-rep("Los Angeles",nrow(vehicle_data_los))


combined_data<-rbind(vehicle_data_balti,vehicle_data_los)


ggplot(combined_data,aes(factor(year),Emissions,fill=City)) +
  geom_bar(stat="identity") +
  facet_grid(.~City)+
  
  labs(x=NULL)+
  labs(y=expression("Total PM"[2.5]*" Emission ")) + 
  labs(title=expression("PM"[2.5]*" Emissions, 1999-2008 ,Baltimore city and Los Angeles related to motor vehicle"))

dev.off()

