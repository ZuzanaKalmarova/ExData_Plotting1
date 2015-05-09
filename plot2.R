data<-read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE,sep=";",na.strings="?")
datause<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
datause$DateTime<-strptime(paste(datause$Date,datause$Time),"%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(datause$DateTime,datause$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()