#reading in the data:
data<-read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE,sep=";",na.strings="?")
#subsetting the data to have only the 2 required February dates:
datause<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
#adding new column DateTime, putting together the Date and Time variables and changing the class:
datause$DateTime<-strptime(paste(datause$Date,datause$Time),"%d/%m/%Y %H:%M:%S")
#opeing png device:
png("plot3.png")
#creating the plot with the first line for sub_metering_1 data:
plot(datause$DateTime,datause$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
#drawing the second line, note type="l", thus it will be lines not points
points(datause$DateTime,datause$Sub_metering_2,type="l",col="red")
#drawing the third line, note type="l", thus it will be lines not points
points(datause$DateTime,datause$Sub_metering_3,type="l",col="blue")
#adding the legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
#closing png device which will create a png file in working directory:
dev.off()