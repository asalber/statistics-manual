setwd("/media/alf/datos/drive/CEU/DOCENCIA/materiales/estadistica/presentaciones/statistics_course")
library(tikzDevice)
library(plyr)
library(plotly)
library(shape)
require(Hmisc)

# Color definition
color1=rgb(5,161,230,max=255)
color2=rgb(238,50,36,max=255)

options(tikzDefaultEngine = "xetex")

# Probability function of tossing two coins
tikz(file="img/discrete_random_variables/two_coins_probability_function.tex", width=4, height=4)
par(las=1)
x = 0:2
plot(x, dbinom(x, size=2, prob=0.5), ylim=c(0,0.5), xlab="Number of heads", ylab="Probability $f(x)$", main="Probability distribution of tossing two coins", type="p", pch=16, col=color1)
abline(h=0, col="gray")
dev.off()

# Distribution function of tossing two coins
tikz(file="img/discrete_random_variables/two_coins_distribution_function.tex", width=4, height=4)
par(las=1)
x = 0:2
plot(x, pbinom(x, size=2, prob=0.5), ylim=c(0,1), xlab="Number of heads", ylab="Cumulative probability $F(X)$", main="Probability distribution of tossing two coins", type="p", pch=16, col=color1)
abline(h=0, col="gray")
lines(c(-1,0,0,1,1,2,2,3),c(0,0,0.25,0.25,0.75,0.75,1,1),col=color1, lwd=2)
dev.off()

# Discrete uniform model 
tikz(file="img/discrete_random_variables/discrete_uniform_probability_function.tex", width=4, height=4)
par(las=1)
x = 1:6
plot(x, dunif(x,0,6), ylim=c(0,0.20), xlab="X", ylab="Probability $f(x)$", main="Discrete uniform probability distribution U(1,6)", type="p", pch=16, col=color1)
abline(h=0, col="gray")
dev.off()

# Biomial model
tikz(file="img/discrete_random_variables/binomial_probability_function.tex", width=4, height=4)
par(las=1)
x = 0:10
plot(x, dbinom(x, size=10, prob=0.5), ylim=c(0,0.25), xlab="X", ylab="Probability $f(x)$", main="Binomial probability distribution B(10,0.5)", type="p", pch=16, col=color1)
abline(h=0, col="gray")
dev.off()

# Poisson model
tikz(file="img/discrete_random_variables/poisson_probability_function.tex", width=4, height=4)
par(las=1)
x = 0:12
plot(x, dpois(x, lambda=4), ylim=c(0,0.2), xlab="X", ylab="Probability $f(x)$", main="Poisson probability distribution P(4)", type="p", pch=16, col=color1)
abline(h=0, col="gray")
dev.off()

