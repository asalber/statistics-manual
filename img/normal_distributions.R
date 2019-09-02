# Distributions with different shapes
# Author: Alfredo Sánchez Alberca (asalber@ceu.es)

setwd("/media/alf/datos/drive/CEU/DOCENCIA/materiales/estadistica/presentaciones/statistics_manual")
library(tikzDevice)

# Colors
blueceu <- rgb(5,161,230,255,maxColorValue = 255) #0099CC
blueceulight <- rgb(137,211,243,255,maxColorValue = 255) #89D3F3
redceu <- rgb(238,50,36,255,maxColorValue = 255) #FF3333
redceulight <- rgb(238,50,36,255,maxColorValue = 255, alpha = 125) #FF3333
greenceu <- rgb(194,205,255,255,maxColorValue = 255) #CCCC33
orangeceu <- rgb(248,131,121,255,maxColorValue = 255)#F88379
purpleceu <- rgb(169,78,145,255,maxColorValue = 255) #996699
greyceu <- rgb(117,117,97,255,maxColorValue = 255) #666666

# Subway waiting time
tikz(file="img/descriptive/waiting_time_distribution_example.tex", width=7, height=5)
par(cex.lab=1.2)
set.seed(123)
data <- runif(1000, min = 0, max = 15)
breaks <- seq(0, 15)
hist(data, main="Subway waiting time", breaks=breaks, xaxt = "n", xlab = "Waiting time (min)", ylab = "Relative frequency", col = blueceulight, prob = T)
axis(side = 1, at = breaks, labels = breaks)
dev.off()

# Weights
tikz(file="img/descriptive/weights_distribution_example.tex", width=7, height=5)
par(cex.lab=1.2)
set.seed(123)
data <- rnorm(10000, mean = 88, sd = 12)
breaks <- seq(40, 140, 2)
hist(data, main="Men's weight", breaks=breaks, xaxt = "n", xlab = "Weight (kg)", ylab = "Relative frequency", col = blueceulight, prob = T)
polygon(density(data), border = "blue")
axis(side = 1, at = breaks, labels = breaks)
dev.off()

# Women heights
tikz(file="img/descriptive/women_heights_distribution_example.tex", width=7, height=5)
par(cex.lab=1.2)
set.seed(1234)
data <- rnorm(10000, mean = 164, sd = 8)
breaks <- seq(130, 200, 2)
hist(data, main="Women's heights", breaks=breaks, xaxt = "n", xlab = "Height (cm)", ylab = "Relative frequency", col = blueceulight, prob = T)
polygon(density(data), border = "blue")
axis(side = 1, at = breaks, labels = breaks)
dev.off()

# Men heights
tikz(file="img/descriptive/men_heights_distribution_example.tex", width=7, height=5)
par(cex.lab=1.2)
set.seed(1234)
data <- rnorm(10000, mean = 175, sd = 9)
min(data)
max(data)
breaks <- seq(140, 210, 2)
hist(data, main="Men's heights", breaks=breaks, xaxt = "n", xlab = "Height (cm)", ylab = "Relative frequency", col = blueceulight, prob = T)
polygon(density(data), border = "blue")
axis(side = 1, at = breaks, labels = breaks)
dev.off()

# Women and men heights
tikz(file="img/descriptive/women_men_heights_distribution_example.tex", width=7, height=5)
par(cex.lab=1.2)
set.seed(1234)
data.women <- rnorm(10000, mean = 164, sd = 8)
data.men <- rnorm(10000, mean = 175, sd = 9)
breaks <- seq(130, 210, 2)
hist(data.women, main="Heights by gender", breaks=breaks, xaxt = "n", xlab = "Height (cm)", ylab = "Relative frequency", col = blueceulight, prob = T)
hist(data.men, breaks=breaks, xaxt = "n", col = redceulight, prob = T, add = T)
polygon(density(data.women), border = "blue")
polygon(density(data.men), border = "red")
axis(side = 1, at = breaks, labels = breaks)
legend("topright", legend=c("Women", "Men"), fill=c(blueceulight, redceulight), cex=0.8)
dev.off()

# Heights
tikz(file="img/descriptive/heights_distribution_example.tex", width=7, height=5)
par(cex.lab=1.2)
set.seed(1234)
data.women <- rnorm(10000, mean = 164, sd = 8)
data.men <- rnorm(10000, mean = 175, sd = 9)
data <- c(data.women, data.men)
breaks <- seq(130, 210, 2)
hist(data, main="Women and men heights", breaks=breaks, xaxt = "n", xlab = "Height (cm)", ylab = "Relative frequency", col = blueceulight, prob = T)
polygon(density(data), border = "blue")
axis(side = 1, at = breaks, labels = breaks)
dev.off()

# Cholesterol
tikz(file="img/descriptive/cholesterol_distribution_example.tex", width=7, height=5)
par(cex.lab=1.2)
set.seed(123)
data <- rnorm(10000, mean = 192, sd = 18)
breaks <- seq(120, 265, 5)
hist(data, main="Cholesterol level", breaks=breaks, xaxt = "n", xlab = "Cholesterol (mg/dl)", ylab = "Relative frequency", col = blueceulight, prob = T)
polygon(density(data), border = "blue")
axis(side = 1, at = breaks, labels = breaks)
dev.off()

# Exam
tikz(file="img/descriptive/scores_distribution_example.tex", width=7, height=5)
par(cex.lab=1.2)
set.seed(123)
data <- rnorm(1000, mean = 5.5, sd = 1.4)
breaks <- seq(0, 10, 0.5)
hist(data[data<=10], main="Statistics scores", breaks=breaks, xaxt = "n", xlab = "Score", ylab = "Relative frequency", col = blueceulight, prob = T)
polygon(density(data), border = "blue")
axis(side = 1, at = breaks, labels = breaks)
dev.off()

# bell shaped distribution
tikz(file="img/descriptive/gauss_bell.tex", width=7, height=5)
par(cex.lab=1.2)
x <- seq(-3.3, 3.3, by=0.05)
plot(x, dnorm(x, mean=0, sd=1), ylim=c(0,0.45), main="Gauss bell", type="l", col=color2, lwd=3, axes = F, xlab = "", ylab = "")
dev.off()

