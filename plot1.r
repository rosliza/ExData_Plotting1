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
##
## Open device
if(!file.exists('myfigure')) dir.create('myfigure')
png(filename = './myfigure/plot1.png', width = 480, height = 480, units='px')

## Generating Plot 1
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close device
dev.off()