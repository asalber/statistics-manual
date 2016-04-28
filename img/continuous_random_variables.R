setwd("/media/alf/datos/drive/CEU/DOCENCIA/materiales/estadistica/presentaciones/statistics_course")
library(tikzDevice)
library(plyr)
library(plotly)
library(shape)
require(Hmisc)

# Color definition
color1=rgb(5,161,230,max=255)
color2=rgb(238,50,36,max=255)
color3="green3"
color4=rgb(169,78,145,max=255)


options(tikzDefaultEngine = "xetex")

# Density function 
tikz(file="img/continuous_random_variables/density_function.tex", width=5, height=4)
x<-seq(0,30,length=100) 
y2<-dchisq(x,df=10) 
par(mar=c(3.5,3.5,2,1), mgp=c(2.2,0.6,0))
plot(x, y2, xlim=c(0,30), ylim=c(0,0.11), type="n", xlab="$X$", ylab="Probability density $f(x)$", yaxs="i", axes=FALSE) 
axis(side=1, at=c(x[20],x[60]), labels=c("a","b"))
polygon(c(x[20],x[20:60],x[60]), c(0,y2[20:60],0), col=color1, lty=0) 
lines(x, y2, type="l")
text(12,0.02,"$\\displaystyle \\int_a^b f(x)\\,dx$")
box()
dev.off()

#Función de densidad uniforme
x11()
par(cex.lab=1.2)
x <- seq(0, 1, length=10)
plot(x, dunif(x, min=0, max=1), xlab="X", xlim=c(-0.1,1.1), ylim=c(0,1.2),ylab=expression(paste("Densidad ",italic(f(x)))), main="Distribución Uniforme U(0,1)", type="l")
abline(h=0, col="gray")
segments(0,0,0,1, lty=2, col="gray")
segments(1,0,1,1, lty=2, col="gray")
dev.copy2eps(file="img/variables_aleatorias_continuas/funcion_densidad_uniforme.eps", width=5, height=5, pointsize=10)
dev.off()

xfig(file="img/variables_aleatorias_continuas/funcion_densidad_uniforme.fig", onefile=TRUE, width=5, height=5, pointsize=10)
par(cex.lab=1.2)
x <- seq(0, 1, length=10)
plot(x, dunif(x, min=0, max=1), xlab="X", xlim=c(-0.1,1.1), ylim=c(0,1.2),ylab=expression(paste("Densidad ",italic(f(x)))), main="Distribución Uniforme U(0,1)", type="l")
abline(h=0, col="gray")
segments(0,0,0,1, lty=2, col="gray")
segments(1,0,1,1, lty=2, col="gray")
dev.off()


#Calculo de probabilidades con la uniforme
x = seq(0, 15, by=5)
y = dunif(x, min=0, max=15)
x11()
par(cex.lab=1.2)
plot(x, y, xlab="X", xlim=c(-0.5,15.5), ylim=c(0,0.08),ylab=expression(paste("Densidad ",italic(f(x)))), main="Distribución Uniforme U(0,15)", type="l")
abline(h=0, col="gray")
polygon(c(x[2],x[2],x[3],x[3]), c(0,y[1],y[2],0), col="coral", lty=0)
text(7.5,0.04,"P(5<X<10)=")
text(7.5,0.03,"Int(1/15*dx)")
segments(0,0,0,1/15, lty=2, col="gray")
segments(15,0,15,1/15, lty=2, col="gray")
dev.copy2eps(file="img/variables_aleatorias_continuas/calculo_probabilidades_uniforme.eps", width=5, height=5, pointsize=10)
dev.off()

xfig(file="img/variables_aleatorias_continuas/calculo_probabilidades_uniforme.fig", onefile=TRUE, width=5, height=5, pointsize=10)
par(cex.lab=1.2)
plot(x, y, xlab="X", xlim=c(-0.5,15.5), ylim=c(0,0.08),ylab=expression(paste("Densidad ",italic(f(x)))), main="Distribución Uniforme U(0,15)", type="l")
abline(h=0, col="gray")
polygon(c(x[2],x[2],x[3],x[3]), c(0,y[1],y[2],0), col="coral", lty=0)
text(7.5,0.04,"P(5<X<10)=")
text(7.5,0.03,"Int(1/15*dx)")
segments(0,0,0,1/15, lty=2, col="gray")
segments(15,0,15,1/15, lty=2, col="gray")
dev.off()


