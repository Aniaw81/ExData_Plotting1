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
png(file = "plot2.png")


##create plot and send it to a file
plot(epc$DateTime, epc$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")



##close png device
dev.off()
