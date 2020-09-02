data <- read.table("./household_power_consumption.txt", header=T, sep=";", skip = 66636, nrows = 2880)
title <- read.table("./household_power_consumption.txt", header=T, sep=";", nrows=1)
colnames(data) <- colnames(title)
rm(title)
png(file="./plot4.png", width=480, height=480)
v <- paste(data$Date, data$Time)
v <- strptime(v, format = "%d/%m/%Y %H:%M:%S")

#setting par values
par(mfcol = c(2,2))
par(mar= c(3,4,3,4))

#first plot
plot(v, data$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type="l")

#second plot
plot(v, data$Sub_metering_1, xlab="", ylab = "Energy sub metering", type="n")
lines(v, data$Sub_metering_1, col = "black")
lines(v, data$Sub_metering_2, col = "red")
lines(v, data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="_", col = 
           c("black", "red", "blue"), cex = 0.75)

#third plot
plot(v, data$Voltage, xlab = "datetime", ylab = "Voltage", type="l")

#fourth plot
plot(v, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="l")

dev.off()

