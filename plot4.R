# zip file is supposed to be extracted to the current directory 
# The first read of 2 rows is just to get the columns names 
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",as.is=TRUE,nrow=2)
# The second read has nrow =2x24x60=2880 and a skip=66637 evaluated by looking at the extracted file "household_power_consumption.txt" 
data2 <- read.table("household_power_consumption.txt",header=FALSE,sep=";",as.is=TRUE,skip=66637,nrow=2880)
names(data2) <- names(data)
datetime <- strptime(paste(data2$Date,data2$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
data2 <- data2[,3:9]
data2 <- cbind(datetime,data2)
png(file="plot4.png",height=480,width=480)
par(mfrow=c(2,2))
plot(data2$datetime,data2$Global_active_power,type="l",xlab="",ylab="Global Active Power (Kilowatts)",pch=19,cex=0.5)
plot(datetime,data2$Voltage,type="l",ylab="Voltage",pch=19,col="black")
plot(data2$datetime,data2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metring",pch=19,col="black")
lines(data2$datetime,data2$Sub_metering_2,type="l",col="red")
lines(data2$datetime,data2$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1) 
plot(datetime,data2$Global_reactive_power,type="l",ylab="Global_reactive_power",pch=19,col="black")
dev.off()
