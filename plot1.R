#_____Plot 1____####
# Loading the data set into R
dat <- read.table(file = "household_power_consumption.txt", sep = ";", header = T, na.strings = "?" )

# Convert Date variable to the date/month/year "date" format
library(lubridate)
dat$Date <- dmy(dat$Date)

# Subsetting the large data frame to just the dates of "2007-02-01" & "2007-02-02"
datfeb <- subset(dat, Date == "2007-02-01" | Date == "2007-02-02")

# plot 1 
str(datfeb)
with(datfeb, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power"))

## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
## Close the PNG device
dev.off()
