#Set working directory tothe location where data files arestored
#Create dataFrame
hpcfull<-read.csv("household_power_consumption.txt" , stringsAsFactors = FALSE, sep = ";" , header = TRUE , dec = ".")
#Change Global active power data to numeric
hpcfull$Global_active_power<-as.numeric(hpcfull$Global_active_power)
#Change Date column to Date type
hpcfull$Date<-as.Date(hpcfull$Date, format = "%d/%m/%Y")
# Create data frame of desired subset
hpcsubset<-subset(hpcfull, Date=="2007-02-01" | Date == "2007-02-02")

#  Concate Date and Time column to new datetime column
hpcsubset$datetime<-strptime(paste(hpcsubset$Date,hpcsubset$Time, sep = " "), "%Y-%m-%d %H:%M:%S")


hpcsubset$sm1<-as.numeric(hpcsubset$Sub_metering_1)
hpcsubset$sm2<-as.numeric(hpcsubset$Sub_metering_2)
hpcsubset$sm3<-as.numeric(hpcsubset$Sub_metering_3)


#Define output file and format
png("plot3.png", width=480, height=480)
#Plot 

plot(hpcsubset$datetime, hpcsubset$sm1, type = "l" , xlab ="" , ylab = "Energy Submetering")
lines(hpcsubset$datetime, hpcsubset$sm2, type = "l" , col = "red")
lines(hpcsubset$datetime, hpcsubset$sm3, type = "l" , col = "blue")
legend("topright", c("Sub_metering_1" , "Sun_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red" , "blue"))
dev.off()
