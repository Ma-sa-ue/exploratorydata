##read data
a1<-read.table("household.txt",sep=";",header=TRUE,na="?")
a1<-subset(a1,a1$Date=="1/2/2007"|a1$Date=="2/2/2007")
a1$Date<-as.character(a1$Date)
a1$Date<-as.Date(a1$Date,"%d/%m/%Y")

## convert date and time into POSIXlt class
for(i in 1:2880){
  d=sprintf("%s %s",a1[i,1],a1[i,2])
  d=as.POSIXlt(d)
  if(i==1){
    g<-c(d)
  }
  else{
    g<-c(g,d)
  }
}

##plot4.R

par(mfrow=c(2,2),mar=c(4.0,4.0,2.0,4.0))
plot(g,a1$Global_active_power,type="l",ylab="Global Active Power")
plot(g,a1$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(g,a1$Sub_metering_1,ylab="Energy sub metering",type="l")
lines(g,a1$Sub_metering_2,col="red",ylab="")
lines(g,a1$Sub_metering_3,col="blue",ylab="")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 2,cex=0.7)
plot(g,a1$Global_reactive_power,xlab="datetime",type="l")
dev.copy(png,file="plot4.png")
dev.off()
