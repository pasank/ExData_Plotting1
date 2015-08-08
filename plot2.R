printGraph_2 <- function(){

electricaldata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
electricaldata$Timestamp  <- with(electricaldata, strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))

subset_electricaldata <- subset(electricaldata, as.Date(Date, format="%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(Date, format="%d/%m/%Y") <= as.Date("2007-02-02"))


png(filename="plot2.png", width=480, height=480, units="px")
with(subset_electricaldata, plot(Timestamp, as.numeric(as.character(Global_active_power)), type="n", xlab="", ylab="Global Active Power (kilowatts)"))
lines(subset_electricaldata$Timestamp, as.numeric(as.character(subset_electricaldata$Global_active_power)))
dev.off()

}