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


# draw histgram 
png("plot1.png", width=480, height=480)
hist(subset$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()