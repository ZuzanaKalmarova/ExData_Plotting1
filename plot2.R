#reading in the data:
data<-read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE,sep=";",na.strings="?")
#subsetting the data to have only the 2 required February dates:
datause<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
#adding new column DateTime, putting together the Date and Time variables and changing the class:
datause$DateTime<-strptime(paste(datause$Date,datause$Time),"%d/%m/%Y %H:%M:%S")
#opeing png device:
png("plot2.png")
#doing line diagram - type="l"
plot(datause$DateTime,datause$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#closing png device which will create a png file in working directory:
dev.off()