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

#Define output file and format
png("plot2.png", width=480, height=480)
#Plot 
plot(hpcsubset$datetime, hpcsubset$Global_active_power, type = "l" , xlab = "Global Active Power (kilowatts)")
dev.off()