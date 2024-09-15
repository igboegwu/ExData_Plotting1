# Read the data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", 
                 stringsAsFactors=FALSE)

# Filter for the dates 2007-02-01 and 2007-02-02
data_filtered <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Create a datetime variable by combining Date and Time
data_filtered$DateTime <- strptime(paste(data_filtered$Date, data_filtered$Time), 
                                   format="%d/%m/%Y %H:%M:%S")

# Set up a 2x2 plotting layout
png("plot4.png", width=480, height=480)  # Save the plot as a PNG
par(mfrow=c(2, 2))  # 2x2 layout

# Plot 1: Global Active Power
plot(data_filtered$DateTime, data_filtered$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power", 
     main="Global Active Power")

# Plot 2: Voltage
plot(data_filtered$DateTime, data_filtered$Voltage, type="l", 
     xlab="DateTime", ylab="Voltage", 
     main="Voltage")

# Plot 3: Sub-metering
plot(data_filtered$DateTime, data_filtered$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy Sub-metering", 
     main="Energy Sub-metering")
lines(data_filtered$DateTime, data_filtered$Sub_metering_2, col="red")
lines(data_filtered$DateTime, data_filtered$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)

# Plot 4: Global Reactive Power
plot(data_filtered$DateTime, data_filtered$Global_reactive_power, type="l", 
     xlab="DateTime", ylab="Global Reactive Power", 
     main="Global Reactive Power")

dev.off()  # Close the plotting device