#Función de distribución uniforme
x11()
par(cex.lab=1.2)
x <- seq(0, 1, length=10)
plot(x, punif(x, min=0, max=1), xlab="X", xlim=c(-0.1,1.1), ylim=c(0,1.2),ylab=expression(paste("Probabilidad acumulada ",italic(F(x)))), main="Distribución Uniforme U(0,1)", type="l")
abline(h=0, col="gray")
dev.copy2eps(file="img/variables_aleatorias_continuas/funcion_distribucion_uniforme.eps", width=5, height=5, pointsize=10)
dev.off()

xfig(file="img/variables_aleatorias_continuas/funcion_distribucion_uniforme.fig", onefile=TRUE, width=5, height=5, pointsize=10)
par(cex.lab=1.2)
x <- seq(0, 1, length=10)
plot(x, punif(x, min=0, max=1), xlab="X", xlim=c(-0.1,1.1), ylim=c(0,1.2),ylab=expression(paste("Probabilidad acumulada ",italic(F(x)))), main="Distribución Uniforme U(0,1)", type="l")
abline(h=0, col="gray")
dev.off()


#Función de densidad de la normal estándar
x11()
par(cex.lab=1.2)
x <- seq(-3.291, 3.291, length=100)
plot(x, dnorm(x, mean=0, sd=1), xlab="X", ylab=expression(paste("Densidad ",italic(f(x)))), main=expression(paste("Distribución normal estándar N(", mu, " = 0, ", sigma, " = 1)")), type="l")
abline(h=0, col="gray")
dev.copy2eps(file="img/variables_aleatorias_continuas/funcion_densidad_normal_estandar.eps", width=5, height=5, pointsize=10)
dev.off()

xfig(file="img/variables_aleatorias_continuas/funcion_densidad_normal_estandar.fig", onefile=TRUE, width=5, height=5, pointsize=10)
plot(x, dnorm(x, mean=0, sd=1), xlab="X", ylab=expression(paste("Densidad ",italic(f(x)))), main=expression(paste("Distribución normal estándar N(", mu, " = 0, ", sigma, " = 1)")), type="l")
abline(h=0, col="gray")
dev.off()


#Función de densidad de normales con distinta media
x <- seq(-3.291, 3.291, length=100)
x11()
par(cex.lab=1.2)
plot(x, dnorm(x, mean=0, sd=1), xlim=c(-3.3,5.3), xlab="X", ylab=expression(paste("Densidad ",italic(f(x)))), main="Distribuciones normales con la misma varianza y distintas medias", type="l", col="coral")
lines(x+2, dnorm(x, mean=0, sd=1), type="l", col="royalblue1")
abline(h=0, col="gray")
legend(2.5, .4, lty=1, col=c("coral","royalblue1"), legend=expression(X==N(mu==0,sigma==1),Y==N(mu==2,sigma==1)), bty="n") 
dev.copy2eps(file="img/variables_aleatorias_continuas/funcion_densidad_normales_distinta_media.eps", width=5, height=5, pointsize=10)
dev.off()

xfig(file="img/variables_aleatorias_continuas/funcion_densidad_normales_distinta_media.fig", onefile=TRUE, width=5, height=5, pointsize=10)
par(cex.lab=1.2)
plot(x, dnorm(x, mean=0, sd=1), xlim=c(-3.3,5.3), xlab="X", ylab=expression(paste("Densidad ",italic(f(x)))), main="Distribuciones normales con la misma varianza y distintas medias", type="l", col="coral")
lines(x+2, dnorm(x, mean=0, sd=1), type="l", col="royalblue1")
abline(h=0, col="gray")
legend(2.5, .4, lty=1, col=c("coral","royalblue1"), legend=expression(X==N(mu==0,sigma==1),Y==N(mu==2,sigma==1)), bty="n") 
dev.off()


