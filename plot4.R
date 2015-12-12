# Prerequisites:
# install.packages("lubridate")
# download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip")
# unzip(zipfile="household_power_consumption.zip")

# Load the lubridate library:
library(lubridate)

# Set the locale:
Sys.setlocale("LC_TIME", "en_GB.utf8")

# Read in the required subset of the data:
hpc <- read.table(file="household_power_consumption.txt", header=FALSE, sep=";", na.strings="?", colClasses=c(rep("character", times=2), rep("numeric", times=7)), nrows=2880, skip=66637)
# Note: this subset does not contain any NAs.

# Assign column names:
colnames(hpc) <- read.table(file="household_power_consumption.txt", header=FALSE, sep=";", na.strings="?", colClasses=rep("character", times=9), nrows=1, skip=0)

# Create a column combining date and time:
hpc$DateTime <- dmy_hms(paste(hpc$Date, hpc$Time))

# Open a graphics device of type PNG, and close it after plotting the required graph to it:
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfcol = c(2,2))
with(hpc, plot(DateTime, Global_active_power, col="black", type="l", xlab="", ylab="Global Active Power"))
with(hpc, plot(DateTime, Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering"))
with(hpc, lines(DateTime, Sub_metering_2, col="red"))
with(hpc, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(hpc, plot(DateTime, Voltage, col="black", type="l", xlab="datetime", ylab="Voltage"))
with(hpc, plot(DateTime, Global_reactive_power, col="black", type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()
