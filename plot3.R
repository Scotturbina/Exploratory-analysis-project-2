NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
require(ggplot2)
NEIsub <- subset(NEI, fips=="24510")
TotalYearType <- aggregate(Emissions ~ year + type, NEIsub, sum)
png("plot3.png", width=640, height=480)

## trend chart 
g <- ggplot(TotalYearType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland from 1999 to 2008')
print(g)
dev.off()
