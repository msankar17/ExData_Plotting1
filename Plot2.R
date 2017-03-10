library(sqldf)

#loading only the needed data from the source file
df=read.csv.sql("household_power_consumption.txt",sep=";",header=TRUE,nrows=100,"select * from file where Date in ('1/2/2007','2/2/2007')")

#set up image creation
png("plot2.png",width=480,height=480)

#creating the image
plot(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")

#Switch of the device to access the file
dev.off()

