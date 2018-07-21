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

# 2nd plot
png(file="plot2.png", width=480, height=480, bg="transparent")
plot(
    data$Global_active_power ~ data$Time,
    type="l",
    xlab="", 
    ylab="Global Active Power (kilowatts)")
dev.off()