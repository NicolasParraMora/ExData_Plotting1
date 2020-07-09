setwd("C:/Users/nparr/Desktop/Cursos Complementarios/Data Science (Johns Hopkins)/4. Exploratory Data Analysis/Course Project 1")
library(dplyr)

# Reading and fixing the data
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE) %>% subset(Date == "1/2/2007" | Date == "2/2/2007")
data <- mutate(data, observation = paste(Date,Time,sep=' '))
data$observation <- strptime(data$observation,"%d/%m/%Y%H:%M:%S")
data[3:8] <- lapply(data[3:8], as.numeric)

#Creating plot
with(data,plot(observation,Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = ""))


## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png",width=480,height=480)
## Closing the PNG device
dev.off()
