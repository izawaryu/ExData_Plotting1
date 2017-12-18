

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
dt <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=T)
unlink(temp)

dtone <- dt[dt$Date == "1/2/2007",]
dttwo <- dt[dt$Date == "2/2/2007",]
dtsub <- rbind(dtone, dttwo)

Global_Active_Power <- as.numeric(as.character(dtsub$Global_active_power))


png(filename="plot2.png")
plot(Global_Active_Power, type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatt)")
axis(1, at=c("0", "1440", "2880"), labels=c("Thu", "Fri", "Sat"))
dev.off()
