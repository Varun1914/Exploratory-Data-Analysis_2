# Script Name: CourseProjectInit.R
# Author Name: Varun1914
# Course: Exploratory Data Analysis Courser Project 2

# Loading libraries.
library(dplyr)
library(grDevices)
library(ggplot2)

# Download files
filename = "CourseProject2.zip"
if(!file.exists(filename))
{
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(fileUrl,
                  destfile = filename,
                  method = "curl")

}

# Unzip Files
unzip(filename)

# Gather Information
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

# # Question 1
# emission <- NEI %>% group_by(year)
# xval <- summarise(emission, Emissions = sum(Emissions))
#
#
# png("Plot1.png")
# bp <- barplot(height = xval$Emissions/1000,
#                 width = xval$year,
#                 col = xval$year,
#                 ylim = c(0,10000),
#                 names.arg = xval$year,
#                 xlab = "year",
#                 ylab = "Emissions",
#                 main = "Total PM2.5 emission")
#
# text(x = bp,
#      y = round(xval$Emissions/1000,2),
#      label = round(xval$Emissions/1000,2),
#      pos = 1)
# dev.off()
#
# # Question 2
#
# d_balti_ML <- subset(NEI, fips == "24510")
#
# emission_bML <- d_balti_ML %>% group_by(year)
# xval_bML <- summarise(emission_bML, Emissions = sum(Emissions))
#
#
# png("Plot2.png")
# bp <- barplot(height = xval_bML$Emissions/1000,
#               width = xval_bML$year,
#               col = xval_bML$year,
#               ylim = c(0,5),
#               names.arg = xval_bML$year,
#               xlab = "year",
#               ylab = "Emissions",
#               main = "Total PM2.5 emission of Baltimore City, Maryland")
#
# text(x = bp,
#      y = round(xval_bML$Emissions/1000,2),
#      label = round(xval_bML$Emissions/1000,2),
#      pos = 1)
# dev.off()
#
# # Question 3
#
# emission_type <- NEI %>% group_by(year,type) %>% subset(fips == "24510")
# xval_type_year <- summarise(emission_type, Emissions = sum(Emissions))
# png("Plot3.png")
# # plotting
# ggplot(xval_type_year,
#        aes(x = factor(year),
#            y = Emissions,
#            fill = type,
#            label = round(Emissions,2))) +
#     geom_bar(stat = "identity") +
#     facet_grid(.~type) +
#     xlab("year") +
#     ylab("Total PM2.5 Emissions") +
#     ggtitle("Year wise vs Emission along different Types") +
#     geom_label(aes(fill = type), colour = "white")
# dev.off()
#
#
# # Question 4
# coal_names <- unique(grep("Coal$", SCC$EI.Sector, value = TRUE))
# scc_info <- subset(SCC, EI.Sector %in% coal_names)
#
# xval_coal <- subset(NEI, SCC %in% scc_info$SCC)
# emission_coal <- xval_coal %>% group_by(year)
# plot_val <- summarise(emission_coal, Emissions = sum(Emissions))
#
# png("Plot4.png")
# bp1 <- barplot(height = plot_val$Emissions/1000,
#               width = plot_val$year,
#               col = plot_val$year,
#               ylim = c(0,600),
#               names.arg = plot_val$year,
#               xlab = "year",
#               ylab = "Emissions",
#               main = "Total PM2.5 emission of Baltimore City, Maryland")
#
# text(x = bp1,
#      y = round(plot_val$Emissions/1000,2),
#      label = round(plot_val$Emissions/1000,2),
#      pos = 1)
# dev.off()
#
# # Question 5
# NEI_mv_bML <- subset(NEI, fips == "24510" & type == "ON-ROAD")
# emission_mv <- NEI_mv_bML %>% group_by(year)
# xval_mv <- summarise(emission_mv, Emissions = sum(Emissions))
#
#
# png("Plot5.png")
# bp2 <- barplot(height = xval_mv$Emissions,
#                width = xval_mv$year,
#                col = xval_mv$year,
#                ylim = c(0,400),
#                names.arg = xval_mv$year,
#                xlab = "year",
#                ylab = "Emissions",
#                main = "Total PM2.5 emission of Baltimore City, Maryland")
#
# text(x = bp2,
#      y = round(xval_mv$Emissions,2),
#      label = round(xval_mv$Emissions,2),
#      pos = 1)
# dev.off()
#
# # Question 6
# NEI_mv_bML1 <- subset(NEI,
#                      (fips == "24510" | fips == "06037") & type == "ON-ROAD")
#
# emission_mv1 <- NEI_mv_bML1 %>% group_by(fips, year)
# xval_mv1 <- summarise(emission_mv1, Emissions = sum(Emissions))
#
# png("Plot6.png")
# ggplot(xval_mv1,
#        aes(x = factor(year),
#            y = Emissions,
#            fill = fips,
#            label = round(Emissions,2))) +
#     geom_bar(stat = "identity") +
#     facet_grid(fips~., scales = "free") +
#     xlab("year") +
#     ylab("Total PM2.5 MV Emissions") +
#     ggtitle("Year wise vs MV Emission Balitmore City v/s LosAngeles") +
#     geom_label(aes(fill = fips), colour = "white")
# dev.off()
