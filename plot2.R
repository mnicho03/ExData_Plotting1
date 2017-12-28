# assuming file ("household_power_consumption.txt") is downloaded and subsetted for only data from the dates 2007-02-01 and 2007-02-02

# create line plot
plot(power0207$timestamp,power0207$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

# copy to png file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()