setwd("C:/Users/rosliza.MOT/Documents/GitHub/m4w1 asgn/ExData_Plotting1-master")

##Download data from the UC Irvine Machine Learning Repository 
##(https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
if(!file.exists('data.zip')){
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url,destfile = "data.zip")
}
# Unzip dat.zip to household_power_consumption.txt
unzip("data.zip") 

##Read the data in to R
plotData <- read.table("household_power_consumption.txt",header = TRUE, sep= ";", na.strings="?" )

## set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

## Open device
if(!file.exists('myfigure')) dir.create('myfigure')
png(filename = './myfigure/plot3.png', width = 480, height = 480, units='px')

## Generating Plot 3 : density smooth
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col=columnlines[2])
lines(finalData$SetTime, finalData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

# close device
dev.off()