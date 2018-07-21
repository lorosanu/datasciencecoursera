# 1

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", dest="housing_Idaho.csv")
hh = read.csv("housing_Idaho.csv", header=TRUE)
agrLogical <- hh$ACR == 3 & !is.na(hh$ACR) & hh$AGS == 6 & !is.na(hh$AGS)
subset <- hh[which(agrLogical),]
print(head(rownames(subset), n=3))

# 2

library(jpeg)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", dest="jeff.jpg")
image <- readJPEG("jeff.jpg", native=TRUE)
print(quantile(image, probs=c(0.3, 0.8)))

# 3

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", dest="gdp.csv")
# manually cleaned it ...
gdp <- read.csv("gdp.csv", skip=5, nrows=190, stringsAsFactors=FALSE, header=FALSE)
gdp <- gdp[, c(1, 2, 4, 5)]
names(gdp) <- c("CountryCode", "Rank", "Economy", "Total")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", dest="edu.csv")
edu <- read.csv("edu.csv", header=TRUE)

intersection <- merge(gdp, edu, by.x="CountryCode", by.y="CountryCode")
print(head(intersection[order(-intersection$Rank),]$Economy, n=13))

# 4

incomegroup1 <- subset(intersection, intersection$Income.Group == "High income: OECD")
incomegroup2 <- subset(intersection, intersection$Income.Group == "High income: nonOECD")
print(mean(as.numeric(incomegroup1$Rank), na.rm = TRUE))
print(mean(as.numeric(incomegroup2$Rank), na.rm = TRUE))

# 5

rankquantiles <- quantile(intersection$Rank, probs=seq(0, 1, 0.2), na.rm = TRUE)
intersection$rqGDP <- cut(intersection$Rank, breaks=rankquantiles)
print(table(intersection$Income.Group, intersection$rqGDP))
