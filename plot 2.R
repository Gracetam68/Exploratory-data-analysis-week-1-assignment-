## read table
file <- read.table("household_power_consumption.txt", 
                   header=TRUE, sep=";", na.strings = "?")

## subset data from the dates 2007-02-01 and 2007-02-02
sub <- subset(file, Date >=as.Date( "2007-02-01") &
                       Date <= as.Date("2007-02-02"))

## convert the Date and Time variables to Date/Time classes
sub$Date <- as.Date(sub$Date,"%d/%m/%Y")

## combine Date and Time column
dateTime <- paste(sub$Date,sub$Time)
dateTime <- as.POSIXct(datetime)
file1 <- cbind(dateTime, sub)

## check and set up the margin
par("mar")
par(mar=c(4,4,4,4))

## create histogram
with(file1,{plot(file1$Global_active_power~file1$dateTime, type="l",
                  xlab = " ",
                  ylab="Global Active Power (kilowatts)")})

## save to the file 
dev.copy(png,"plot2.png",width=480, height=480)
dev.off()
