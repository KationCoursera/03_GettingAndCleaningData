# Question 3

dat <- read.xlsx('getdata-data-DATA.gov_NGAP.xlsx', sheetIndex=1,startRow=18,endRow=23,startCol=7, endCol=15)
sum(dat$Zip*dat$Ext,na.rm=T)

# Question 4

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileURL, useInternal=TRUE)
rootNode <- xmlRoot(doc)
sum(xpathSApply(r,"//zipcode",xmlValue) == "21231")

# Question 5

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, "Q5.csv")
DT <- fread("Q5.csv")

t1 <- system.time(replicate(100,mean(DT[DT$SEX==1,]$pwgtp15)))
t2 <- system.time(replicate(100,0mean(DT[DT$SEX==2,]$pwgtp15))
t <- t1+t2
print("a: ")
t

t <- system.time(replicate(100,sapply(split(DT$pwgtp15,DT$SEX),mean)))
print("b: ")
t

t <- system.time(replicate(100,tapply(DT$pwgtp15,DT$SEX,mean)))
print("c: ")
t

t <- system.time(replicate(100,DT[,mean(pwgtp15),by=SEX]))
print("d: ")
t

