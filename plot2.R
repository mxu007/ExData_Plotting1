## Read from raw file
Data <- read.csv("../household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")

## Subset the data
Data <- subset(Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Conver dates
datetime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(datetime)

## Plot Graph
plot(Data$Global_active_power~Data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()