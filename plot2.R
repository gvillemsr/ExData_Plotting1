eleccons<-read.table("household_power_consumption.txt", 
                     header=TRUE, sep=";",skip=66636, nrows=2880)
#Just reading the two days worth of data
summary(eleccons)
tit<-read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)
get.names<-names(tit)
names(eleccons)<-get.names
summary(eleccons)
eleccons$t <- strptime(paste(eleccons$Date, eleccons$Time), "%d/%m/%Y %H:%M:%S")
summary(eleccons)
plot(eleccons[,10], eleccons[,3], 
     main = NULL, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.copy(png, file = "plot2.png")
dev.off()