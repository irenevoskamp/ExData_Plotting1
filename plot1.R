library(dplyr)
library(lubridate)
#Read in the semi-colon-separated text file to a table
filename = "household_power_consumption.txt"
consumption <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset the data to the two days that are interesting.
twodays <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

#convert the  variables to chart to numeric from factor
globalActivePower <- as.numeric(twodays$Global_active_power)

#open png device
png("plot1.png", width=480, height=480)

#create histogram.
hist(globalActivePower, col = "red", xlab="Global Active Power (kilowatts", ylab="Frequency", main="Global Active Power")
#turn off the png device.
dev.off()

