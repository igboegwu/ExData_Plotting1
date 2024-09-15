data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", 
                 stringsAsFactors=FALSE)
data_filtered <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data_filtered$DateTime <- strptime(paste(data_filtered$Date, data_filtered$Time), 
                                   format="%d/%m/%Y %H:%M:%S")

png("plot1.png", width=480, height=480)
hist(data_filtered$Global_active_power, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
