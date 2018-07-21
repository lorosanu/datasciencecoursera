# get a rough estimate of how much memory the dataset will require
m <- 2075259 * 9 * 8 / (2 ^ 20)
print(paste("Loading the dataset requires", round(m, 0), "MB of memory"))

# load the data
getdata <- function(filename, pattern) {
    df <- read.table(
        text=grep(pattern, readLines(filename), value=TRUE), 
        sep=";", 
        na.strings="?")
    
    colnames <- strsplit(readLines(filename, 1), ";")[[1]]
    names(df) <- colnames

    df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Time <- as.POSIXct(df$Time)
    df$Date <- as.Date(df$Date, "%d/%m/%Y")

    df
}

archiveurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
archivefile <- "household_power_consumption.zip"
fn <- "household_power_consumption.txt"

if ( !file.exists(fn) ){
    download.file(archiveurl, dest=archivefile)
    unzip(archivefile, exdir=".", junkpaths=TRUE)
}

data <- getdata(fn, "(^(1|2)/2/2007)")

# 3rd plot
png(file="plot3.png", width=480, height=480, bg="transparent")
plot(
    data$Sub_metering_1 ~ data$Time,
    type="l",
    xlab="", 
    ylab="Energy sub metering",
    col="black")
lines(data$Sub_metering_2 ~ data$Time, col="red")
lines(data$Sub_metering_3 ~ data$Time, col="blue")
legend(
    "topright", 
    c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty=c(1, 1, 1),  
    col=c("black", "red", "blue"))
dev.off()