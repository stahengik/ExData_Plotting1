

# Reading data from file
dataPwr <- read.table(file.choose(), header = TRUE, sep = ";", na.strings = "?")
# head(dataPwr)

#Set types for Date and Time cols
dataPwr$Date <- as.Date(dataPwr$Date, format = "%d/%m/%Y")
dataPwr$Time <- strptime(dataPwr$Time, format = "%H:%M:%S")

# class(dataPwr$Date)
#class(dataPwr$Time)

#filter data
rdataPwr <- subset(dataPwr, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
rdataPwr$DateTime <- strptime(paste(rdataPwr$Date, rdataPwr$Time), "%Y-%m-%d %H:%M:%S") 
# head(rdataPwr)


#Plot 4

par(mfrow = c(2,2), mar = c(4,4,2,2))

with(rdataPwr, plot(DateTime, Global_active_power, 
                    type = "l",
                    ylab = "Global Active Power (kilowatts)"))

with(rdataPwr, plot(DateTime, Voltage, 
                    type = "l",
                    ylab = "voltage"))


with(rdataPwr, plot(DateTime, Sub_metering_1, 
                    type = "l",
                    ylab = "Energy Sub metering"))
lines(rdataPwr$DateTime, rdataPwr$Sub_metering_2, type = "l", col = "red")
lines(rdataPwr$DateTime, rdataPwr$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1)

with(rdataPwr, plot(DateTime, Global_reactive_power, 
                    type = "l"))
dev.copy(png, file = "Plot4.png", width = 480, height = 480)
dev.off()