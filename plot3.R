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

##plot3.R
plot(g,a1$Sub_metering_1,ylim=c(0,30),type="l",ylab="Energy sub metering")
lines(g,a1$Sub_metering_2,col="red")
lines(g,a1$Sub_metering_3,col="blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 2)
dev.copy(png,file="plot3.png")
dev.off()

