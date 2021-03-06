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
trange<-range(eleccons$t)
yrange<-range(eleccons[,7])
png(file = "plot3.png", width=480,height=480)
plot(trange,yrange,type="n",xlab="",ylab="Electrical sub metering")
lines(eleccons[,10],eleccons[,7],col="black")
lines(eleccons[,10],eleccons[,8],col="red")
lines(eleccons[,10],eleccons[,9],col="blue")
legend("topright", lty = 1, col = c("black", "red","blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"))
dev.off()