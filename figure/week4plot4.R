#Plot4 week4 Baltimore city   ##ggplot2
datafile1<-"summarySCC_PM25.rds"
datafile2<-"Source_Classification_Code.rds"
data1<-readRDS(datafile1)
source_mapping<-readRDS(datafile2)
png(filename="plot4.png",width = 600,height=480)


combustion<-grepl("comb",source_mapping$SCC.Level.One,ignore.case = TRUE)
coal<-grepl("coal",source_mapping$SCC.Level.Four,ignore.case = TRUE)
sources_related_to_coalcombustion<-source_mapping[combustion &coal,]$SCC

data_related_to_coalcombustion<-data1[data1$SCC %in% sources_related_to_coalcombustion,]

ggplot(data_related_to_coalcombustion,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="#FF00FF") +
  labs(x=NULL)+
  labs(y=expression("Total PM"[2.5]*" Emission ")) + 
  labs(title=expression("PM"[2.5]*" Emissions, 1999-2008 ,coal-combustion related"))

dev.off()

