data <- read.csv2("household_power_consumption.txt", comment.char="", na.strings=c("?"))

data$dateTime <- paste(data$Date, data$Time)

data$dateTime <- strptime(data$dateTime, "%d/%m/%Y %H:%M:%S")

data2 <- subset(data, dateTime <="2007-02-03")

data3 <- subset(data2, dateTime >= "2007-02-01")

data3$weekday <- weekdays(data3$dateTime, abbreviate=TRUE)

png(filename="plot3.png", width=480, height=480)

plot(as.numeric(as.character(data3$Sub_metering_1)), type="l", xaxt="n", ylab="Energy sub metering", xlab="")
lines(as.numeric(as.character(data3$Sub_metering_2)), type="l", col="red")
lines(as.numeric(as.character(data3$Sub_metering_3)), type="l", col="blue")
axis(1, at=c(1,length(data3$weekday)), labels=c(data3$weekday[1], data3$weekday[length(data3$weekday)]))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), pch=c('-','-','-'))

dev.off()

