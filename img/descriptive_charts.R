# Author: Alfredo Sánchez Alberca (asalber@ceu.es)

setwd("/media/alf/datos/drive/CEU/DOCENCIA/materiales/estadistica/presentaciones/statistics_manual")
library(tikzDevice)
library(plyr)
library(plotly)
require(Hmisc)

# Colors
blueceu <- rgb(5,161,230,255,maxColorValue = 255) #0099CC
blueceulight <- rgb(137,211,243,255,maxColorValue = 255) #89D3F3
redceu <- rgb(238,50,36,255,maxColorValue = 255) #FF3333
greenceu <- rgb(194,205,255,255,maxColorValue = 255) #CCCC33
orangeceu <- rgb(248,131,121,255,maxColorValue = 255)#F88379
purpleceu <- rgb(169,78,145,255,maxColorValue = 255) #996699
greyceu <- rgb(117,117,97,255,maxColorValue = 255) #666666

options(tikzDefaultEngine = "pdftex")
# Bar chart
data <- read.table("data/children_cars_data.csv", header=TRUE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)
tab <- table(data$children)
# Absolute frequency bar chart of number of children
tikz(file="img/descriptive/abs_freq_bar_chart_polygon.tex", width=7, height=5)
par(cex.lab=1.2)
barplot(tab,space=0.5, main="Absolute frequency distribution of number of children", xlab="Number of children", ylab="Absolute frequency $n_i$", col=blueceulight)
lines(c(1,2.5,4,5.5,7),tab,col="royalblue1",lwd=3)
dev.off()

freq<-count(data,'children')
p<-plot_ly(x=freq[["children"]],y=freq[["freq"]],type="bar")
p<-add_trace(p,y=freq[["freq"]],type="scatter")
layout(p,title="Absolute frequency distribution of number of children", xaxis=list(title="Number of children"), yaxis=list(title="Absolute frequency"), autosize=FALSE, width=600, height=400, bargap=0.5, showlegend=FALSE)

# Relative frequency bar chart and polygon
relfreq<-freq[["freq"]]/sum(freq[["freq"]])
p<-plot_ly(x=freq[["children"]],y=relfreq,type="bar",name="bar")
p<-add_trace(p,y=relfreq,type="scatter",name="polygon")
layout(p,title="Relative frequency distribution of number of children", xaxis=list(title="Number of children"), yaxis=list(title="Relative frequency"), autosize=FALSE, width=600, height=400, bargap=0.5, showlegend=FALSE)


#plotly_POST(p, filename = "descriptive/absolute-barchart")

# Cumulative absolute frequency bar chart of number of children
tikz(file="img/descriptive/cum_abs_freq_bar_chart_polygon.tex", width=7, height=5)
tabcum <- cumsum(tab)
par(cex.lab=1.2)
barplot(tabcum, space=0.5, main="Cumulative absolute frequency distribution of number of children", xlab="Number of children", ylab="Cumulative absolute frequency $N_i$", col=blueceulight)
lines(c(0,1,1,2.5,2.5,4,4,5.5,5.5,7,7,8.5),c(0,0,2,2,8,8,22,22,24,24,25,25),col=redceu, lwd=3)
dev.off()

cumfreq<-cumsum(freq[["freq"]])
p<-plot_ly(x=freq[["children"]],y=cumfreq,type="bar")
p<-layout(p,title="Cumulative absolute frequency distribution of number of children", xaxis=list(title="Number of children"), yaxis=list(title="Cumulative absolute frequency"), autosize=FALSE, width=600, height=400, bargap=0.5)
#plotly_POST(p, filename = "descriptive/cumulative-relative-barchart")

