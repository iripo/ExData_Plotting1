setwd("H:/coursR/Exploratory")
Sys.setlocale("LC_TIME", "English")
library(sqldf)
con <- "data/household_power_consumption.txt"
data <- read.csv.sql(con,header = TRUE, sep =";",
sql = "Select*from file where Date ='1/2/2007' OR Date='2/2/2007'")
data$Date <- as.Date(data$Date, format("%d/%m/%Y"))
data$Date <- as.Date(format(data$Date, "%Y-%m-%d"))
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <-strptime(data$DateTime, "%Y-%m-%d %H:%M:%S", tz = "GMT")
hist(data$Global_active_power,main = "Global Active Power",
xlab="Global Active Power (kilowatts)",col="red")
dev.copy(png,width = 480, height = 480,units = "px", file ="plot1.png")
dev.off()
plot(data$DateTime,data$Global_active_power,type="l",xlab = " ",
ylab="Global Active Power (kilowatts)")
dev.copy(png,width = 480, height = 480,units = "px", file ="plot2.png")
dev.off()
plot(data$DateTime,data$Sub_metering_1,type="l",xlab = " ", 
ylab="Energy sub metering", col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", lty = 1, lwd =1, col = c("black","red","blue"), 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
text.width = strwidth("1,000,000,000,000"))
dev.copy(png,width = 480, height = 480,units = "px", file ="plot3.png")
dev.off()
par(mfrow = c(2, 2),cex = 0.6, cex.axis = 0.6)
plot(data$DateTime,data$Global_active_power,type="l",xlab = " ",
ylab="Global Active Power")
plot(data$DateTime,data$Voltage ,type="l",xlab = "datetime", ylab="Voltage")
plot(data$DateTime,data$Sub_metering_1,type="l",xlab = " ", 
ylab="Energy sub metering", col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright","inset"=.02, lty = 1, lwd =0,5, col = c("black","red","blue"), 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
text.width = strwidth("1,000,000,000,000"), box.col = "NA")
plot(data$DateTime,data$Global_reactive_power,type="l",xlab = "datetime",
ylab="Global_reactive_power")
dev.copy(png,width = 480, height = 480,units = "px", file ="plot4.png")
dev.off()

