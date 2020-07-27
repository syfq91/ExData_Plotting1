mydata=read.table("./household_power_consumption.txt",sep=";",header = T)
data=subset(mydata,mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007")
View(data)
names(data)

data$Date=as.Date(data$Date,format ="%d/%m/%Y")
data$Time=strptime(data$Time,format ="%H:%M:%S")
dim(data)
data[1:1440,"Time"]<-format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1440:2880,"Time"]<-format(data[1440:2880,"Time"],"2007-02-02 %H:%M:%S")

par(mfrow=c(2,2))

plot(data$Time,as.numeric(data$Global_active_power),type="l",xlab=" ",
     ylab="Global Active power")
plot(data$Time,as.numeric(data$Voltage),type = "l",xlab = "datetime",ylab = "Voltage")

plot(data$Time,data$Sub_metering_1,type="n",xlab=" ",ylab="Energy sub metering")
with(data,lines(Time,as.numeric(Sub_metering_1)))
with(data,lines(Time,as.numeric(Sub_metering_2),col="red"))
with(data,lines(Time,as.numeric(Sub_metering_3),col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.2)

plot(data$Time,as.numeric(data$Global_reactive_power),type = "l",xlab = "datetime",ylab = "Global_Reactive_Power")

dev.copy(png,file="plot4.png")
dev.off()
