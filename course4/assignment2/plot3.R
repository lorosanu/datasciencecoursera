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

# Q: Of the four types of sources indicated by the
# 'type' (point, nonpoint, onroad, nonroad) variable,
# which have seen decreases in emissions from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008?
# Use the ggplot2 plotting system to make a plot answer this question

p3data <- subset(NEI, fips == "24510")
p3data <- group_by(p3data, year, type)
p3data <- data.frame(summarise(p3data, sum=sum(Emissions)))

png(file="plot3.png", width=720, height=480)
myplot <- ggplot(data=p3data, aes(x=year, y=sum, group=type)) +
    geom_line(aes(color=type)) +
    geom_point(aes(color=type), size=3) +
    labs(x="Year", y="PM2.5 Emissions in Baltimore City [Tons]") +
    scale_x_discrete(limits=c(1999, 2002, 2005, 2008)) +
    ggtitle("\
        Q: Of the four types of sources of pollution\
        which have seen decreases / increases in emissions\
        from 1999-2008 for Baltimore City?\n") +
    theme_classic() +
    theme(plot.title=element_text(hjust = 0.5))
print(myplot)
dev.off()
