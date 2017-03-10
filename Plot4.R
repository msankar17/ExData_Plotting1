library(sqldf)

#loading only the needed data from the source file
df=read.csv.sql("household_power_consumption.txt",sep=";",header=TRUE,nrows=100,"select * from file where Date in ('1/2/2007','2/2/2007')")

#set up image creation
png("plot4.png",width=480,height=480)

#creating the image
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Sub_metering_1,type="l",ylab="Energy sub metering",col="black",xlab="")
points(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Sub_metering_2,type="l",col="red")
points(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n",lty=1)
plot(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

#Switch of the device to access the file
dev.off()

