NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## subsetting by fips
NEIsub <- subset(NEI, fips=="24510")
TotalYear <- aggregate(Emissions ~ year,NEIsub, sum)
png('plot2.png')
barplot(height=TotalYear$Emissions, names.arg=TotalYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()
