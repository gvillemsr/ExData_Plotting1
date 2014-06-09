eleccons<-read.table("household_power_consumption.txt", 
                     header=TRUE, sep=";",skip=66636, nrows=2880)
summary(eleccons)
tit<-read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)
get.names<-names(tit)
names(eleccons)<-get.names
summary(eleccons)
eleccons$t <- strptime(paste(eleccons$Date, eleccons$Time), "%d/%m/%Y %H:%M:%S")
summary(eleccons)
png(file = "plot4.png", width=480,height=480)
par(mfrow = c(2,2), mar = c(4,4,5,2))
plot(eleccons[,10], eleccons[,3], main = NULL, 
     xlab="", ylab="Global Active Power", cex=0.4,type="l")
plot(eleccons[,10], eleccons[,5], main = NULL, xlab="datetime", ylab="Voltage", type="l",
     cex=0.4)
trange<-range(eleccons$t)
yrange<-range(eleccons[,7])
plot(trange,yrange,type="n",xlab="",ylab="Electrical sub metering",cex=0.4)
lines(eleccons[,10],eleccons[,7],col="black")
lines(eleccons[,10],eleccons[,8],col="red")
lines(eleccons[,10],eleccons[,9],col="blue")
legend("topright", lty = 1, col = c("black", "red","blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"),cex=0.8,bty="n")
plot(eleccons[,10], eleccons[,4], main = NULL, xlab="datetime", 
     ylab="Global_reactive_power", cex=0.4,type="l")
dev.off()