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

# Q: How have emissions from motor vehicle sources
# changed from 1999–2008 in Baltimore City?

mergeddata <- merge(
    NEI[, c("fips", "SCC", "Emissions", "year")], 
    SCC[, c("SCC", "EI.Sector")], 
    by.x="SCC", by.y="SCC", all=TRUE)

# assume samples of motor vehicles under "Mobile - On-Road..." SCC$EI.Sector
p5data <- subset(
    mergeddata, 
    fips == "24510" & grepl("Mobile - On-Road", mergeddata$EI.Sector), 
    c("Emissions", "year"))

p5data <- group_by(p5data, year)
p5data <- data.frame(summarise(p5data, sum=sum(Emissions)))

png(file="plot5.png", width=720, height=480)
plot(
    p5data$year,
    p5data$sum,
    type="b",
    xlab="Year",
    ylab="PM2.5 Emissions [Tons]",
    xaxt="n",
    pch=21, 
    cex=2, 
    bg="blue",
    col="blue",
    main="\
        Q: How have emissions from motor vehicle sources\
        changed from 1999 to 2008 in Baltimore City?\n")
axis(1, at=seq(1999, 2008, by=3))
dev.off()
