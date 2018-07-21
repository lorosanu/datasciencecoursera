# 1

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", dest="communities.csv")
com <- read.csv("communities.csv", header=TRUE)
print(strsplit(names(com), "wgtp")[[123]])

# 2

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", dest="gdp.csv")
gdp <- read.csv("gdp.csv", skip=5, nrows=190, stringsAsFactors=FALSE, header=FALSE)
gdp <- gdp[, c(1, 2, 4, 5)]
names(gdp) <- c("CountryCode", "Rank", "Economy", "Total")
gdp$Total <- gsub(",", "", gdp$Total)
print(mean(as.numeric(gdp$Total), na.rm=TRUE))

# 3

print(length(grep("^United", gdp$Economy)))

# 4

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", dest="edu.csv")
edu <- read.csv("edu.csv", header=TRUE)
intersection <- merge(gdp, edu, by.x="CountryCode", by.y="CountryCode")
print(length(grep("Fiscal year end: June*", intersection$Special.Notes)))

# 5

library(quantmod)
amzn <- getSymbols("AMZN",auto.assign=FALSE)
sampleTimes <- index(amzn)
print(sum(year(sampleTimes) == 2012))
print(sum(year(sampleTimes) == 2012 & weekdays(sampleTimes) == "Monday"))