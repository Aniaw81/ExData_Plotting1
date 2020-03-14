library(dplyr)
library(lubridate)

## This line ensures that days of week are in English
Sys.setlocale("LC_TIME", "English")


##reading table

epc<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE) %>%
  mutate(Date = dmy(Date), Time = hms(Time)) %>%
  filter(Date %in% ymd(c("2007-02-01", "2007-02-02")))%>%
  mutate_at(vars(-Date,-Time), as.numeric) %>%
  mutate(DateTime=as.POSIXct(Date+Time))


## open png device
png(file = "plot3.png")


##create plot and send it to a file
plot(epc$DateTime, epc$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(epc$DateTime, epc$Sub_metering_2, type = "l",col = "red")
lines(epc$DateTime, epc$Sub_metering_3, type = "l",col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



##close png device
dev.off()