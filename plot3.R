plot3<- function(){
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

polutioninMaryland <- NEI[which(NEI$fips == "24510"),]  

polutioninMaryland$type <- factor(polutioninMaryland$type,levels=c("POINT","NONPOINT","ON-ROAD", "NON-ROAD"))

png(file="plot3.png",width = 480, height = 480)
print(
qplot(year, Emissions, data=polutioninMaryland, geom=c("point", "smooth"), 
      method="lm", formula=y~x, color=type, 
      main="Emissions per year for each type in Baltimore (zoomed)", 
      xlab="Year", ylab="Emissions",ylim=c(0,20))
  )

dev.off()
}