#Función de densidad de normales con distinta varianza
x = seq(-3.291, 3.291, length=100)
y = seq(-6.581, 6.581, length=100)
x11()
par(cex.lab=1.2)
plot(x, dnorm(x, mean=0, sd=1), xlim=c(-6.6,6.6), xlab="X", ylab=expression(paste("Densidad ",italic(f(x)))), main="Distribuciones normales con la misma media y distinta varianza", type="l", col="coral")
lines(y, dnorm(y, mean=0, sd=2), type="l", col="royalblue1")
abline(h=0, col="gray")
legend(2.2, .4, lty=1, col=c("coral","royalblue1"), legend=expression(X==N(mu==0,sigma==1),Y==N(mu==0,sigma==2)), bty="n") 
dev.copy2eps(file="img/variables_aleatorias_continuas/funcion_densidad_normales_distinta_varianza.eps", width=5, height=5, pointsize=10)
dev.off()

xfig(file="img/variables_aleatorias_continuas/funcion_densidad_normales_distinta_varianza.fig", onefile=TRUE, width=5, height=5, pointsize=10)
par(cex.lab=1.2)
plot(x, dnorm(x, mean=0, sd=1), xlim=c(-6.6,6.6), xlab="X", ylab=expression(paste("Densidad ",italic(f(x)))), main="Distribuciones normales con la misma media y distinta varianza", type="l", col="coral")
lines(y, dnorm(y, mean=0, sd=2), type="l", col="royalblue1")
abline(h=0, col="gray")
legend(2.2, .4, lty=1, col=c("coral","royalblue1"), legend=expression(X==N(mu==0,sigma==1),Y==N(mu==0,sigma==2)), bty="n") 
dev.off()


#Función de distribución de la normal estándar
x11()
par(cex.lab=1.2)
x <- seq(-3.291, 3.291, length=100)
plot(x, pnorm(x, mean=0, sd=1), xlab="X", ylab=expression(paste("Probabilidad acumulada ",italic(F(x)))), main=expression(paste("Distribución normal estándar N(", mu, " = 0, ", sigma, " = 1)")), type="l")
abline(h=0, col="gray")
dev.copy2eps(file="img/variables_aleatorias_continuas/funcion_distribucion_normal_estandar.eps", width=5, height=5, pointsize=10)
dev.off()

xfig(file="img/variables_aleatorias_continuas/funcion_distribucion_normal_estandar.fig", onefile=TRUE, width=5, height=5, pointsize=10)
par(cex.lab=1.2)
plot(x, pnorm(x, mean=0, sd=1), xlab="X", ylab=expression(paste("Probabilidad acumulada ",italic(F(x)))), main=expression(paste("Distribución normal estándar N(", mu, " = 0, ", sigma, " = 1)")), type="l")
abline(h=0, col="gray")
dev.off()


#Calculo de probabilidades con la función de distribución de la normal estándar cola izda
x = seq(-3.48, 3.49, by=0.05)
y = dnorm(x,mean=0,sd=1)
x0 = x[81]
p0 = floor(pnorm(x0, mean=0, sd=1, lower.tail=TRUE)*10000)/10000
x11()
par(cex.lab=1.2)
plot(x, y, xlab="X", ylab=expression(paste("Densidad ",italic(f(x)))), main=expression(paste("Distribución normal estándar N(", mu, " = 0, ", sigma, " = 1)")), type="l")
polygon(c(x[1],x[1:81],x[81]), c(0,y[1:81],0), col="coral", lty=0)
lines (x, y, type="l")
axis(side=1,c(x0))
text(-0.5,0.06,paste("F(",x0,")=",p0))
abline(h=0, col="gray")
dev.copy2eps(file="img/variables_aleatorias_continuas/calculo_probabilidades_normal_estandar.eps", width=5, height=5, pointsize=10)
dev.off()

