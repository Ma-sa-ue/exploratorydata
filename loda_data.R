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