# Cumulative relative frequency bar chart and polygon
cumrelfreq<-c(0,cumfreq/sum(freq[["freq"]]))
p<-plot_ly(x=c(0,freq[["children"]]),y=cumrelfreq,type="bar",name="bar")
p<-add_trace(p,y=cumrelfreq,type="scatter",name="polygon",line = list(shape = "hv"))
p<-layout(p,title="Cumulative relative frequency distribution of number of children", xaxis=list(title="Number of children"), yaxis=list(title="Cumulative relative frequency"), autosize=FALSE, width=600, height=400, bargap=0.5, showlegend=FALSE)
#plotly_POST(p, filename = "descriptive/cumulative-relative-barchart")

data <- read.table("data/height_weight_data.csv", header=TRUE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)
library(agricolae)
# Absolute frequency histogram of height
tikz(file="img/descriptive/abs_freq_histogram_polygon.tex", width=7, height=5)
par(cex.lab=1.2)
(h <- hist(data$height, ylim=c(0,12), main="Absolute frequency distribution of Height", xlab="Height (cm)", ylab="Absolute frequency $n_i$", col=blueceulight))
polygon.freq(h,frequency=1,col=blueceulight,lwd=3)
dev.off()

p<-plot_ly(x=data[["height"]],type="histogram", marker=list(line=list(width=1)))
layout(p,title="Absolute frequency distribution of heights", xaxis=list(title="Height"), yaxis=list(title="Absolute frequency"), autosize=FALSE, width=600, height=400)

# Relative frequency histogram of height with polygon
p<-plot_ly(x=data[["height"]],type="histogram", marker=list(line=list(width=1)),histnorm="probability",name="bar")
p<-add_trace(p,x=c(155,165,175,185,195),y=c(0.0667,0.2667,0.3667,0.2333,0.0667),type="scatter",name="polygon")
layout(p,title="Relative frequency distribution of heights", xaxis=list(title="Height"), yaxis=list(title="Relative frequency"), autosize=FALSE, width=600, height=400, showlegend=FALSE)


# Cumulative absolute frequency histogram of height
tikz(file="img/descriptive/cum_abs_freq_histogram_polygon.tex", width=7, height=5)
par(cex.lab=1.2)
h <- hist(data$height, plot=FALSE)
h$counts <- cumsum(h$counts)
plot(h, main="Cumulative absolute frequency distribution of Height", xlab="Height (cm)", ylab="Cumulative absolute frequency $N_i$", col=blueceulight)
yy <- c(0, h$counts)
lines(h$breaks, yy, lwd=3, col = blueceulight) 
dev.off()

# Cumulative relative frequency histogram of height
tikz(file="img/descriptive/cum_rel_freq_histogram_polygon.tex", width=7, height=5)
par(cex.lab=1.2)
h <- hist(data$height, plot=FALSE)
h$counts <- cumsum(h[["counts"]])/sum(h[["counts"]])
plot(h, main="Cumulative relative requency distribution of Height", xlab="Height (cm)", ylab="Cumulative relative frequency $F_i$", col=blueceulight)
yy <- c(0, h[["counts"]])
lines(h$breaks, yy, lwd=3, col = blueceulight) 
dev.off()

h <- hist(data$height, plot=FALSE)
h$counts <- cumsum(h[["counts"]])/sum(h[["counts"]])
p<-plot_ly(x=h[["mids"]], y=h[["counts"]],type="bar", marker=list(line=list(width=1)),name="bar")
p<-add_trace(p,x=h[["breaks"]],y=c(0,h[["counts"]]),type="scatter",name="ogive")
layout(p,title="Cumulative relative frequency distribution of heights", xaxis=list(title="Height"), yaxis=list(title="Cumulative relative frequency"), autosize=FALSE, width=600, height=400, bargap=0, showlegend=FALSE)

# Histogram by sex
tikz(file="img/descriptive/factor_histogram.tex", width=5, height=5)
options(digits=1)
par(cex.lab=1.2)
out <- histbackback(split(data$height, data$sex), xlim=c(-10,10), main = 'Frequency distribution histogram of Height by Gender', xlab=c("male", "female"), ylab="Height")
abline(v= (-8:8)*2 , col ="gray" , lty =3) 
barplot(-out$left, col=blueceulight , horiz=TRUE, space=0, add=TRUE, axes=FALSE) 
barplot(out$right, col=orangeceu, horiz=TRUE, space=0, add=TRUE, axes=FALSE) 
dev.off()

