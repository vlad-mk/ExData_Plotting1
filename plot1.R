
#read data file from a local directory
hpc <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc$Time <- strptime(paste(hpc$Date, hpc$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date , "%d/%m/%Y")
#Sys.setlocale("LC_TIME", "en_US.UTF-8")

h2 <- subset(hpc , Date >= "2007-02-01" & Date  <= "2007-02-02")

png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
hist(h2$Global_active_power, col = "red", main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
