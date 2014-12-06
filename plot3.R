# Download zip files and unzip
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              temp, method="curl")
data <- read.table(unz(temp, "household_power_consumption.txt"),
                   header=TRUE, sep=";", na.strings = "?",
                   colClasses=c("factor", "factor", "numeric",
                                "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric"))
unlink(temp)

#subseting here
subset <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
subset$Date<-droplevels(subset$Date)
subset$DateTime<-strptime(paste(subset$Date, subset$Time),
                          format = "%d/%m/%Y %H:%M:%S")

# draw plot
png("plot3.png", width=480, height=480)
plot(subset$DateTime, subset$Sub_metering_1, type="l",
     xlab="", ylab="Energe sub metering")
lines(subset$DateTime, subset$Sub_metering_2, col="red")
lines(subset$DateTime, subset$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

dev.off()