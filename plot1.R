#assumes household_power_consumption.txt file is downloaded and in working dir

# set file name
file <- "household_power_consumption.txt"

# only be using data from the dates 2007-02-01 and 2007-02-02
power <- read.table(file, header = TRUE, sep = ";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power0207 <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]

# clean fields

# power0207$Time <-  strptime(power0207$Time, format = "%T")
power0207[1:1440,"Time"] <- format(power0207[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power0207[1441:2880,"Time"] <- format(power0207[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

power0207$Global_active_power <- as.numeric(power0207$Global_active_power)
power0207$Global_reactive_power <- as.numeric(as.character(power0207$Global_reactive_power))
power0207$Voltage <- as.numeric(as.character(power0207$Voltage))
power0207 <- transform(power0207, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
power0207$Sub_metering_1 <- as.numeric(as.character(power0207$Sub_metering_1))
power0207$Sub_metering_2 <- as.numeric(as.character(power0207$Sub_metering_2))
power0207$Sub_metering_3 <- as.numeric(as.character(power0207$Sub_metering_3))

# create histogram
hist(power0207$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# copy to png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()