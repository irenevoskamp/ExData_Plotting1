#Read in the semi-colon-separated text file to a table
library(dplyr)
library(lubridate)
filename = "household_power_consumption.txt"
consumption <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, na.string = "?", dec=".")
#subset the data to the two days that are interesting.
twodays <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(twodays$Date, twodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#convert the  variables to chart to numeric from factor
submetering1 <- as.numeric(twodays$Sub_metering_1)
submetering2 <- as.numeric(twodays$Sub_metering_2)
submetering3 <- as.numeric(twodays$Sub_metering_3)

#open png device
png("plot3.png", width=480, height=480)
plot(datetime, submetering1, col = "black", type="l", xlab="", ylab="Energy sub monitoring")
lines(datetime, submetering2, col = "red")
lines(datetime, submetering3, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c("1","1","1"), col=c("black", "red", "blue"), y.intersp = 2)

dev.off()



