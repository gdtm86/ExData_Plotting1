
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

#Plot the histogram of Global Active Power(kilowatts)
plot1 <- hist(february_measurements$Global_active_power)

plot(plot1,
     main = "Global Active Power",
     col = "red",
     xlab = "Global Active Power (kilowatts)")

# save the image as a PNG file with a width of 480 pixels and a height of 480 pixels.
# name of the image is plot1.png

png("plot1.png",
    width = 480,
    height = 480
    )

plot(plot1,
     main = "Global Active Power",
     col = "red",
     xlab = "Global Active Power (kilowatts)")

dev.off()
