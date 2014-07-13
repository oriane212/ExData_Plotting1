#read the data
d <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
FebSubset <- subset(d, d$Date == "1/2/2007" | d$Date== "2/2/2007")
dates <- as.POSIXct(paste(FebSubset$Date,FebSubset$Time),format ="%d/%m/%Y %H:%M:%S")

#plot 4 to a PNG file
png(filename="plot4.png")
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(2,1,1,1))
plot(dates, FebSubset$Global_active_power, type = "line", xlab = "", ylab = "Global Active Power", cex.lab=0.75, cex.axis=0.75)
plot(dates, FebSubset$Voltage, type = "line", col="black", xlab = "datetime", ylab = "Voltage", cex.lab=0.75, cex.axis=0.75)
plot(dates, FebSubset$Sub_metering_1, type = "line", col="black", xlab = "", ylab = "Energy sub metering", cex.lab=0.75, cex.axis=0.75)
lines(dates, FebSubset$Sub_metering_2, col="red")
lines(dates, FebSubset$Sub_metering_3, col="blue")
legend("topright", lty = "solid", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.5, bty="n")
plot(dates, FebSubset$Global_reactive_power, type = "line", col="black", xlab = "datetime", ylab = "Global_reactive_power", cex.lab=0.75, cex.axis=0.75)
dev.off()
