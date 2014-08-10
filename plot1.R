## Dataset preparation
    
    setwd("~/Documents/R/ExploratoryDA")
    fulldataset         <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
    work_dataset        <- subset(fulldataset, Date == "1/2/2007"  | Date == "2/2/2007")
    
    work_dataset$Date                   <- as.Date(work_dataset$Date, "%d/%m/%y")
    work_dataset$Global_active_power    <- as.numeric(work_dataset$Global_active_power)
    
## Plot 
    png(filename = "plot1.png",  width = 480, height = 480, units = "px")
    
    hist(work_dataset$Global_active_power, freq = TRUE, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")   
    
    dev.off()
    
