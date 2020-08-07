## read table
file <- read.table("household_power_consumption.txt", 
                   header=TRUE, sep=";", na.strings = "?", 
                   colClasses = c('character','character','numeric',
                                  'numeric','numeric','numeric',
                                  'numeric','numeric','numeric'))

##check the file
str(file)
head(file)

## convert the Date and Time variables to Date/Time classes
file$Date <- as.Date(file$Date,"%d/%m/%Y")

## subset data from the dates 2007-02-01 and 2007-02-02.
file <- subset(file, Date >=as.Date( "2007-02-01") &
                       Date <= as.Date("2007-02-02"))

## remove NA
file <- file[complete.cases(file),]

## check the data
head(file)

## combine Date and Time column
dateTime <- paste(file$Date, file$Time)
file1 <- cbind(dateTime, file)

## check and set up the margin
par("mar")
par(mar=c(4,4,4,4))

## create histogram
hist(file$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)",ylab="Frequency",
     col="red")

## save to the file 
dev.copy(png,"plot1.png",width=480, height=480)
dev.off()
