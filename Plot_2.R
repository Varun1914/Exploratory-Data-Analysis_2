# Question 2
d_balti_ML <- subset(NEI, fips == "24510")

emission_bML <- d_balti_ML %>% group_by(year)
xval_bML <- summarise(emission_bML, Emissions = sum(Emissions))


png("Plot2.png")
bp <- barplot(height = xval_bML$Emissions/1000,
              width = xval_bML$year,
              col = xval_bML$year,
              ylim = c(0,5),
              names.arg = xval_bML$year,
              xlab = "year",
              ylab = "Emissions",
              main = "Total PM2.5 emission of Baltimore City, Maryland")

text(x = bp,
     y = round(xval_bML$Emissions/1000,2),
     label = round(xval_bML$Emissions/1000,2),
     pos = 1)
dev.off()
