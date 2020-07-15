#Reading the data into a dataframe
fulldf <- read.csv("household_power_consumption.txt", sep = ";")
conFeb <- subset(fulldf, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3 )

#Getting the specific data
x <- as.numeric(conFeb$Global_active_power)

#Creating the graph
hist(x, col = "red", xlab = "Global Acttive Power (kilowatts)",  main = "Global Active Power")

#Creating png
dev.print(png, file = "plot1.png", width = 480, height = 480)
dev.off()
