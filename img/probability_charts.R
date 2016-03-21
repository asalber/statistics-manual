# Author: Alfredo Sánchez Alberca (asalber@ceu.es)

setwd("/media/alf/datos/drive/CEU/DOCENCIA/materiales/estadistica/presentaciones/statistics_course")
library(tikzDevice)

# Likelihood ratios
tikz(file="img/probability/likelihood_ratios.tex", width=4.5, height=3.3)
pe=seq(0,1,0.01)
lr=c(0.01,0.05,0.1,0.2,0.5,2,5,10,20,100)
color=hcl(h=seq(0,240,24),c=80,l=60)
par(mar=c(3.8, 3.8, 3, 8),mgp=c(1.8,0.4,0), cex.lab=1, cex.axis=0.8, las=1, tck=-0.02)
plot(pe,pe,type="l", main="Relation between pre-test, post-test probabilities\n and the likelihood ratio", xlab="Pre-test probability", ylab="Post-test probability")
for (i in lr) {
  lines(pe,pe*i/(1-pe+pe*i),col=color[which(lr == i)])
}  
abline(h=seq(0,1,0.2),v=seq(0,1,0.2),col="gray",lty=3)
legend("topright", c("LR-=0.01", "LR-=0.05", "LR-=0.1", "LR-=0.2", "LR-=0.5", "LR+=1", "LR+=2","LR+=5","LR+=10","LR+=20","LR+=100"),col=c(color[1:5],"black",color[6:10]),inset=c(-0.5,0), bty = "n", lty=1, xpd=TRUE,title="Likelihood ratios")
dev.off()