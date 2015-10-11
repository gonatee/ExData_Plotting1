dat <- read.csv('./download/household_power_consumption.txt',header = TRUE,sep = ';',na.strings = '?')
dat2 <- sqldf('select * from dat where Date in ('1/2/2007','2/2/2007')')
dat2$Date <- as.Date(dat2$Date,'%d/%m/%Y')
dat2$Datetime <- strptime(paste(dat2$Date,dat2$Time, sep = ' '),'%d/%m/%Y %H:%M:%S')

png(filename = 'plot2.png', width = 480, height = 480, bg = 'white')
plot(dat2$Datetime,dat2$Global_active_power,type = 'l',xlab = '',ylab = 'Global Active Power (kilowatts)')
dev.off()