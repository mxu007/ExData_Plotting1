# Read the data from raw file
Data <- read.csv("../household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")

# Subset Data
Data <- subset(Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


datetime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(datetime)


# Plot the graph
hist(Data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()