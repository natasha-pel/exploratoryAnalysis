plot4<- function(){
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
coalTable <- SCC[which(grepl("Coal",SCC$SCC.Level.Three)),]  

coalPolution <- NEI[which(NEI$SCC %in% coalTable$SCC),]  

coalPolution$year = factor(coalPolution$year,levels=c("1999","2002","2005","2008"))

png(file="plot4.png",width = 480, height = 480)
print(
qplot(year, log10(Emissions), data=coalPolution, geom="boxplot", 
      fill=year, main="Emissions from coal combustion-related sources",
      xlab="Year", ylab="Emissions")
)

dev.off()
}


