mydata=read.table("./household_power_consumption.txt",sep=";",header = T)
data=subset(mydata,mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007")
View(data)
names(data)

hist(as.numeric(data$Global_active_power),col="red",xlab ="Global Active power(kilowatts)",main = "Global Active Power")

dev.copy(png,file="plot1.png")
dev.off()
