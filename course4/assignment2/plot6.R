library(dplyr)
library(ggplot2)

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

# Q: Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California.
# Which city has seen greater changes over time in motor vehicle emissions?

citycodes <- c("24510", "06037")
citynames <- c("Baltimore City", "Los Angeles")

mergeddata <- merge(
    NEI[, c("fips", "SCC", "Emissions", "year")], 
    SCC[, c("SCC", "EI.Sector")], 
    by.x="SCC", by.y="SCC", all=TRUE)

# assume samples of motor vehicles under "Mobile - On-Road..." SCC$EI.Sector
p6data <- subset(
    mergeddata, 
    fips %in% citycodes & grepl("Mobile - On-Road", mergeddata$EI.Sector), 
    c("Emissions", "year", "fips"))
p6data$City <- factor(p6data$fips, levels=citycodes, labels=citynames)

p6data <- group_by(p6data, year, City)
p6data <- data.frame(summarise(p6data, sum=sum(Emissions)))

png(file="plot6.png", width=720, height=480)
myplot <- ggplot(data=p6data, aes(x=year, y=sum, group=City)) +
    geom_line(aes(color=City)) +
    geom_point(aes(color=City), size=3) +
    labs(x="Year", y="PM2.5 Emissions [Tons]") +
    scale_x_discrete(limits=c(1999, 2002, 2005, 2008)) +
    ggtitle("\
        Q: Which city between Baltimore City and Los Angeles County\
        has seen greater changes over time in motor vehicle emissions\n") +
    theme_classic() +
    theme(plot.title=element_text(hjust = 0.5))
print(myplot)
dev.off()
