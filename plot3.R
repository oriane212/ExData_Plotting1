#read the data
d <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
FebSubset <- subset(d, d$Date == "1/2/2007" | d$Date== "2/2/2007")
dates <- as.POSIXct(paste(FebSubset$Date,FebSubset$Time),format ="%d/%m/%Y %H:%M:%S")

#plot 3 to a PNG file
png(filename="plot3.png")
plot(dates, FebSubset$Sub_metering_1, type = "line", col="black", xlab = "", ylab = "Energy sub metering", cex.lab=0.75, cex.axis=0.7)
lines(dates, FebSubset$Sub_metering_2, col="red")
lines(dates, FebSubset$Sub_metering_3, col="blue")
legend(x = "topright", lty = "solid", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.75)
dev.off()