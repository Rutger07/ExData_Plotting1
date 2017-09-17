#problem1: load data
all_data_raw <- read.table("household_power_consumption.txt", 
                           header = TRUE, sep = ";", 
                           colClasses = c(rep("character", 2), rep("numeric", 7)),
                           na = "?")
all_data <- all_data_raw

#problem2: subset data based on date-column
sub1 <- all_data[as.Date(all_data$Date, "%d/%m/%Y") >= "2007-02-01" 
                 & as.Date(all_data$Date, "%d/%m/%Y") <= "2007-02-02",]

# problem 4: for the x-axis: combine Date (column1) and Time (column2) into 1 column
# y-axis ('Global Active Power (kilowatts)') already documented per minute (column3)
sub1$Time <- strptime(paste(sub1$Date, sub1$Time), "%d/%m/%Y %H:%M:%S")

# problem 5: plot


png("plot4.png", width =480, height = 480)
par(mfcol = c(2,2))
##1
with(sub1, 
     plot(Time, 
          Global_active_power, 
          type = "l", 
          xlab = "", 
          ylab = "Global Active Power (kilowatts)"))
##2
with(sub1, plot(Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(sub1, lines(Time, Sub_metering_2, col = "red", type = "l"))
with(sub1, lines(Time, Sub_metering_3, col = "blue", type = "l"))
legend("topright", 
       bty = "n",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

##3
with(sub1, plot(Time, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))
##4
with(sub1, plot(Time, Global_reactive_power, xlab = "datetime", type = "l"))

dev.off()