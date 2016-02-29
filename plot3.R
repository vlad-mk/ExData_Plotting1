
#read data file from a local directory
hpc <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc$Time <- strptime(paste(hpc$Date, hpc$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date , "%d/%m/%Y")
#Sys.setlocale("LC_TIME", "en_US.UTF-8")

h2 <- subset(hpc , Date >= "2007-02-01" & Date  <= "2007-02-02")

png(filename = 'plot3.png', width = 480, height = 480, units = 'px')

plot(h2$Time, h2$Sub_metering_1, xlab="", ylab = "Energy sub metering", type = "n" )
points(h2$Time, h2$Sub_metering_1, col = "black", type = 'l')
points(h2$Time, h2$Sub_metering_2, col = "red", type = 'l')
points(h2$Time, h2$Sub_metering_3, col = "blue", type = 'l')
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
