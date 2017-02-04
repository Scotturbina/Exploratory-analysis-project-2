## First line takes a while
NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## sum emissions by year

TotalYear <- aggregate(Emissions ~ year, NEI, sum)

## Plot a bar chart
png('plot1.png')
barplot(height=TotalYear$Emissions, names.arg=TotalYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()
