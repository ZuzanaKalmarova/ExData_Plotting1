#reading in the data:
data<-read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE,sep=";",na.strings="?")
#subsetting the data to have only the 2 required February dates:
datause<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
#adding new column DateTime, putting together the Date and Time variables and changing the class:
datause$DateTime<-strptime(paste(datause$Date,datause$Time),"%d/%m/%Y %H:%M:%S")
#opeing png device:
png("plot4.png")
#setting up the margins:
par(mar=c(4,4,3,1))
#setting up the canvas, saying we will have 4 plots in 2 rows and 2 columns:
par(mfrow=c(2,2))
#creating first plot:
plot(datause$DateTime,datause$Global_active_power,type="l",ylab="Global Active Power",xlab="")
#Creating second plot:
plot(datause$DateTime,datause$Voltage,type="l",ylab="Voltage",xlab="datetime")
#creating the third plot with the first line for sub_metering_1 data:
plot(datause$DateTime,datause$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
#drawing the second line of third plot, note type="l", thus it will be lines not points:
points(datause$DateTime,datause$Sub_metering_2,type="l",col="red")
#drawing the third line of third plot, note type="l", thus it will be lines not points:
points(datause$DateTime,datause$Sub_metering_3,type="l",col="blue")
#adding the legend to third plot, bty="n" for no box around the legend:
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")
#creating the fourth plot:
plot(datause$DateTime,datause$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
#closing png device which will create a png file in working directory:
dev.off()