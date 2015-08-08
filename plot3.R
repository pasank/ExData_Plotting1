printGraph_3 <- function(){

electricaldata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
electricaldata$Timestamp  <- with(electricaldata, strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))

subset_electricaldata <- subset(electricaldata, as.Date(Date, format="%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(Date, format="%d/%m/%Y") <= as.Date("2007-02-02"))


png(filename="plot3.png", width=480, height=480, units="px")

with(subset_electricaldata, plot(Timestamp, as.numeric(as.character(Sub_metering_1)), type="n", xlab="", ylab="Energy sub metering", col="black"))
lines(subset_electricaldata$Timestamp, as.numeric(as.character(subset_electricaldata$Sub_metering_1)))
lines(subset_electricaldata$Timestamp, as.numeric(as.character(subset_electricaldata$Sub_metering_2)), col="red")
lines(subset_electricaldata$Timestamp, as.numeric(as.character(subset_electricaldata$Sub_metering_3)), col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

dev.off()

}