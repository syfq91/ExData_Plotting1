mydata=read.table("./household_power_consumption.txt",sep=";",header = T)
data=subset(mydata,mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007")
names(data)

data$Date=as.Date(data$Date,format ="%d/%m/%Y")
data$Time=strptime(data$Time,format ="%H:%M:%S")
dim(data)
data[1:1440,"Time"]<-format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1440:2880,"Time"]<-format(data[1440:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(data$Time,data$Sub_metering_1,type="n",xlab=" ",ylab="Energy sub metering")
with(data,lines(Time,as.numeric(Sub_metering_1)))
with(data,lines(Time,as.numeric(Sub_metering_2),col="red"))
with(data,lines(Time,as.numeric(Sub_metering_3),col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png")
dev.off()