# Box and whiskers plot by sex
tikz(file="img/descriptive/factor_box_plot.tex", width=5, height=5)
options(digits=2)
par(cex.lab=1.2)
boxplot(height~sex, main="Frequency distribution box plot of Height by Gender", ylab="Height", xlab="Gender", ylim=c(150,200), labels=c("Male","Female"), col=c(blueceulight,orangeceu), data=data)
dev.off()

# Pie chart
data <- read.table("data/blood_types_data.csv", header=TRUE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)
tikz(file="img/descriptive/rel_freq_pie_chart.tex", width=7, height=5)
par(cex.lab=1.2, mai=c(0,0,.5,0))
tab <- table(data[["blood.type.child"]])
labels <- labels(tab)[[1]]
pctg <- round(tab/sum(tab)*100,2)
labels <- paste(labels, pctg) # add percents to labels 
labels <- paste(labels,"\\%",sep="") # ad % to labels 
pie(tab, main="Relative frequency distribution of blood types", labels=labels, col=c(greenceu, redceu, blueceu, "brown"))
dev.off()

freq<-count(data,'blood.type.child')
p<-plot_ly(labels=freq[["blood.type.child"]],values=freq[["freq"]], type="pie")
layout(p,title="Relative frequency distribution of blood types", autosize=FALSE, width=600, height=400)

# Box plot newborn
data <- read.table("data/newborn_weights.csv", header=TRUE, sep=" ", na.strings="NA", dec=".", strip.white=TRUE)
tikz(file="img/descriptive/boxplot.tex", width=7, height=5)
par(cex.lab=1.2)
boxplot(data$weight, horizontal=TRUE, col=blueceulight, pch=16, main="Box plot of newborn weights", xlab="Weight (Kg)")
text(2.9,0.75,expression(italic(Q[1])))
text(3.1,0.75,expression(italic(Q[2])))
text(3.4,0.75,expression(italic(Q[3])))
text(1.95,0.95,"Min")
text(4.5,0.95,"Max")
text(1.95,1.06,"Outlier",col="red")
text(4.5,1.06,"Outlier",col="red")
dev.off()

# Box plot children
data <- read.table("data/children_cars_data.csv", header=TRUE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)
tikz(file="img/descriptive/boxplot_children.tex", width=7, height=5)
par(cex.lab=1.2)
boxplot(data$children, horizontal=TRUE, col=blueceulight, pch=16, main="Box plot of number of children", xlab="Number of children")
dev.off()

# Symmetrical histrogram
x <- rnorm(1000000)
m <- mean(x)
tikz(file="img/descriptive/symmetrical_distribution.tex", width=7, height=5)
layout(matrix(c(1,2),2,1),heights=c(3,1))
par(mai=c(0,1,0.5,0),cex.lab=1.2)
hist(x,xlim=c(-3.5,3.5),breaks=50, ylim=c(0,0.4), xaxt="n", prob=T, main="Symmetrical distribution $g1=0$", xlab ="", ylab="Relative frequency", col=blueceulight)
axis(1,at=m,labels="$\\bar x=Me$")
par(mai=c(0,1,0,0))
boxplot(x,horizontal=TRUE,axes=FALSE, outline=FALSE, col=blueceulight)
dev.off()

# left-skewed histogram
x <- rf(1000000,8,8)
m <- mean(x)
me <- median(x)
tikz(file="img/descriptive/left_skewed_distribution.tex", width=7, height=5)
layout(matrix(c(1,2),2,1),heights=c(3,1))
par(mai=c(0,1,0.5,0),cex.lab=1.2)
hist(-x, xaxt="n", breaks=700, xlim=c(-5,0), prob=T, main="Left-skewed distribution $g_1<0$", ylab="Relative frequency", col=blueceulight)
axis(1,at=c(-m,-me),labels=c("$\\bar x$","$Me$"))
par(mai=c(0,1,0,0))
boxplot(-x, horizontal=TRUE, ylim=c(-5,0), axes=FALSE, outline=FALSE, col=blueceulight)
dev.off()

