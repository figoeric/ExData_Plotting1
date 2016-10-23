#Read the whole dataset and format columns
dataset <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na="?")
dataset$Time <- strptime(paste(dataset$Date, dataset$Time),"%d/%m/%Y %H:%M:%S")
dataset$Date <- as.Date(dataset$Date,"%d/%m/%Y")

#Subset the target rows
selectedRows <- as.Date(c("2007-02-01","2007-02-02"),"%Y-%m-%d")
dataset <- subset(dataset, Date %in% selectedRows)

#Reconstruct Plot 3
png("plot3.png", width = 400, height = 400)
plot(dataset$Time, dataset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(dataset$Time, dataset$Sub_metering_2, col="red")
lines(dataset$Time, dataset$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"),lty = 1)
dev.off()
