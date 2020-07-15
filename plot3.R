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
y1 <- conFeb$Sub_metering_1
y2 <- conFeb$Sub_metering_2
y3 <- conFeb$Sub_metering_3

#Plotting Points
plot(x, y1, type= "l", ylab = "Energy sub metering")
points(x, y2, type = "l", col = "red")
points(x, y3, type = "l", col = "blue")

#Adding Legend 
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)


#Creating png
dev.print(png, file = "plot3.png", width = 480, height = 480)
dev.off()