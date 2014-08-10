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
        png(filename = "plot3.png",  width = 480, height = 480, units = "px")
        
        
        with(work_dataset, {
            plot(Sub_metering_1~Datetime, type="l",
                 ylab="Global Active Power (kilowatts)", xlab="")
            lines(Sub_metering_2~Datetime,col='Red')
            lines(Sub_metering_3~Datetime,col='Blue')
        })
        
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
               xjust = 1,
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        dev.off()