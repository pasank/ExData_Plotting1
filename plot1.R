printGraph_1 <- function(){

electricaldata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
electricaldata$Timestamp  <- with(electricaldata, strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))

subset_electricaldata <- subset(electricaldata, as.Date(Date, format="%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(Date, format="%d/%m/%Y") <= as.Date("2007-02-02"))

png(filename="plot1.png", width=480, height=480, units="px")
hist(as.numeric(as.character(subset_electricaldata$Global_active_power)), breaks=13, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
dev.off()
}