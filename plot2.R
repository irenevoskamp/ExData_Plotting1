#Read in the semi-colon-separated text file to a table
library(dplyr)
library(lubridate)
filename = "household_power_consumption.txt"
consumption <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset the data to the two days that are interesting.
twodays <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(twodays$Date, twodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#convert the  variables to chart to numeric from factor
globalActivePower <- as.numeric(twodays$Global_active_power)

#open png device
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()



