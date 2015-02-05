Sys.setlocale("LC_TIME", "English")

#library for reading data into R

library(sqldf)

#read the data from the dates 2007-02-01 and 2007-02-02 
con <- "data/household_power_consumption.txt"
data <- read.csv.sql(con,header = TRUE, sep =";",
sql = "Select*from file where Date ='1/2/2007' OR Date='2/2/2007'")

#convert the Date and Time variables to Date/Time classes in R
data$Date <- as.Date(data$Date, format("%d/%m/%Y"))
data$Date <- as.Date(format(data$Date, "%Y-%m-%d"))
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <-strptime(data$DateTime, "%Y-%m-%d %H:%M:%S", tz = "GMT")

#Construct the plot2
plot(data$DateTime,data$Global_active_power,type="l",xlab = " ",
ylab="Global Active Power (kilowatts)")

#Save the plot2 to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png,width = 480, height = 480,units = "px", file ="plot2.png")
dev.off()

