library(sqldf)
df=read.csv.sql("C:/Users/Sankar/Documents/exdata_data_household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,nrows=100,"select * from file where Date in ('1/2/2007','2/2/2007')")

plot(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Sub_metering_1,type="l",ylab="Energy sub metering",col="black",xlab="")
points(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Sub_metering_2,type="l",col="red")
points(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))