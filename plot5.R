NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##merge files
NEISCC <- merge(NEI, SCC, by="SCC")
require(ggplot2)
NEIsub <- subset(NEI, fips=="24510" & type=="ON-ROAD")
TotalYear <- aggregate(Emissions ~ year, NEIsub, sum)
png("plot5.png", width=840, height=480)
g <- ggplot(TotalYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle ON-ROAD in Baltimore City, Maryland  from 1999 to 2008')
print(g)
dev.off()
