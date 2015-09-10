eleccons<-read.table("household_power_consumption.txt", 
                     header=TRUE, sep=";",skip=66636, nrows=2880)
summary(eleccons)
hist(eleccons[,3],density=1000, col="red",border="black",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", main = NULL)
title(main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
