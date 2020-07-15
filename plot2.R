#Reading the data into a dataframe
fulldf <- read.csv("household_power_consumption.txt", sep = ";")
conFeb <- subset(fulldf, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3 )

#Getting the specific data
conFeb$Date <- paste(conFeb$Date, conFeb$Time)
date <- conFeb$Date
date <- gsub(pattern = c("/"), replacement = c("-"), date)

#Converting Variables
Date <- strptime(date, format = "%d-%m-%Y %H:%M:%S")
x <- Date
y <- as.numeric(conFeb$Global_active_power)

#Plotting Graph
plot(x, y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Creating png
dev.print(png, file = "plot2.png", width = 480, height = 480)
dev.off()