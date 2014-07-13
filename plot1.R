#read the data
d <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
FebSubset <- subset(d, d$Date == "1/2/2007" | d$Date== "2/2/2007")

#plot 1 to a PNG file
png(filename="plot1.png")
hist(as.numeric(FebSubset$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red", breaks=16, cex.lab=0.75, cex.axis=0.75, cex.main=0.85)
dev.off()