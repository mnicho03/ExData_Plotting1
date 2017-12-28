#assumes household_power_consumption.txt file is downloaded and in working dir

# set file name
file <- "household_power_consumption.txt"

# only be using data from the dates 2007-02-01 and 2007-02-02
power <- read.table(file, header = TRUE, sep = ";")
power0207 <- subset(power,  power$Date == "1/2/2007" | power$Date == "2/2/2007")

power0207$Date <- as.Date(power0207$Date)
power0207$Time <-  strptime(power0207$Time, format = "%T")
power0207$Global_active_power <- as.numeric(power0207$Global_active_power)

# create histogram
hist(power0207$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# copy to png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()