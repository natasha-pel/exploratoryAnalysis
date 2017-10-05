plot6<- function(){
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)


motorVehiclesTable <- SCC[which(grepl("Motor",SCC$Short.Name)),]  

polutioninBaltimoreOrLA <- NEI[which(NEI$fips == "24510" | NEI$fips == "06037"),]  

vehiclesPolutionBaltimoreOrLA <- polutioninBaltimoreOrLA[which(polutioninBaltimoreOrLA$SCC %in% motorVehiclesPolution$SCC),]  


vehiclesPolutionBaltimoreOrLA$year = factor(vehiclesPolutionBaltimoreOrLA$year,levels=c("1999","2002","2005","2008"))

png(file="plot6.png",width = 480, height = 480)
print({
p <- ggplot(vehiclesPolutionBaltimoreOrLA, aes(year, log(Emissions)))

p + geom_boxplot(aes(colour = factor(fips)))
})

dev.off()

}