xfig(file="img/variables_aleatorias_continuas/calculo_probabilidades_normal_estandar.fig", onefile=TRUE, width=5, height=5, pointsize=10)
par(cex.lab=1.2)
plot(x, y, xlab="X", ylab=expression(paste("Densidad ",italic(f(x)))), main=expression(paste("Distribución normal estándar N(", mu, " = 0, ", sigma, " = 1)")), type="l")
polygon(c(x[1],x[1:81],x[81]), c(0,y[1:81],0), col="coral", lty=0)
lines (x, y, type="l")
axis(side=1,c(x0))
text(-0.5,0.06,paste("F(",x0,")=",p0))
abline(h=0, col="gray")
dev.off()


#Calculo de probabilidades con la función de distribución de la normal estándar cola drcha
x = seq(-3.48, 3.49, by=0.05)
y = dnorm(x,mean=0,sd=1)
x0 = x[81]
p0 = floor(pnorm(x0, mean=0, sd=1, lower.tail=TRUE)*10000)/10000
x11()
par(cex.lab=1.2)
plot(x, y, xlab="X", ylab=expression(paste("Densidad ",italic(f(x)))), main=expression(paste("Distribución normal estándar N(", mu, " = 0, ", sigma, " = 1)")), type="l")
polygon(c(x[81],x[81:140],x[140]), c(0,y[81:140],0), col="coral", lty=0)
polygon(c(x[1],x[1:81],x[81]), c(0,y[1:81],0), col="royalblue1", lty=0) 
axis(side=1,c(x0))
text(-0.5,0.06,paste("F(",x0,")=",p0))
text(1.3,0.06,paste("P(X>",x0,")="))
text(1.3,0.04,paste("1-F(",x0,")="))
text(1.3,0.02,"1-0.6985=0.3015")
abline(h=0, col="gray")
dev.copy2eps(file="img/variables_aleatorias_continuas/calculo_probabilidades_derecha_normal_estandar.eps", width=5, height=5, pointsize=10)
dev.off()

xfig(file="img/variables_aleatorias_continuas/calculo_probabilidades_derecha_normal_estandar.fig", onefile=TRUE, width=5, height=5, pointsize=10)
par(cex.lab=1.2)
plot(x, y, xlab="X", ylab=expression(paste("Densidad ",italic(f(x)))), main=expression(paste("Distribución normal estándar N(", mu, " = 0, ", sigma, " = 1)")), type="l")
polygon(c(x[81],x[81:140],x[140]), c(0,y[81:140],0), col="coral", lty=0)
polygon(c(x[1],x[1:81],x[81]), c(0,y[1:81],0), col="royalblue1", lty=0) 
axis(side=1,c(x0))
text(-0.5,0.06,paste("F(",x0,")=",p0))
text(1.3,0.06,paste("P(X>",x0,")="))
text(1.3,0.04,paste("1-F(",x0,")="))
text(1.3,0.02,"1-0.6985=0.3015")
abline(h=0, col="gray")
dev.copy2eps(file="img/variables_aleatorias_continuas/calculo_probabilidades_derecha_normal_estandar.eps", width=5, height=5, pointsize=10)
dev.off()


#Función de densidad de la chi cuadrado
x = seq(0, 24.103, length=100)
y1 = dchisq(x, df=1)
y2 = dchisq(x, df=3)
y3 = dchisq(x, df=10)
x11()
par(cex.lab=1.2)
plot(x, y1, xlab="X", ylim=c(0,0.3), ylab=expression(paste("Densidad ",italic(f(x)))), main="Distintas distribuciones chi-cuadrado", col="coral", type="l")
lines(x, y2, type="l", col="royalblue1")
lines(x, y3, type="l", col="lightgreen")
abline(h=0, col="gray")
legend(20, 0.3, lty=1, col=c("coral","royalblue1","lightgreen"), legend=expression(Chi^2(1),Chi^2(3),Chi^2(10)), bty="n") 
dev.copy2eps(file="img/variables_aleatorias_continuas/funcion_densidad_chi_cuadrado.eps", width=5, height=5, pointsize=10)
dev.off()

