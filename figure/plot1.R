datafile<-"./household_power_consumption.txt"
data <- read.table(datafile, 
                   header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, 
                   dec=".")
relevant_rows<-data$Date %in% c("1/2/2007","2/2/2007") # %in% will
#return a logical vector containing TRUE for the given values
#the everythingelse is false

data1<-data[relevant_rows,]
png(filename="plot1.png", width=480, height=480)

hist(as.numeric(data1$Global_active_power),xlab="Global Active Power(killowatts)",
     ylab="Frequency",main="Global Active Power",
     col ="red")
dev.off()



