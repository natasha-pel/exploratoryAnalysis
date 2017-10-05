plot2<- function(){
NEI <- readRDS("summarySCC_PM25.rds")
polutioninMaryland <- NEI[which(NEI$fips == "24510"),]  

png(file="plot2.png",width = 480, height = 480)

polution1999 <- polutioninMaryland[which(polutioninMaryland$year == 1999),]
polution2002 <- polutioninMaryland[which(polutioninMaryland$year == 2002),]
polution2005 <- polutioninMaryland[which(polutioninMaryland$year == 2005),]
polution2008 <- polutioninMaryland[which(polutioninMaryland$year == 2008),]

boxplot(log10(polution1999$Emissions),log10(polution2002$Emissions),log10(polution2005$Emissions),log10(polution2008$Emissions),names=c("1999","2002","2005","2008"),
        main="Emissions in Baltimore City")

dev.off()
}