data <- read.csv2("household_power_consumption.txt", comment.char="", na.strings=c("?"))

data$dateTime <- paste(data$Date, data$Time)

data$dateTime <- strptime(data$dateTime, "%d/%m/%Y %H:%M:%S")

data2 <- subset(data, dateTime <="2007-02-03")

data3 <- subset(data2, dateTime >= "2007-02-01")

png(filename="plot1.png", width=480, height=480)

hist(as.numeric(as.character(data3$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
