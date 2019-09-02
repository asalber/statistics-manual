setwd("/media/alf/datos/drive/CEU/DOCENCIA/materiales/estadistica/presentaciones/statistics_manual")
library(tikzDevice)
library(plyr)
library(plotly)
library(shape)
require(Hmisc)

# Color definition
color1=rgb(5,161,230,max=255)
color2=rgb(238,50,36,max=255)

options(tikzDefaultEngine = "xetex")

data <- read.table("data/height_weight_data.csv", header=TRUE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)
# Height and weight scatter plot
tikz(file="img/regression/height_weight_scatterplot.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=0.8, las=1, tck=-0.02)
plot(weight~height, col=color1, main="Height and weight scatter plot", xlab="Height (cm)", ylab="Weight (Kg)", xlim=c(150,200), pch=16, data=data)
segments(179,0,179,85, lty=2, col="grey")
segments(0,85,179,85, lty=2, col="grey")
text(179,87,"(179,85)")
dev.off()

# Scatter plots for different types of relation
# No relation scatter plot
tikz(file="img/regression/scatterplot_different_relations.tex", width=5, height=3)
par(mfrow=c(2,3))
#tikz(file="img/regression/no_relation_scatterplot.tex", width=7, height=5)
par(mar=c(1,1,1.4,1))
x=runif(100,-10,10)
y=runif(100,-10,10)
plot(x,y, col=color1, main="No relation", xlab="$X$", ylab="$Y$", pch=16, axes=F)
box()
#dev.off()

# Linear relation scatter plot
#tikz(file="img/regression/linear_scatterplot.tex", width=7, height=5)
par(mar=c(1,1,1.4,1))
y=0.5*x+rnorm(100,0,1)
plot(x,y, col=color1, main="Linear relation", xlab="$X$", ylab="$Y$", pch=16, axes=F)
box()
#dev.off()

# Quadratic relation scatter plot
#tikz(file="img/regression/quadratic_scatterplot.tex", width=7, height=5)
par(mar=c(1,1,1.4,1))
y=(x+rnorm(100,0,1))^2
plot(x,y, col=color1, main="Quadratic relation", xlab="$X$", ylab="$Y$", pch=16, axes=F)
box()
#dev.off()

# Exponential relation scatter plot
#tikz(file="img/regression/exponential_scatterplot.tex", width=7, height=5)
par(mar=c(1,1,1.4,1))
y=exp(0.3*x+rnorm(100,0,0.1))+rnorm(100,0,1)
plot(x,y, col=color1, main="Exponential relation", xlab="$X$", ylab="$Y$", pch=16, axes=F)
box()
#dev.off()

# Logarithmic relation scatter plot
#tikz(file="img/regression/logarithmic_scatterplot.tex", width=7, height=5)
par(mar=c(1,1,1.4,1))
x=runif(100,0,10)
y=log(x+rnorm(100,1,0.3),2)+rnorm(100,0,0.1)
plot(x,y, col=color1, main="Logarithmic relation", xlab="$X$", ylab="$Y$", pch=16, axes=F)
box()
#dev.off()

# Inverse relation scatter plot
#tikz(file="img/regression/inverse_scatterplot.tex", width=7, height=5)
par(mar=c(1,1,1.4,1))
x=runif(100,0.5,5)
y=1/(x+rnorm(100,0,0.1))+rnorm(100,0,0.1)
plot(x,y, col=color1, main="Inverse relation", xlab="$X$", ylab="$Y$", pch=16, axes=F)
box()
dev.off()

# Deviations to the means
tikz(file="img/regression/deviations_to_means.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,0.2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=1, las=1, tck=-0.02)
plot(weight~height, col=color1, main="", xlab="$X$", ylab="$Y$", xlim=c(150,200), pch=16, data=data, axes=F)
box()
axis(1, at=c(174.67), labels=c("$\\bar x$"))
axis(2, at=c(69.67), labels=c("$\\bar y$"),las=2)
abline(h=69.67, lty=2,col="grey")
abline(v=174.67, lty=2,col="grey")
points(174.67,69.67, pch=16, col=color2)
text(172,73,"$(\\bar x, \\bar y)$",col=color2)
text(197,93,"$(x_i,y_j)$")
Arrows(174.67,90,194,90, arr.length = 0.2, arr.width = 0.15, code = 3, arr.type = "triangle", arr.adj=1, col=color2)
text(186,92,"$x_i-\\bar x$",col=color2)
Arrows(194,69.67,194,90, arr.length = 0.2, arr.width = 0.15, code = 3, arr.type = "triangle", arr.adj=1, col=color2)
text(198,80,"$y_j-\\bar y$",col=color2)
dev.off()

# Increasing linear relation with quadrants
tikz(file="img/regression/increasing_linear_scatterplot.tex", width=4.5, height=3.3)
x=runif(100)
y=0.5*x+rnorm(100,0,0.05)
mx=mean(x)
my=mean(y)
par(mai=c(0.3,0.3,0.4,0.2), mgp=c(0.5,0,0))
plot(x,y, col=color1, main="Increasing linear relation", xlab="$X$", ylab="$Y$", pch=16, axes=F)
box()
abline(h=my, lty=2,col="grey")
abline(v=mx, lty=2,col="grey")
dev.off()

# Decreasing linear relation with quadrants
tikz(file="img/regression/decreasing_linear_scatterplot.tex", width=4.5, height=3.3)
x=runif(100)
y=-0.5*x+rnorm(100,0,0.05)
mx=mean(x)
my=mean(y)
par(mai=c(0.3,0.3,0.4,0.2), mgp=c(0.5,0,0))
plot(x,y, col=color1, main="Decreasing linear relation", xlab="$X$", ylab="$Y$", pch=16, axes=F)
box()
abline(h=my, lty=2,col="grey")
abline(v=mx, lty=2,col="grey")
dev.off()

# Y residuals
tikz(file="img/regression/y_residuals.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=1, las=1, tck=-0.02)
plot(weight~height, col=color1, main="", xlab="$X$", ylab="$Y$", xlim=c(150,200), pch=16, data=data, axes=F)
box()
model<-lm(data$weight~data$height)
abline(model,lwd=2)
prediction<-model[["coefficients"]][1]+model[["coefficients"]][2]*183
axis(1, at=c(183), labels=c("$x_i$"))
axis(2, at=c(93,prediction), labels=c("$y_j$","$f(x_i)$"),las=2)
Arrows(183,prediction,183,93, arr.length = 0.2, arr.width = 0.15, code = 3, arr.type = "triangle", arr.adj=1, col=color2)
segments(183,0,183,prediction, col="grey", lty=2)
segments(0,prediction,183,prediction, col="grey", lty=2)
segments(0,93,183,93, col="grey", lty=2)
text(176,85,"$e_{ij}=y_j-f(x_i)$",col=color2)
text(186,95,"$(x_i,y_j)$")
dev.off()

# X residuals
tikz(file="img/regression/x_residuals.tex", width=7, height=5)
par(mai=c(0.7,0.7,0.5,0.5), cex.lab=1.2, mgp=c(2,0,0))
plot(height~weight, col=color1, main="", xlab="$X$", ylab="$Y$", xlim=c(150,200), pch=16, data=data, axes=F)
box()
model<-lm(data$height~data$weight)
abline(-193.1017,1.4916, lwd=2)
text(174.67,-0.2, expression(italic("x")))
Arrows(188,82.54,188,93, arr.length = 0.2, arr.width = 0.15, code = 3, arr.type = "triangle", arr.adj=1, col=color2)
segments(188,0,188,93, col="grey", lty=2)
segments(0,82.54,188,82.54, col="grey", lty=2)
segments(0,93,188,93, col="grey", lty=2)
text(150.2,82.54, "$g(y_j)$")
text(188,50,"$x_i$")
text(150,93,"$y_j$")
text(186,87,"$e_{ij}$")
text(186,95,"$(x_i,y_j)$")
dev.off()

# Regression lines of weight and height
tikz(file="img/regression/regression_lines.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=0.8, las=1, tck=-0.02)
plot(weight~height, col=color1, main="Regression lines of weight and height", xlab="Height (cm)", ylab="Weight (Kg)", xlim=c(150,200), pch=16, data=data)
abline(-108.49,1.02, lwd=2)
abline(-207.5873,1.5873, lwd=2)
points(174.67,69.67, pch=16, col=color2)
text(173,72,"$(\\bar x, \\bar y)$")
text(195,80,"Weight on Height")
text(185,100,"Height on Weight")
dev.off()

# Perfect linear regression
x=runif(100)
y = 0.7*x +0.15
tikz(file="img/regression/perfect_linear_regression.tex", width=4.5, height=3.3)
par(mai=c(0.3,0.3,0.4,0.2), mgp=c(0.5,0,0))
plot(x,y, ylim=c(0,1), col=color1, main="Perfect linear regression", xlab="$X$", ylab="$Y$", pch=16, axes=F)
box()
modelo = lm(y~x)
abline(modelo, lwd=2)
text(0.7,0.4, "$Y$ on $X$ = $X$ on $Y$")
dev.off()

# Non-linear regression
x=runif(100)
y=runif(100)
tikz(file="img/regression/non_linear_regression.tex", width=4.5, height=3.3)
par(mai=c(0.3,0.3,0.4,0.2), mgp=c(0.5,0,0))
plot(x,y, ylim=c(0,1), col=color1, main="Non-linear regression", xlab="$X$", ylab="$Y$", pch=16, axes=F)
box()
abline(h=mean(y), lwd=2)
abline(v=mean(x), lwd=2)
text(mean(x)+0.08,0.12, "$X$ on $Y$")
text(0.9,mean(y)-0.07, "$Y$ on $X$")
dev.off()

# Variation decomposition
tikz(file="img/regression/variation_decomposition.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=1, las=1, tck=-0.02)
plot(weight~height,col=color1, main="", xlab="$X$", ylab="$Y$", xlim=c(150,205), pch=16, data=data, axes=F)
box()
mean <- mean(data[["weight"]])
model<-lm(data$weight~data$height)
prediction<-model[["coefficients"]][1]+model[["coefficients"]][2]*183
axis(1, at=c(183), labels=c("$x_i$"))
axis(2, at=c(mean,93,prediction), labels=c("$\\bar y$","$y_j$","$f(x_i)$"),las=2)
text(186,96,"$(x_i,y_j)$")
segments(0,93,183,93, col="grey", lty=2)
segments(183,0,183,93, col="grey", lty=2)
abline(h=mean, lty=2, col="grey")
Arrows(149,mean,149,93, arr.length = 0.2, arr.width = 0.15, code = 3, arr.type = "triangle", arr.adj=1, col=color2)
text(149,82,"Total variation", pos=4)
text(149,79,"$y_j-\\bar y$", pos=4)
abline(model,lwd=2)
text(195,102, "Regression line of")
text(195,99, "$Y$ on $X$")
segments(0,coefficients(model)[2]*183+coefficients(model)[1],183,coefficients(model)[2]*183+coefficients(model)[1], col="grey", lty=2)
Arrows(183,mean,183,coefficients(model)[2]*183+coefficients(model)[1], arr.length = 0.2, arr.width = 0.15, code = 3, arr.type = "triangle", arr.adj=1, col=color2)
text(184,74,"Explained variation", pos=4, offset=1)
text(184,71,"$f(x_i)-\\bar y$", pos=4, offset=1)
Arrows(183,coefficients(model)[2]*183+coefficients(model)[1],183,93, arr.length = 0.2, arr.width = 0.15, code = 3, arr.type = "triangle", arr.adj=1, col=color2)
text(184,88,"Non-explained", pos=2, offset=1)
text(184,85,"variation", pos=2, offset=1)
text(184,82,"$e_{ij}=y_j-f(x_i)$", pos=2, offset=1)
dev.off()

# Samples with different correlation
n = 100
tikz(file="img/regression/different_correlations.tex", width=5, height=3.5)
par(mfrow=c(3,3))
for (i in seq(-1,1,by=0.25)){
r = i
x1 = rnorm(n)
x2 = rnorm(n)
y = scale(x2) * r  +  scale(residuals(lm(x1~x2))) * sqrt(1-r*r)
#tikz(file=paste("img/regression/correlation_",i,".tex",sep=""), width=7, height=5)
par(mar=c(1,1,1.4,1))
plot(y~x2, col=color1, main=paste("$r$=",i,sep=""), xlab="$X$", ylab="$Y$", pch=16, axes=F)
model<-lm(y~x2)
abline(model,lwd=2)
box()
}
dev.off()

png(file="img/regression/linear-correlation-0.75.png")
n <- 100
r <- -0.75
x1 <- rnorm(n)
x2 <- rnorm(n)
y <- scale(x2) * r  +  scale(residuals(lm(x1~x2))) * sqrt(1-r*r)
#tikz(file=paste("img/regression/correlation_",i,".tex",sep=""), width=7, height=5)
par(mgp=c(1,0,0))
par(mar=c(3,2,1.4,1))
plot(y~x2, col=color1, xlab="X", ylab="Y", pch=16, xaxt="n", yaxt="n")
dev.off()

# Scatter plot bacteria evolution
data <- read.table("data/hours_bacteria.csv", header=TRUE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)
tikz(file="img/regression/bacteria_evolution.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=0.8, las=1, tck=-0.02)
plot(bacteria~hours, col=color1, main="Evolution of bacteria", xlab="Hours", ylab="Bacteria", pch=16, data=data)
dev.off()

#Regresion lineal horas bacterias
tikz(file="img/regression/linear_regression_bacteria.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=0.8, las=1, tck=-0.02)
plot(bacteria~hours, col=color1, main="Linear regression of Bacteria on Hours", xlab="Hours", ylab="Bacteria", pch=16, data=data)
model <- lm(data$bacteria~data$hours)
abline(model, lwd=2)
text(4,300,"$r^2=0.85$")
dev.off()

# Scatter plot of log(bacteria) evolution
tikz(file="img/regression/log_bacteria_evolution.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=0.8, las=1, tck=-0.02)
plot(log(bacteria)~hours, col=color1, main="Evolution of $\\log$(Bacteria)", xlab="Hours", ylab="$\\log$(Bacterias)", pch=16, data=data)
dev.off()

# Exponential regression of bacteria on hours
tikz(file="img/regression/exponential_regression_bacteria.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=0.8, las=1, tck=-0.02)
plot(bacteria~hours, col=color1, main="Exponential regression of Bacteria on Hours", xlab="Hours", ylab="Bacteria", pch=16, data=data)
model <- lm(log(data$bacteria)~data$hours)
curve(exp(coefficients(model)[1])*exp(coefficients(model)[2]*x), add=T, lwd=2)
text(4,300, "$r^2=0.99$")
dev.off()

# Linear regression in a parabolic relation
x=runif(100,0,10)
z=x+rnorm(100,0,0.1)
y=0.25*z^2-2.5*z+8+rnorm(100,0,0.2)
tikz(file="img/regression/linear_regression_parabolic_relation.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=0.8, las=1, tck=-0.02)
plot(y~x, col =color1, xlab="$X$", ylab="$Y$", pch=16)
model <- lm(y~x)
abline(model, lwd=2)
coeffs <- floor(model$coeff*100)/100
plusorminus <- c("+")
if (coeffs[1] < 0 ) plusorminus <- c("")
text(5,7,paste("\\Large $y=$",coeffs[2],"$x$",plusorminus,coeffs[1]))
text(5,6.3,paste("\\Large $r^2$ =",floor(summary(model)$r.squared*100)/100))
dev.off()


# Parabolic regression
tikz(file="img/regression/parabolic_regression.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=0.8, las=1, tck=-0.02)
plot(y~x, col =color1, xlab="$X$", ylab="$Y$", pch=16)
model <- lm(y~x+I(x^2))
curve(coefficients(model)[1]+coefficients(model)[2]*x+coefficients(model)[3]*x^2, add=T, lwd=2)
coeffs <- floor(model$coeff*100)/100
plusorminus <- c("+")
if (coeffs[1] < 0 ) plusorminus <- c("")
text(5,7,paste("\\Large $y$=",coeffs[3],"$x^2$",coeffs[2],"$x$",plusorminus,coeffs[1]))
text(5,6.3,paste("\\Large $r^2$ =",floor(summary(model)$r.squared*100)/100))
dev.off()

# Scatterplot with outliers
x=runif(9,0,10)
y=-0.5*x+5+rnorm(9,0,0.2)
tikz(file="img/regression/scatterplot_with_outliers.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=0.8, las=1, tck=-0.02)
plot(y~x, col =color1, main="Scatter plot with outliers", xlim=c(0,10), ylim=c(0,10), xlab="$X$", ylab="$Y$", pch=16)
points(8,8,pch=16,col=color2)
text(7,8,"Outlier")
dev.off()

# Linear regression without outliers
tikz(file="img/regression/linear_regression_without_outliers.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=0.8, las=1, tck=-0.02)
plot(y~x, col =color1, main="Linear regression without outliers", xlim=c(0,10), ylim=c(0,10), xlab="$X$", ylab="$Y$", pch=16)
points(8,8,pch=16,col=color1)
model <- lm(y~x)
abline(model, lwd=2)
coeffs <- floor(model$coeff*100)/100
plusorminus <- c("+")
if (coeffs[1] < 0 ) plusorminus <- c("")
text(5,7,paste("\\Large $y$=",coeffs[2],"x",plusorminus,coeffs[1]))
text(5,6.1,paste("\\Large $r^2$ =",floor(summary(model)$r.squared*100)/100))
dev.off()

# Linear regression with outliers
x=c(x,8)
y=c(y,8)
tikz(file="img/regression/linear_regression_with_outliers.tex", width=4.5, height=3.3)
par(mar=c(2.9,2.9,2,1), mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=0.8, las=1, tck=-0.02)
plot(y~x, col =color1, main="Linear regression with outliers", xlim=c(0,10), ylim=c(0,10), xlab="$X$", ylab="$Y$", pch=16)
model <- lm(y~x)
abline(model, lwd=2)
coeffs <- floor(model$coeff*100)/100
plusorminus <- c("+")
if (coeffs[1] < 0 ) plusorminus <- c("")
text(5,7,paste("\\Large $y$=",coeffs[2],"x",plusorminus,coeffs[1]))
text(5,6.1,paste("\\Large $r^2$ =",floor(summary(model)$r.squared*100)/100))
dev.off()

# Simpson's paradox
set.seed(1234)
hours1 <- runif(50, 0, 9)
score1 <- 0.4 * hours1 + 4 + rnorm(50, mean = 0, sd = 1)
hours2 <- runif(50, 5, 15)
score2 <-  0.2 * hours2 + 1 + rnorm(50, mean = 0, sd = 1)
score <- c(score1, score2)
hours <- c(hours1, hours2)
tikz(file="img/regression/simpson_paradox_1.tex", width=4.5, height=3.3)
par(mar = c(2.9, 2.9, 2, 1), mgp = c(1.8, 0.6, 0), cex.lab = 1, cex.axis = 0.8, las = 1, tck = -0.02)
plot(score ~ hours, col =color1, main="Linear regression of score on hours of study", xlim=c(0,16), ylim=c(0,10), xlab="Weekly hours of study", ylab="Score", pch=16)
model <- lm(score ~ hours)
abline(model, lwd=2)
coeffs <- floor(model$coeff*100)/100
plusorminus <- c("+")
if (coeffs[1] < 0 ) plusorminus <- c("")
text(10, 9, paste("$y=", coeffs[2], "x", plusorminus, coeffs[1], "$"), pos = 4)
text(10, 8.2, paste("$r=", round(cor(hours, score), 2), "$"), pos = 4)
dev.off()

tikz(file="img/regression/simpson_paradox_2.tex", width=4.5, height=3.3)
par(mar = c(2.9, 2.9 , 2, 1), mgp = c(1.8, 0.6, 0), cex.lab = 1, cex.axis = 0.8, las = 1, tck = -0.02)
plot(score1 ~ hours1, col =color1, main="Linear regression of score on hours of study", xlim=c(0,16), ylim=c(0,10), xlab="Weekly hours of study", ylab="Score", pch=16)
points(score2 ~ hours2, col =color2, pch=16)
model1 <- lm(score1 ~ hours1)
abline(model1, lwd=2, col = color1)
coeffs1 <- floor(model1$coeff*100)/100
plusorminus <- c("+")
if (coeffs1[1] < 0 ) plusorminus <- c("")
text(0, 8.5, paste("$y=", coeffs1[2], "x", plusorminus, coeffs1[1], "$"), pos = 4)
text(0, 7.7, paste("$r=", round(cor(hours1, score1), 2), "$"), pos = 4)
model2 <- lm(score2 ~ hours2)
abline(model2, lwd=2, col = color2)
coeffs2 <- floor(model2$coeff*100)/100
plusorminus <- c("+")
if (coeffs2[1] < 0 ) plusorminus <- c("")
text(10, 0.8, paste("$y=", coeffs2[2], "x", plusorminus, coeffs2[1], "$"), pos = 4)
text(10, 0, paste("$r=", round(cor(hours2, score2), 2), "$"), pos = 4)
legend("top", legend=c("Good students", "Bad students"), fill=c(color1, color2), cex = 0.8, horiz = T)
dev.off()

