mydata=read.table("./household_power_consumption.txt",sep=";",header = T)
data=subset(mydata,mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007")
View(data)
names(data)

data$Date=as.Date(data$Date,format ="%d/%m/%Y")
data$Time=strptime(data$Time,format ="%H:%M:%S")
dim(data)
data[1:1440,"Time"]<-format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1440:2880,"Time"]<-format(data[1440:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(data$Time,as.numeric(data$Global_active_power),type="l",xlab=" ",
     ylab="Global Active power(kilowatts)")

dev.copy(png,file="plot2.png")
dev.off()
