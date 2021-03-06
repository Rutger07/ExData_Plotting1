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
png("plot2.png", width =480, height = 480)
with(sub1, 
                plot(Time, 
                Global_active_power, 
                type = "l", 
                xlab = "", 
                ylab = "Global Active Power (kilowatts)"))

dev.off()