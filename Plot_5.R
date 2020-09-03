# Question 5
NEI_mv_bML <- subset(NEI, fips == "24510" & type == "ON-ROAD")
emission_mv <- NEI_mv_bML %>% group_by(year)
xval_mv <- summarise(emission_mv, Emissions = sum(Emissions))


png("Plot5.png")
bp2 <- barplot(height = xval_mv$Emissions,
               width = xval_mv$year,
               col = xval_mv$year,
               ylim = c(0,400),
               names.arg = xval_mv$year,
               xlab = "year",
               ylab = "Emissions",
               main = "Total PM2.5 emission of Baltimore City, Maryland")

text(x = bp2,
     y = round(xval_mv$Emissions,2),
     label = round(xval_mv$Emissions,2),
     pos = 1)
dev.off()
