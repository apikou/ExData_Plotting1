# zip file is supposed to be extracted to the current directory 
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",as.is=TRUE,nrow=2)
data2 <- read.table("household_power_consumption.txt",header=FALSE,sep=";",as.is=TRUE,skip=66637,nrow=2880)
names(data2) <- names(data)
datetime <- strptime(paste(data2$Date,data2$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
data2 <- data2[,3:9]
data2 <- cbind(datetime,data2)
#data2 <- data.frame(datetime,data3)
png(file="plot2.png",height=480,width=480)
plot(data2$datetime,data2$Global_active_power,xlab="",ylab="Global Active Power (Kilowatts)")
#png(file="plot1.png",height=480,width=480)
dev.off()