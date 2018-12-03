
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
head(rdataPwr)


# Plot 1
with(rdataPwr, hist(Global_active_power, 
                    col = "red", 
                    main = "Global Active Power", 
                    xlab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "Plot1.png", width = 480, height = 480)
dev.off()




