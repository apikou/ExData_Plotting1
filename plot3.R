# zip file is supposed to be extracted to the current directory 
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",as.is=TRUE,nrow=2)
data2 <- read.table("household_power_consumption.txt",header=FALSE,sep=";",as.is=TRUE,skip=66637,nrow=2880)
names(data2) <- names(data)
datetime <- strptime(paste(data2$Date,data2$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
data2 <- data2[,3:9]
data2 <- cbind(datetime,data2)
png(file="plot3.png",height=480,width=480)
plot(data2$datetime,data2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metring",pch=19,col="black")
lines(data2$datetime,data2$Sub_metering_2,type="l",col="red")
lines(data2$datetime,data2$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1) 
dev.off()