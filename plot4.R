#Reading the data into a dataframe
fulldf <- read.csv("household_power_consumption.txt", sep = ";")
conFeb <- subset(fulldf, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3 )

#Getting the specific data
conFeb$Date <- paste(conFeb$Date, conFeb$Time)
date <- conFeb$Date
date <- gsub(pattern = c("/"), replacement = c("-"), date)

#Converting Variables
Date <- strptime(date, format = "%d-%m-%Y %H:%M:%S")

#Assigning Variables
x <- Date
subM1 <- conFeb$Sub_metering_1
subM2 <- conFeb$Sub_metering_2
subM3 <- conFeb$Sub_metering_3

GlobalApower <- as.numeric(conFeb$Global_active_power)
GlobalRPower <- as.numeric(conFeb$Global_reactive_power)
voltage <- as.numeric(conFeb$Voltage)


#Plotting Points
par(mfrow = c(2, 2))
#Graph 1
plot(x, GlobalApower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Graph 2
plot(x, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Graph 3
plot(x, y1, type= "l", xlab = "" , ylab = "Energy sub metering")
points(x, y2, type = "l", col = "red")
points(x, y3, type = "l", col = "blue")

#Adding Legend 
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.6)

#Graph 4
plot(x, GlobalRPower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Creating png
dev.print(png, file = "plot4.png", width = 480, height = 480)
dev.off()
