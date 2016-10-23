#Read the whole dataset and format columns
dataset <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na="?")
dataset$Time <- strptime(paste(dataset$Date, dataset$Time),"%d/%m/%Y %H:%M:%S")
dataset$Date <- as.Date(dataset$Date,"%d/%m/%Y")

#Subset the target rows
selectedRows <- as.Date(c("2007-02-01","2007-02-02"),"%Y-%m-%d")
dataset <- subset(dataset, Date %in% selectedRows)

#Reconstruct Plot 4
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))

plot(dataset$Time, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(dataset$Time, dataset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(dataset$Time, dataset$Sub_metering_2, col="red")
lines(dataset$Time, dataset$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"),lty = 1, cex = 0.5)

plot(dataset$Time, dataset$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

plot(dataset$Time, dataset$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(dataset$Time, dataset$Global_reactive_power)

dev.off()
