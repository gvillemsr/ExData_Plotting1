eleccons<-read.table("household_power_consumption.txt", 
                     header=TRUE, sep=";",skip=66636, nrows=2880)
summary(eleccons)
tit<-read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)
get.names<-names(tit)
names(eleccons)<-get.names
summary(eleccons)
with(eleccons, plot(Time, Global_active_power, main = NULL, type = "n"))
plot(eleccons[,2], eleccons[,8], col="red")
plot(eleccons[,2], eleccons[,9], col="blue")
legend("topright", lty = 1, col = c("black", "red","blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()