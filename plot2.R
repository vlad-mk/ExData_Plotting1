if(! exists("h2") || dim(h2) != c(2880,9)) {
  
  #read a data file from a local directory
  if(file.exists("household_power_consumption.txt")) {
    print("reading file")
    hpc <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  } else {
    print("loading file")
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
    hpc <- read.csv(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE, na.strings = "?")
    unlink(temp)
    
  }
  hpc$Time <- strptime(paste(hpc$Date, hpc$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
  hpc$Date <- as.Date(hpc$Date , "%d/%m/%Y")
  #Sys.setlocale("LC_TIME", "en_US.UTF-8")
  
  h2 <- subset(hpc , Date >= "2007-02-01" & Date  <= "2007-02-02")
} else {print("data alreade loaded")}
dim(h2)

# make image
png(filename = 'plot2.png', width = 480, height = 480, units = 'px')
with(h2, plot(Time, Global_active_power, xlab="", 
              ylab = "Global Active Power (kilowatts)", type = "l" ))
dev.off()
