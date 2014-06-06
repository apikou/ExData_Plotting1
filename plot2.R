# zip file is supposed to be extracted to the current directory 
# The first read of 2 rows is just to get the columns names 
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",as.is=TRUE,nrow=2)
# The second read has nrow =2x24x60=2880 and a skip=66637 evaluated by looking at the extracted file "household_power_consumption.txt"
data2 <- read.table("household_power_consumption.txt",header=FALSE,sep=";",as.is=TRUE,skip=66637,nrow=2880)
names(data2) <- names(data)
datetime <- strptime(paste(data2$Date,data2$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
data2 <- data2[,3:9]
data2 <- cbind(datetime,data2)
png(file="plot2.png",height=480,width=480)
plot(data2$datetime,data2$Global_active_power,type="l",xlab="",ylab="Global Active Power (Kilowatts)",pch=19,cex=0.5)
#png(file="plot1.png",height=480,width=480)
dev.off()