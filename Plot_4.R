
# Question 4
coal_names <- unique(grep("Coal$", SCC$EI.Sector, value = TRUE))
scc_info <- subset(SCC, EI.Sector %in% coal_names)

xval_coal <- subset(NEI, SCC %in% scc_info$SCC)
emission_coal <- xval_coal %>% group_by(year)
plot_val <- summarise(emission_coal, Emissions = sum(Emissions))

png("Plot4.png")
bp1 <- barplot(height = plot_val$Emissions/1000,
               width = plot_val$year,
               col = plot_val$year,
               ylim = c(0,600),
               names.arg = plot_val$year,
               xlab = "year",
               ylab = "Emissions",
               main = "Total PM2.5 emission of Baltimore City, Maryland")

text(x = bp1,
     y = round(plot_val$Emissions/1000,2),
     label = round(plot_val$Emissions/1000,2),
     pos = 1)
dev.off()
