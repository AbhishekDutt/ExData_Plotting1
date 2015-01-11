data <- read.csv2("household_power_consumption.txt", comment.char="", na.strings=c("?"))

data$dateTime <- paste(data$Date, data$Time)

data$dateTime <- strptime(data$dateTime, "%d/%m/%Y %H:%M:%S")

data2 <- subset(data, dateTime <="2007-02-03")

data3 <- subset(data2, dateTime >= "2007-02-01")

data3$weekday <- weekdays(data3$dateTime, abbreviate=TRUE)

png(filename="plot2.png", width=480, height=480)

plot(as.numeric(as.character(data3$Global_active_power)), type="l", xaxt="n", ylab="Global Active Power (kilowatts)", xlab="")

axis(1, at=c(1,length(data3$weekday)), labels=c(data3$weekday[1], data3$weekday[length(data3$weekday)]))

dev.off()
