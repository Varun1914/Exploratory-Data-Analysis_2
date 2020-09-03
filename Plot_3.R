# Question 3

emission_type <- NEI %>% group_by(year,type) %>% subset(fips == "24510")
xval_type_year <- summarise(emission_type, Emissions = sum(Emissions))
png("Plot3.png")
# plotting
ggplot(xval_type_year,
       aes(x = factor(year),
           y = Emissions,
           fill = type,
           label = round(Emissions,2))) +
    geom_bar(stat = "identity") +
    facet_grid(.~type) +
    xlab("year") +
    ylab("Total PM2.5 Emissions") +
    ggtitle("Year wise vs Emission along different Types") +
    geom_label(aes(fill = type), colour = "white")
dev.off()
