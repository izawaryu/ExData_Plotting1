

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
dt <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=T)
unlink(temp)

dtone <- dt[dt$Date == "1/2/2007",]
dttwo <- dt[dt$Date == "2/2/2007",]
dtsub <- rbind(dtone, dttwo)

sm1 <- as.numeric(as.character(dtsub$Sub_metering_1))
sm2 <- as.numeric(as.character(dtsub$Sub_metering_2))
sm3 <- as.numeric(as.character(dtsub$Sub_metering_3))

png(filename="plot3.png")

plot(sm1, type="l", xaxt="n", xlab="", ylab="Energy sub metering", ylim=c(1,40))
par(new=T)
plot(sm2, type="l", xaxt="n", xlab="", ylab="Energy sub metering", ylim=c(1,40), col="red")
par(new=T)
plot(sm3, type="l", xaxt="n", xlab="", ylab="Energy sub metering", ylim=c(1,40), col="blue")

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1, 1), 
       col=c("black", "red", "blue"))

axis(1, at=c("0", "1440", "2880"), labels=c("Thu", "Fri", "Sat"))
dev.off()
