library(dplyr)
library(lubridate)

##reading table

epc<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE) %>%
  mutate(Date = dmy(Date), Time = hms(Time)) %>%
  filter(Date %in% ymd(c("2007-02-01", "2007-02-02")))%>%
  mutate_at(vars(-Date,-Time), as.numeric)


## open png device
png(file = "plot1.png")

##create plot and send it to a file
hist(epc$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)") 

##close png device
dev.off()



