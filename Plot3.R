library(sqldf)

#loading only the needed data from the source file
df=read.csv.sql("household_power_consumption.txt",sep=";",header=TRUE,nrows=100,"select * from file where Date in ('1/2/2007','2/2/2007')")

#set up image creation
png("plot3.png",width=480,height=480)

#creating the image
plot(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Sub_metering_1,type="l",ylab="Energy sub metering",col="black",xlab="")
points(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Sub_metering_2,type="l",col="red")
points(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Switch of the device to access the file
dev.off()

