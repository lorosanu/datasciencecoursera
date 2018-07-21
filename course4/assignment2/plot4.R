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

# Q: Across the United States, how have
# emissions from coal combustion-related sources changed from 1999–2008?

mergeddata <- merge(
    NEI[, c("SCC", "Emissions", "year")], 
    SCC[, c("SCC", "EI.Sector")], 
    by.x="SCC", by.y="SCC", all=TRUE)

p4data <- subset(
    mergeddata, 
    grepl("Coal", mergeddata$EI.Sector, fixed=TRUE), 
    c("Emissions", "year"))

p4data <- group_by(p4data, year)
p4data <- data.frame(summarise(p4data, sum=sum(Emissions)))

png(file="plot4.png", width=720, height=480)
plot(
    p4data$year,
    p4data$sum,
    type="b",
    xlab="Year",
    ylab="PM2.5 Emissions [Tons]",
    xaxt="n",
    pch=21, 
    cex=2, 
    bg="blue",
    col="blue",
    main="\
        Q: Across the United States, how have emissions from
        coal combustion-related sources changed from 1999 to 2008?\n")
axis(1, at=seq(1999, 2008, by=3))
dev.off()
