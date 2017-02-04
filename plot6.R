NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##merge files
NEISCC <- merge(NEI, SCC, by="SCC")
require(ggplot2)
NEIsub <- subset(NEI, fips=="24510" | fips=="06037" & type=="ON-ROAD")
TotalYearFips <- aggregate(Emissions ~ year + fips, NEIsub, sum)
TotalYearFips$fips[TotalYearFips$fips=="24510"] <- "Baltimore, MD"
TotalYearFips$fips[TotalYearFips$fips=="06037"] <- "Los Angeles, CA"
png("plot6.png", width=1040, height=480)
g <- ggplot(TotalYearFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle ON-ROAD in Baltimore City, MD  vs Los Angeles, CA from 1999-2008')
print(g)
dev.off()
