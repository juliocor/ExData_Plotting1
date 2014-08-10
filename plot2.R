## Dataset preparation

    setwd("~/Documents/R/ExploratoryDA")
    fulldataset         <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
    work_dataset        <- subset(fulldataset, Date == "1/2/2007"  | Date == "2/2/2007")
    
    work_dataset$Global_active_power    <- as.numeric(work_dataset$Global_active_power)
    
    #weekdays
    work_dataset$Date                   <- as.Date(work_dataset$Date, "%d/%m/%y")
    datetime                            <- paste(as.Date(work_dataset$Date), work_dataset$Time)
    work_dataset$Datetime               <- as.POSIXct(datetime)
    
    
    

## Plot 
    png(filename = "plot2.png",  width = 480, height = 480, units = "px")
    
    plot(work_dataset$Datetime, work_dataset$Global_active_power,  type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"  )
    
    
    dev.off()

