

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
dt <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=T)
unlink(temp)

dtone <- dt[dt$Date == "1/2/2007",]
dttwo <- dt[dt$Date == "2/2/2007",]
dtsub <- rbind(dtone, dttwo)

Global_Active_Power <- as.numeric(as.character(dtsub$Global_active_power))

png(filename="plot1.png")
hist(Global_Active_Power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
