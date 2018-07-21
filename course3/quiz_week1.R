# q1: how many properties are worth $1,000,000 or more?
# VAL > $1000000 => category 24
fname <- "communities.csv"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", dest=fname)
data <- read.csv(fname)
print(length(data$VAL[!is.na(data$VAL) & data$VAL == 24]))
print(nrow(subset(data, VAL == 24)))

# q3: what is the value of: sum(dat$Zip*dat$Ext, na.rm=T)
library(xlsx)
fname <- "natural-gas-aquisition.xlsx"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", dest=fname)
dat <- read.xlsx(fname, sheetIndex=1, header=TRUE, colIndex=7:15, rowIndex=18:23)
print(sum(dat$Zip*dat$Ext, na.rm=T))

# q4: how many restaurants have zipcode 21231?
library(XML)
fname <- "restaurants.xml"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", dest=fname)
data <- xmlParse(fname) 
print(length(xpathApply(data, "//zipcode[text()='21231']", xmlValue)))

# q5: which will deliver the fastest user time?
library(data.table)
fname <- "communities.csv"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", dest=fname)
DT <- fread(input = fname, sep = ",")
print(DT[,mean(pwgtp15),by=SEX])
