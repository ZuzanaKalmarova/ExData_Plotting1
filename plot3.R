data<-read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE,sep=";",na.strings="?")
datause<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
datause$DateTime<-strptime(paste(datause$Date,datause$Time),"%d/%m/%Y %H:%M:%S")
png("plot3.png")
plot(datause$DateTime,datause$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(datause$DateTime,datause$Sub_metering_2,type="l",col="red")
points(datause$DateTime,datause$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()