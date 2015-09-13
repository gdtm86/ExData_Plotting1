
# Read the data
# Edit the read.table with appropriate path of the household_power_consumption.txt on your computer
household_power_consumption <- read.table('household_power_consumption.txt',header = TRUE, sep = ';', na.strings = c('NA','?'))

# Clean the data
household_power_consumption_clean <- na.omit(household_power_consumption)
household_power_consumption_clean$Date <- as.Date(household_power_consumption_clean$Date,"%d/%m/%Y")
household_power_consumption_clean$Time <- strptime(paste(household_power_consumption_clean$Date,household_power_consumption_clean$Time), "%Y-%m-%d %H:%M:%S")

# Transform the data
# select the measurements from dates 2007-02-01 and 2007-02-02
february_measurements <- subset(household_power_consumption_clean, Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02') )

#Plot the X-Y plot of Time vs Energy Submetering
plot(february_measurements$Time,february_measurements$Sub_metering_1, type = 'l',
     ylab = "Energy sub metering",
     xlab = "",
     )
points(february_measurements$Time, february_measurements$Sub_metering_2, type = 'l', col = "red")
points(february_measurements$Time, february_measurements$Sub_metering_3, type = 'l', col = "blue")
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = 1, col=c('black','red','blue'))


# save the image as a PNG file with a width of 480 pixels and a height of 480 pixels.
# name of the image is plot3.png

png("plot3.png",
    width = 480,
    height = 480
)

plot(february_measurements$Time,february_measurements$Sub_metering_1, type = 'l',
     ylab = "Energy sub metering",
     xlab = "",
)
points(february_measurements$Time, february_measurements$Sub_metering_2, type = 'l', col = "red")
points(february_measurements$Time, february_measurements$Sub_metering_3, type = 'l', col = "blue")
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = 1, col=c('black','red','blue'))

dev.off()

