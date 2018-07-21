library(dplyr)

archiveurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
archivefile <- "NEI_data.zip"

datadir <- "NEI_data"
neifile <- file.path(datadir, "summarySCC_PM25.rds")
sccfile <- file.path(datadir, "Source_Classification_Code.rds")

if ( !(file.exists(neifile) && file.exists(sccfile)) ){
    download.file(archiveurl, dest=archivefile)
    unzip(archivefile, exdir=datadir, junkpaths=TRUE)
}

NEI <- readRDS(neifile)
SCC <- readRDS(sccfile)

# Q: Have total emissions from PM2.5 decreased
# in the United States from 1999 to 2008?

p1data <- group_by(NEI, year)
p1data <- data.frame(summarise(p1data, sum=sum(Emissions)))

png(file="plot1.png", width=720, height=480)
plot(
    p1data$year,
    p1data$sum,
    type="b",
    xlab="Year",
    ylab="PM2.5 Emissions [Tons]",
    xaxt="n",
    pch=21, 
    cex=2, 
    bg="blue",
    col="blue",
    main="\
        Q: Have total emissions from PM2.5 decreased\
        in the United States from 1999 to 2008?\n")
axis(1, at=seq(1999, 2008, by=3))
dev.off()
