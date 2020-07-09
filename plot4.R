setwd("C:/Users/nparr/Desktop/Cursos Complementarios/Data Science (Johns Hopkins)/4. Exploratory Data Analysis/Course Project 1")
library(dplyr)

# Reading and fixing the data
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE) %>% subset(Date == "1/2/2007" | Date == "2/2/2007")
data <- mutate(data, observation = paste(Date,Time,sep=' '))
data$observation <- strptime(data$observation,"%d/%m/%Y%H:%M:%S")
data[3:8] <- lapply(data[3:8], as.numeric)

par(mfrow=c(2,2))

#Creating plot 1
with(data,plot(observation,Global_active_power,type = "l",ylab = "Global Active Power",xlab = ""))

#Creating plot 2
with(data,plot(observation,Voltage,type = "l",ylab = "Voltage",xlab = "datetime"))

#Creating plot 3
with(data,plot(observation,Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = ""))
with(data,lines(observation,Sub_metering_2,col='red'))
with(data,lines(observation,Sub_metering_3,col='blue'))
legend("topright",lty=1,col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty = "n")

#Creating plot 1
with(data,plot(observation,Global_reactive_power,type = "l",ylab = "Global_reactive_power",xlab = "datetime"))

## Copy my plot to a PNG file
dev.copy(png, file = "plot4.png",width=480,height=480)
## Closing the PNG device
dev.off()
