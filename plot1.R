dat <- read.csv('./download/household_power_consumption.txt',header = TRUE,sep = ';',na.strings = '?')
dat2 <- sqldf('select * from dat where Date in ('1/2/2007','2/2/2007')')
dat2$Date <- as.Date(dat2$Date,'%d/%m/%Y')
dat2$Datetime <- strptime(paste(dat2$Date,dat2$Time, sep = ' '),'%d/%m/%Y %H:%M:%S')

png(filename = 'plot1.png', width = 480, height = 480, bg = 'white')
hist(dat2$Global_active_power,col = 'red',main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)')
dev.off()