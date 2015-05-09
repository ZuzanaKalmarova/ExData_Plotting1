data<-read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE,sep=";",na.strings="?")
datause<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
datause$DateTime<-strptime(paste(datause$Date,datause$Time),"%d/%m/%Y %H:%M:%S")
png("plot1.png")
hist(datause$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()