library(sqldf)
df=read.csv.sql("C:/Users/Sankar/Documents/exdata_data_household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,nrows=100,"select * from file where Date in ('1/2/2007','2/2/2007')")
plot(as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"),df$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")