datafile<-"./household_power_consumption.txt"
data <- read.table(datafile, 
                   header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, 
                   dec=".")
relevant_rows<-data$Date %in% c("1/2/2007","2/2/2007") # %in% will
#return a logical vector containing TRUE for the given values
#the everythingelse is false

data1<-data[relevant_rows,]
sub1<-as.numeric(data1$Sub_metering_1)
sub2<-as.numeric(data1$Sub_metering_2)
sub3<-as.numeric(data1$Sub_metering_3)
voltage<-as.numeric(data1$Voltage)
global_active_power<-as.numeric(data1$Global_active_power)
global_reactive<-as.numeric(data1$Global_reactive_power)

datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime,global_active_power,
     ylab="global_active_power",xlab=" ",
     col ="black",type="l")
plot(datetime,voltage,
     ylab="Voltage",xlab="datetime",
     col ="black",type="l")

plot(datetime,sub1,
     ylab="Energy Sub Metering",xlab=" ",
     col ="black",type="l")

lines(datetime,sub2,
      col ="red",type="l")

lines(datetime,sub3,
      col ="blue",type="l")
legend("topright", col = c("black", "red","blue"),lty=1,lwd=2, legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime,global_reactive,
     ylab="Global_reactive_power",xlab="datetime",
     col ="black",type="l")

dev.off()
