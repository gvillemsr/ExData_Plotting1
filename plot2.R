eleccons<-read.table("household_power_consumption.txt", 
                     header=TRUE, sep=";",skip=66636, nrows=2880)
summary(eleccons)
plot(eleccons[,2], eleccons[,3], main = NULL, ylab="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()