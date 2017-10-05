plot1<- function(){
NEI <- readRDS("summarySCC_PM25.rds")
library(dplyr)
summedData <- NEI %>% group_by(year) %>% summarize(Emissions = sum(Emissions))
png(file="plot1.png",width = 480, height = 480)
plot(summedData$year,summedData$Emissions, type='l')
dev.off()

}