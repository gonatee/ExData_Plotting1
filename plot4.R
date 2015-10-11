dat <- read.csv('./download/household_power_consumption.txt',header = TRUE,sep = ';',na.strings = '?')
dat2 <- sqldf('select * from dat where Date in ('1/2/2007','2/2/2007')')
dat2$Date <- as.Date(dat2$Date,'%d/%m/%Y')
dat2$Datetime <- strptime(paste(dat2$Date,dat2$Time, sep = ' '),'%d/%m/%Y %H:%M:%S')

png(filename = 'plot4.png', width = 480, height = 480, bg = 'white')
par(mfrow=c(2,2))

plot(dat2$Datetime,dat2$Global_active_power,type = 'l',xlab = '',ylab = 'Global Active Power (kilowatts)')

plot(dat2$Datetime, dat2$Voltage,type = 'l',xlab = 'datetime',ylab = 'Voltage')

plot(dat2$Datetime, dat2$Sub_metering_1, type='l', ylab='Energy Submetering', xlab='')
lines(dat2$Datetime, dat2$Sub_metering_2, type='l', col = 'red')
lines(dat2$Datetime, dat2$Sub_metering_3, type='l', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, lwd=2.5, col=c('black', 'red', 'blue'))

plot(dat2$Datetime, dat2$Global_reactive_power,type = 'l',xlab = 'datetime',ylab = 'Global_reactive_power')
dev.off()