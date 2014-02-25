datafile<-"./household_power_consumption.txt"
data <- read.table(datafile, 
                   header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, 
                   dec=".")
relevant_rows<-data$Date %in% c("1/2/2007","2/2/2007") # %in% will
#return a logical vector containing TRUE for the given values
#the everythingelse is false

data1<-data[relevant_rows,]
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png(filename="plot2.png", width=480, height=480)

plot(datetime,as.numeric(data1$Global_active_power),
     ylab="Global Active Power(killowatts)",xlab=" ",
     col ="black",type="l")


dev.off()

