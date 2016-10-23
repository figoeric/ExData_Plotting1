#Read the whole dataset and format columns
dataset <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na="?")
dataset$Time <- strptime(paste(dataset$Date, dataset$Time),"%d/%m/%Y %H:%M:%S")
dataset$Date <- as.Date(dataset$Date,"%d/%m/%Y")

#Subset the target rows
selectedRows <- as.Date(c("2007-02-01","2007-02-02"),"%Y-%m-%d")
dataset <- subset(dataset, Date %in% selectedRows)

#Reconstruct Plot 1
png("plot1.png", width = 400, height = 400)
hist(dataset$Global_active_power, main = "Global Active Power", xlab="Global Active Power (Kilowatts)", ylab = "Frequency", col="red")
dev.off()