xfig(file="img/variables_aleatorias_continuas/funcion_densidad_chi_cuadrado.fig", onefile=TRUE, width=5, height=5, pointsize=10)
par(cex.lab=1.2)
plot(x, y1, xlab="X", ylim=c(0,0.3), ylab=expression(paste("Densidad ",italic(f(x)))), main="Distintas distribuciones chi-cuadrado", col="coral", type="l")
lines(x, y2, type="l", col="royalblue1")
lines(x, y3, type="l", col="lightgreen")
abline(h=0, col="gray")
legend(20, 0.3, lty=1, col=c("coral","royalblue1","lightgreen"), legend=expression(Chi^2(1),Chi^2(3),Chi^2(10)), bty="n") 
dev.off()


#Función de densidad de la t de student
x = seq(-4.587, 4.587, length=100)
y1 = dt(x, df=1)
y2 = dt(x, df=3)
y3 = dt(x, df=10)
x11()
par(cex.lab=1.2)
plot(x, y1, xlab="X", ylim=c(0,0.4), ylab=expression(paste("Densidad ",italic(f(x)))), main="Distintas distribuciones t de student", type="l", col="coral")
lines(x, y2, type="l", col="royalblue1")
lines(x, y3, type="l", col="lightgreen")
abline(h=0, col="gray")
legend(3, 0.4, lty=1, col=c("coral","royalblue1","lightgreen"), legend=expression(T(1),T(3),T(10)), bty="n") 
dev.copy2eps(file="img/variables_aleatorias_continuas/funcion_densidad_t_student.eps", width=5, height=5, pointsize=10)
dev.off()

xfig(file="img/variables_aleatorias_continuas/funcion_densidad_t_student.fig", onefile=TRUE, width=5, height=5, pointsize=10)
par(cex.lab=1.2)
plot(x, y1, xlab="X", ylim=c(0,0.4), ylab=expression(paste("Densidad ",italic(f(x)))), main="Distintas distribuciones t de student", type="l", col="coral")
lines(x, y2, type="l", col="royalblue1")
lines(x, y3, type="l", col="lightgreen")
abline(h=0, col="gray")
legend(3, 0.4, lty=1, col=c("coral","royalblue1","lightgreen"), legend=expression(T(1),T(3),T(10)), bty="n") 
dev.off()


#Función de densidad de la F de Fisher
x = seq(0,5, length=200)
y1 = df(x, df1=3, df2=3)
y2 = df(x, df1=10, df2=5)
y3 = df(x, df1=10, df2=20)
x11()
par(cex.lab=1.2)
plot(x, y1, xlab="X", ylim=c(0,0.9), ylab=expression(paste("Densidad ",italic(f(x)))), main="Distintas distribuciones F de Fisher-Snedecor", type="l", col="coral")
lines(x, y2, type="l", col="royalblue1")
lines(x, y3, type="l", col="lightgreen")
abline(h=0, col="gray")
legend(3.8, 0.9, lty=1, col=c("coral","royalblue1","lightgreen"), legend=expression(F(3,3),F(10,5),F(10,20)), bty="n") 
dev.copy2eps(file="img/variables_aleatorias_continuas/funcion_densidad_f_fisher.eps", width=5, height=5, pointsize=10)
dev.off()

xfig(file="img/variables_aleatorias_continuas/funcion_densidad_f_fisher.fig", onefile=TRUE, width=5, height=5, pointsize=10)
par(cex.lab=1.2)
plot(x, y1, xlab="X", ylim=c(0,0.9), ylab=expression(paste("Densidad ",italic(f(x)))), main="Distintas distribuciones F de Fisher-Snedecor", type="l", col="coral")
lines(x, y2, type="l", col="royalblue1")
lines(x, y3, type="l", col="lightgreen")
abline(h=0, col="gray")
legend(3.8, 0.9, lty=1, col=c("coral","royalblue1","lightgreen"), legend=expression(F(3,3),F(10,5),F(10,20)), bty="n") 
dev.off()


