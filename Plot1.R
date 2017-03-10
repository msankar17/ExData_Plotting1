library(sqldf)
df=read.csv.sql("C:/Users/Sankar/Documents/exdata_data_household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,nrows=100,"select * from file where Date in ('1/2/2007','2/2/2007')")
hist(df$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency",col="red")