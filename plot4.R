NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##merge files
NEISCC <- merge(NEI, SCC, by="SCC")
require(ggplot2)
coalMatch  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
NEISCCsub <- NEISCC[coalMatch, ]
TotalYear <- aggregate(Emissions ~ year, NEISCCsub, sum)
png("plot4.png", width=640, height=480)
g <- ggplot(TotalYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal  from 1999 to 2008')
print(g)
dev.off()
