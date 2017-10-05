plot5<- function(){
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

polutioninBaltimore <- NEI[which(NEI$fips == "24510"),]  


motorVehiclesPolution <- SCC[which(grepl("Motor",SCC$Short.Name)),]  


vehiclesPolutionBaltimore <- polutioninBaltimore[which(polutioninBaltimore$SCC %in% motorVehiclesPolution$SCC),]  

vehiclesPolutionBaltimore$year = factor(vehiclesPolutionBaltimore$year,levels=c("1999","2002","2005","2008"))

png(file="plot5.png",width = 480, height = 480)
print(
qplot(year, log10(Emissions), data=vehiclesPolutionBaltimore, geom="boxplot", 
      fill=year, main="Emissions from motor vehicles in Baltimore",
      xlab="Year", ylab="Emissions")
)

dev.off()
}