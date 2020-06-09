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
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png(filename="plot3.png", width=480, height=480)
plot(datetime,sub1,
     ylab="Energy Sub Metering",xlab=" ",
     col ="black",type="l")

lines(datetime,sub2,
     col ="red",type="l")

lines(datetime,sub3,
     col ="blue",type="l")
legend("topright", col = c("black", "red","blue"),lty=1,lwd=2, legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
