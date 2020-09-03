# Question 1
emission <- NEI %>% group_by(year)
xval <- summarise(emission, Emissions = sum(Emissions))


png("Plot1.png")
bp <- barplot(height = xval$Emissions/1000,
              width = xval$year,
              col = xval$year,
              ylim = c(0,10000),
              names.arg = xval$year,
              xlab = "year",
              ylab = "Emissions",
              main = "Total PM2.5 emission")

text(x = bp,
     y = round(xval$Emissions/1000,2),
     label = round(xval$Emissions/1000,2),
     pos = 1)
dev.off()
