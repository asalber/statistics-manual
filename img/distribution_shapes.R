# Distributions with different shapes
# Author: Alfredo Sánchez Alberca (asalber@ceu.es)

setwd("/media/alf/datos/drive/CEU/DOCENCIA/materiales/estadistica/presentaciones/statistics_manual")
library(tikzDevice)

# Colors
blueceu <- rgb(5,161,230,255,maxColorValue = 255) #0099CC
blueceulight <- rgb(137,211,243,255,maxColorValue = 255) #89D3F3
redceu <- rgb(238,50,36,255,maxColorValue = 255) #FF3333
greenceu <- rgb(194,205,255,255,maxColorValue = 255) #CCCC33
orangeceu <- rgb(248,131,121,255,maxColorValue = 255)#F88379
purpleceu <- rgb(169,78,145,255,maxColorValue = 255) #996699
greyceu <- rgb(117,117,97,255,maxColorValue = 255) #666666

# Right-skewed distribution
tikz(file="img/descriptive/right_skewed_distribution_example.tex", width=7, height=5)
par(cex.lab=1.2)
income <- seq(2500,207500,5000)/1000
counts <- c(4235, 4071, 6324, 6470, 6765, 6222, 6354, 5743, 5203, 5002, 5078, 4140, 4367, 3733, 3683, 3650, 3354, 2893, 2850, 2452, 2792, 2232, 2158, 1748, 1987, 1675, 1474, 1380, 1220, 1111, 1313, 1017, 993, 761, 822, 700, 677, 536, 561, 431, 314, 215)
breaks <- seq(0,210000,5000)/1000
data <- rep(income, counts)
hist(data, main="USA househod income dristribution", breaks=breaks, xaxt="n", xlab="Yearly income (thousand dollars)", ylab="Relative frequency", col=blueceulight, prob=T)
axis(side=1, at=breaks, labels=breaks, las=2)
dev.off()

# Left-skewed distribution
tikz(file="img/descriptive/left_skewed_distribution_example.tex", width=7, height=5)
par(cex.lab=1.2)
counts <- c(65, 116, 69, 78, 319, 501, 633, 655, 848, 1226, 1633, 2459, 3375, 4669, 6152, 7436, 9526, 12619, 12455, 7113, 2104)
breaks <- seq(0,100,5)
data <- rep(breaks, counts)
hist(data, main="Distribution of age at death of australian males",  xlab="Age of dead", ylab="Relative frequency", breaks = breaks, xaxt="n", col=blueceulight, prob=T)
axis(side=1, at=breaks, labels=breaks)
dev.off()

# Bimodal distribution
tikz(file="img/descriptive/bimodal_distribution_example.tex", width=7, height=5)
par(cex.lab=1.2)
counts <- c(35, 20, 18, 48, 75, 67, 43, 22, 14, 21, 23, 47, 63, 44, 25, 15)
breaks <- seq(8.5,23.5,1)
data <- rep(breaks, counts)
breaks <- seq(8,24)
hist(data, main="Distribution of clients arrival times in a restaurant",  xlab="Time", ylab="Relative frequency", breaks = breaks, xaxt="n", col=blueceulight, prob=T)
axis(side=1, at=breaks, labels=breaks)
dev.off()

# 
# Right-skewed and platikurtic distribution
tikz(file="img/descriptive/right_skewed_platykurtic_distribution_example.tex", width=7, height=5)
par(cex.lab=1.2)
income <- seq(2500,207500,10000)/1000
counts <- c(3635, 4324, 4465, 4354, 4203, 4078, 3867, 3683, 3354, 2850, 2392, 2158, 1987, 1474, 1220, 1313, 993, 822, 677, 561, 314)
breaks <- seq(0,210000,10000)/1000
data <- rep(income, counts)
hist(data, main="", breaks=breaks, xaxt="n", xlab="", ylab="Relative frequency", col=blueceulight, prob=T)
axis(side=1, at=breaks, labels=breaks, las=2)
curve(dnorm(x, mean=mean(data), sd=sd(data)), col="red", lwd=2, add=TRUE, yaxt="n")

dev.off()
