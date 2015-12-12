# Prerequisites:
# download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip")
# unzip(zipfile="household_power_consumption.zip")

# Read in the required subset of the data:
hpc <- read.table(file="household_power_consumption.txt", header=FALSE, sep=";", na.strings="?", colClasses=c(rep("character", times=2), rep("numeric", times=7)), nrows=2880, skip=66637)
# Note: this subset does not contain any NAs.

# Assign column names:
colnames(hpc) <- read.table(file="household_power_consumption.txt", header=FALSE, sep=";", na.strings="?", colClasses=rep("character", times=9), nrows=1, skip=0)

# Open a graphics device of type PNG, and close it after plotting the required graph to it:
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
