dat <- read.table(file = "household_power_consumption.txt", sep = ";", header = T, na.strings = "?" )

# Convert Date variable to the date/month/year "date" format
library(lubridate)
dat$Date <- dmy(dat$Date)

# Subsetting the large data frame to just the dates of "2007-02-01" & "2007-02-02"
datfeb <- subset(dat, Date == "2007-02-01" | Date == "2007-02-02")



# merge date and time variables 
datfeb$date_time <- as.POSIXct(paste(datfeb$Date, datfeb$Time))


# plot 4

png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# plot 4 (a)
with(datfeb, plot(Global_active_power~date_time, ylab = "Global Active Power",  type="l", xlab = " "))

# plot 4 (b)
with(datfeb, plot(Voltage~date_time, ylab = "Voltage",  type="l", xlab = "datetime"))

# plot 4 (c)
plot(datfeb$date_time, datfeb$Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub meeting")

# add lines
lines(datfeb$date_time, datfeb$Sub_metering_1, col = "black")
lines(datfeb$date_time, datfeb$Sub_metering_2, col = "red")
lines(datfeb$date_time, datfeb$Sub_metering_3, col = "blue")

# Add legend 
legend("topright",col=c("black", "blue","red"), lty=1, legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex = 0.7, bty = "n", text.col = "black")

# plot 4 (d)
with(datfeb, plot(Global_reactive_power~date_time, ylab = "Global_reactive_power",  type="l", xlab = "datetime"))



## Close the PNG device
dev.off()