# right-skewed histogram
tikz(file="img/descriptive/right_skewed_distribution.tex", width=7, height=5)
layout(matrix(c(1,2),2,1),heights=c(3,1))
par(mai=c(0,1,0.5,0),cex.lab=1.2)
hist(x, xaxt="n", breaks=700, xlim=c(0,5), prob=T, main="Right-skewed distribution $g_1>0$", ylab="Relative frequency", col=blueceulight)
axis(1,at=c(m,me),labels=c("$\\bar x$","$Me$"))
par(mai=c(0,1,0,0))
boxplot(x, horizontal=TRUE, ylim=c(0,5), axes=FALSE, outline=FALSE, col=blueceulight)
dev.off()

# mesokurtic distribution
par(cex.lab=1.2)
x <- rnorm(1000000)
m <- mean(x)
tikz(file="img/descriptive/mesokurtic_distribution.tex", width=7, height=5)
hist(x,xlim=c(-3.5,3.5), breaks=50, ylim=c(0,0.4),prob=T, main="Mesokurtic distribution $g_2=0$" , xlab ="", ylab="Relative frequency", col=blueceulight, axes=F)
axis(1,at=m,labels="$\\bar x$")
axis(2)
curve(dnorm, from=-3.5, to=3.5, add=TRUE, col=redceu, lwd=2) 
dev.off()


# platykurtic distribution
x1 <- runif(200000,-3,3)
x2 <- runif(200000,-3,3)
x3 <- runif(200000,-3,3)
x  <- x1+x2+x3
m <- mean(x)
tikz(file="img/descriptive/platykurtic_distribution.tex", width=7, height=5)
par(cex.lab=1.2)
hist(x, prob=T, breaks=50, ylim=c(0,0.2), main="Platykurtic distribution $g_2<0$", xlab ="", ylab="Relative frequency", col=blueceulight, axes=F)
axis(1,at=m,labels="$\\bar x$")
axis(2)
f <- function (z){return(dnorm(z,mean=0,sd=2.5))}
curve(f, add=TRUE, col=redceu, lwd=2)
dev.off()

# leptokurtic ditribution
x <- rt(1000000,4)
m <- mean(x)
tikz(file="img/descriptive/leptokurtic_distribution.tex", width=7, height=5)
par(cex.lab=1.2)
hist(x, prob=T, breaks=seq(-100,100,by=0.2), xlim=c(-4.1,4.1), ylim=c(0,0.4), main="Leptokurtic distribution $g_2>0$", xlab ="", ylab="Relative frequency", col=blueceulight, axes=F)
axis(1,at=m,labels="$\\bar x$")
axis(2)
f <- function (z){return(dnorm(z,mean=0,sd=sqrt(2)))}
curve(f, add=TRUE, col=redceu, lwd=2)
dev.off()

# right-skewed histogram
x <- rf(1000000,8,8)
tikz(file="img/descriptive/right_skewed_histogram.tex", width=5, height=5)
par(mai=c(0,0,0,0))
hist(x, xaxt="n", breaks=seq(0,max(x)+1,by=0.14), xlim=c(0,5), prob=TRUE, main="", col=blueceulight, axes=FALSE)
dev.off()

# Symmetrical histogram whithout box plot
x <- rnorm(1000000)
tikz(file="img/descriptive/symmetrical_histogram.tex", width=5, height=5)
par(mai=c(0,0,0,0))
hist(x, breaks=seq(min(x),max(x)+1,by=0.2), xlim=c(-3.5,3.5), ylim=c(0,0.4), prob=TRUE, main="", col=blueceulight, axes=FALSE)
dev.off()

