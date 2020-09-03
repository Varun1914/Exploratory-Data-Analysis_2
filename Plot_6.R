# Question 6
NEI_mv_bML1 <- subset(NEI,
                      (fips == "24510" | fips == "06037") & type == "ON-ROAD")

emission_mv1 <- NEI_mv_bML1 %>% group_by(fips, year)
xval_mv1 <- summarise(emission_mv1, Emissions = sum(Emissions))

png("Plot6.png")
ggplot(xval_mv1,
       aes(x = factor(year),
           y = Emissions,
           fill = fips,
           label = round(Emissions,2))) +
    geom_bar(stat = "identity") +
    facet_grid(fips~., scales = "free") +
    xlab("year") +
    ylab("Total PM2.5 MV Emissions") +
    ggtitle("Year wise vs MV Emission Balitmore City v/s LosAngeles") +
    geom_label(aes(fill = fips), colour = "white")
dev.off()
