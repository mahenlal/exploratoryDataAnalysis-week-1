#Set working directory tothe location where data files arestored
#Create dataFrame
hpcfull<-read.csv("household_power_consumption.txt" , stringsAsFactors = FALSE, sep = ";" , header = TRUE , dec = ".")
#Change Global active power data to numeric
hpcfull$Global_active_power<-as.numeric(hpcfull$Global_active_power)
#Change Date column to Date type
hpcfull$Date<-as.Date(hpcfull$Date, format = "%d/%m/%Y")
# Create data frame of desired subset
hpcsubset<-subset(hpcfull, Date=="2007-02-01" | Date == "2007-02-02")
#Define output file and format
png("plot1.png", width=480, height=480)
#Plot histogram
hist(hpcsubset$Global_active_power, col = "red" , border = "black" , main = "Global Active Power (kilowatts)" , ylab = "Frequency")
dev.off()