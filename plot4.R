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
png(filename = './myfigure/plot4.png', width = 480, height = 480, units='px')

## Generating Plot 4: density smooth with matrix (2,2)
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(finalData$SetTime, finalData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(finalData$SetTime, finalData$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, type="l", col="red")
lines(finalData$SetTime, finalData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(finalData$SetTime, finalData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# close device
dev.off()