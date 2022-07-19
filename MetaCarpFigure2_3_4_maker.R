
#set working directory to script source
#if using RStudio run 
setwd(dirname(rstudioapi::documentPath()))

#load data
m_phi<-read.csv("Data/psi_sensi_Sur.csv")
m_phi_tab<-round(t(m_phi),4)
row.names(m_phi_tab)<-vars_phi
colnames(m_phi_tab)<-c("Sensitivity","Sensitivity_SE","Elasticity","Elasticity_SE")


#fig 2
ela_scale<-3
n=25
pdf("MetaCarpFig2.pdf")
par(mfrow=c(2,3),mar=c(3,0,2,0),oma=c(4,5,2,5),xpd=TRUE)
getem<-grep("\\d[1]",rownames(m_phi_tab))
m_phi_tab[getem,1]   
plot((1:5)-.2,m_phi_tab[getem,1],ylim=c(-12,3),xlim=c(0,6),xaxt="n",yaxt="n",pch=21,bg="grey",cex=1.25,cex.axis=1,main="Dresden Island")
arrows((1:5)-.2,m_phi_tab[getem,1],(1:5)-.2,2*sqrt(n)*m_phi_tab[getem,2]+m_phi_tab[getem,1],angle = 90,length = 0)
arrows((1:5)-.2,m_phi_tab[getem,1],(1:5)-.2,-2*sqrt(n)*m_phi_tab[getem,2]+m_phi_tab[getem,1],angle = 90,length = 0)
points((1:5)+.2,ela_scale*m_phi_tab[getem,3],pch=21,bg="black",cex=1.25,cex.axis=1.25)
arrows((1:5)+.2,ela_scale*m_phi_tab[getem,3],(1:5)+.2,2*ela_scale*sqrt(n)*m_phi_tab[getem,4]+ela_scale*m_phi_tab[getem,3],angle = 90,length = 0)
arrows((1:5)+.2,ela_scale*m_phi_tab[getem,3],(1:5)+.2,-2*ela_scale*sqrt(n)*m_phi_tab[getem,4]+ela_scale*m_phi_tab[getem,3],angle = 90,length = 0)
xaxis_labs<-lapply(6:2,function(x)bquote(phi[.(x)*"1"]))
axis(side=1,at = 1:5,labels =do.call(expression,xaxis_labs))
abline(h=0,lty=2)
axis(2,at = seq(-12,3,3),cex.axis=1)

getem<-grep("\\d[2]",rownames(m_phi_tab))
xaxis_labs<-lapply(c(6:3,1),function(x)bquote(phi[.(x)*"2"]))
m_phi_tab[getem,1]   
plot((1:5)-.2,m_phi_tab[getem,1],ylim=c(-12,3),xlim=c(0,6),xaxt="n",yaxt="n",pch=21,bg="grey",cex=1.25,cex.axis=1,main="Marseilles")
arrows((1:5)-.2,m_phi_tab[getem,1],(1:5)-.2,2*sqrt(n)*m_phi_tab[getem,2]+m_phi_tab[getem,1],angle = 90,length = 0)
arrows((1:5)-.2,m_phi_tab[getem,1],(1:5)-.2,-2*sqrt(n)*m_phi_tab[getem,2]+m_phi_tab[getem,1],angle = 90,length = 0)
points((1:5)+.2,ela_scale*m_phi_tab[getem,3],pch=21,bg="black",cex=1.25,cex.axis=1.25)
arrows((1:5)+.2,ela_scale*m_phi_tab[getem,3],(1:5)+.2,2*ela_scale*sqrt(n)*m_phi_tab[getem,4]+ela_scale*m_phi_tab[getem,3],angle = 90,length = 0)
arrows((1:5)+.2,ela_scale*m_phi_tab[getem,3],(1:5)+.2,-2*ela_scale*sqrt(n)*m_phi_tab[getem,4]+ela_scale*m_phi_tab[getem,3],angle = 90,length = 0)
axis(side=1,at = 1:5,labels =do.call(expression,xaxis_labs))
abline(h=0,lty=2)

getem<-grep("\\d[3]",rownames(m_phi_tab))
xaxis_labs<-lapply(c(6:4,2:1),function(x)bquote(phi[.(x)*"3"]))
m_phi_tab[getem,1]   
plot((1:5)-.2,m_phi_tab[getem,1],ylim=c(-12,3),xlim=c(0,6),xaxt="n",yaxt="n",pch=21,bg="grey",cex=1.25,cex.axis=1,main="Starved Rock")
arrows((1:5)-.2,m_phi_tab[getem,1],(1:5)-.2,2*sqrt(n)*m_phi_tab[getem,2]+m_phi_tab[getem,1],angle = 90,length = 0)
arrows((1:5)-.2,m_phi_tab[getem,1],(1:5)-.2,-2*sqrt(n)*m_phi_tab[getem,2]+m_phi_tab[getem,1],angle = 90,length = 0)
points((1:5)+.2,ela_scale*m_phi_tab[getem,3],pch=21,bg="black",cex=1.25,cex.axis=1.25)
arrows((1:5)+.2,ela_scale*m_phi_tab[getem,3],(1:5)+.2,2*ela_scale*sqrt(n)*m_phi_tab[getem,4]+ela_scale*m_phi_tab[getem,3],angle = 90,length = 0)
arrows((1:5)+.2,ela_scale*m_phi_tab[getem,3],(1:5)+.2,-2*ela_scale*sqrt(n)*m_phi_tab[getem,4]+ela_scale*m_phi_tab[getem,3],angle = 90,length = 0)
axis(side=1,at = 1:5,labels =do.call(expression,xaxis_labs))
abline(h=0,lty=2)
axis(side = 4,at = seq(-12,3,by=3),labels = round(seq(-12,3,by=3)/ela_scale,2))

###second row###

getem<-grep("\\d[4]",rownames(m_phi_tab))
m_phi_tab[getem,1] 
xaxis_labs<-lapply(c(6:5,3:1),function(x)bquote(phi[.(x)*"4"]))

plot((1:5)-.2,m_phi_tab[getem,1],ylim=c(-12,3),xlim=c(0,6),xaxt="n",yaxt="n",pch=21,bg="grey",cex=1.25,cex.axis=1,main="Peoria")
arrows((1:5)-.2,m_phi_tab[getem,1],(1:5)-.2,2*sqrt(n)*m_phi_tab[getem,2]+m_phi_tab[getem,1],angle = 90,length = 0)
arrows((1:5)-.2,m_phi_tab[getem,1],(1:5)-.2,-2*sqrt(n)*m_phi_tab[getem,2]+m_phi_tab[getem,1],angle = 90,length = 0)
points((1:5)+.2,ela_scale*m_phi_tab[getem,3],pch=21,bg="black",cex=1.25,cex.axis=1.25)
arrows((1:5)+.2,ela_scale*m_phi_tab[getem,3],(1:5)+.2,2*ela_scale*sqrt(n)*m_phi_tab[getem,4]+ela_scale*m_phi_tab[getem,3],angle = 90,length = 0)
arrows((1:5)+.2,ela_scale*m_phi_tab[getem,3],(1:5)+.2,-2*ela_scale*sqrt(n)*m_phi_tab[getem,4]+ela_scale*m_phi_tab[getem,3],angle = 90,length = 0)
axis(side=1,at = 1:5,labels =do.call(expression,xaxis_labs))
abline(h=0,lty=2)
axis(2,at = seq(-12,3,3),cex.axis=1)

getem<-grep("\\d[5]",rownames(m_phi_tab))
xaxis_labs<-lapply(c(6,4:1),function(x)bquote(phi[.(x)*"5"]))
m_phi_tab[getem,1]   
plot((1:5)-.2,m_phi_tab[getem,1],ylim=c(-12,3),xlim=c(0,6),xaxt="n",yaxt="n",pch=21,bg="grey",cex=1.25,cex.axis=1,main="La Grange")
arrows((1:5)-.2,m_phi_tab[getem,1],(1:5)-.2,2*sqrt(n)*m_phi_tab[getem,2]+m_phi_tab[getem,1],angle = 90,length = 0)
arrows((1:5)-.2,m_phi_tab[getem,1],(1:5)-.2,-2*sqrt(n)*m_phi_tab[getem,2]+m_phi_tab[getem,1],angle = 90,length = 0)
points((1:5)+.2,ela_scale*m_phi_tab[getem,3],pch=21,bg="black",cex=1.25,cex.axis=1.25)
arrows((1:5)+.2,ela_scale*m_phi_tab[getem,3],(1:5)+.2,2*ela_scale*sqrt(n)*m_phi_tab[getem,4]+ela_scale*m_phi_tab[getem,3],angle = 90,length = 0)
arrows((1:5)+.2,ela_scale*m_phi_tab[getem,3],(1:5)+.2,-2*ela_scale*sqrt(n)*m_phi_tab[getem,4]+ela_scale*m_phi_tab[getem,3],angle = 90,length = 0)
axis(side=1,at = 1:5,labels =do.call(expression,xaxis_labs))
abline(h=0,lty=2)

getem<-grep("\\d[6]",rownames(m_phi_tab))
xaxis_labs<-lapply(c(5:1),function(x)bquote(phi[.(x)*"6"]))
m_phi_tab[getem,1]   
plot((1:5)-.2,m_phi_tab[getem,1],ylim=c(-12,3),xlim=c(0,6),xaxt="n",yaxt="n",pch=21,bg="grey",cex=1.25,cex.axis=1,main="Alton")
arrows((1:5)-.2,m_phi_tab[getem,1],(1:5)-.2,2*sqrt(n)*m_phi_tab[getem,2]+m_phi_tab[getem,1],angle = 90,length = 0)
arrows((1:5)-.2,m_phi_tab[getem,1],(1:5)-.2,-2*sqrt(n)*m_phi_tab[getem,2]+m_phi_tab[getem,1],angle = 90,length = 0)
points((1:5)+.2,ela_scale*m_phi_tab[getem,3],pch=21,bg="black",cex=1.25,cex.axis=1.25)
arrows((1:5)+.2,ela_scale*m_phi_tab[getem,3],(1:5)+.2,2*ela_scale*sqrt(n)*m_phi_tab[getem,4]+ela_scale*m_phi_tab[getem,3],angle = 90,length = 0)
arrows((1:5)+.2,ela_scale*m_phi_tab[getem,3],(1:5)+.2,-2*ela_scale*sqrt(n)*m_phi_tab[getem,4]+ela_scale*m_phi_tab[getem,3],angle = 90,length = 0)
axis(side=1,at = 1:5,labels =do.call(expression,xaxis_labs))
abline(h=0,lty=2)
axis(side = 4,at = seq(-12,3,by=3),labels = round(seq(-12,3,by=3)/ela_scale,2))
mtext(side = 1,text = "Movement Probability",outer = T,cex=1.25)
mtext(bquote("Sensitivity ("*Delta*"1/Year)"),2,outer = T,padj=-2,cex = 1.25)
mtext(side = 4,text=bquote("Elasticity ("*Delta*"%)"),padj=2.5,outer = T,cex=1.25)
dev.off()

#fig 3
dat<-read.csv("Data/b_sensi_Sur.csv",header=F)
df_b<-t(dat)

rownnms<-df_b[,1]
df_b<-df_b[,-1]
df_b<-apply(df_b,2,as.numeric)
rownames(df_b)<-rownnms
dev.off()

pdf("MetaCarpFig3.pdf")
par(mfrow=c(1,1),xpd=F,mar=c(5,4,2,4))
getem<-grep("4",rownames(df_b))
plot((1:3)-.1,df_b[c(3,2,1),1],ylim=c(-.5,1),xlim=c(.5,3.5),xaxt="n",yaxt="n",pch=21,bg="grey",cex=1.25,
     cex.axis=1,main="",xlab="Recruitment Parameter",ylab="",cex.lab=1.25)
corners<-par("usr")
arrows((1:3)-.1,df_b[c(3,2,1),1],(1:3)-.1,2*sqrt(n)*df_b[c(3,2,1),2]+df_b[c(3,2,1),1],angle = 90,length = 0)
arrows((1:3)-.1,df_b[c(3,2,1),1],(1:3)-.1,-2*sqrt(n)*df_b[c(3,2,1),2]+df_b[c(3,2,1),1],angle = 90,length = 0)
points((1:3)+.1,df_b[c(3,2,1),3],pch=21,bg="black",cex=1.25,cex.axis=1.25)
arrows((1:3)+.1,df_b[c(3,2,1),3],(1:3)+.1,2*sqrt(n)*df_b[c(3,2,1),4]+df_b[c(3,2,1),3],angle = 90,length = 0)
arrows((1:3)+.1,df_b[c(3,2,1),3],(1:3)+.1,-2*sqrt(n)*df_b[c(3,2,1),4]+df_b[c(3,2,1),3],angle = 90,length = 0)
xaxis_labs<-lapply(4:6,function(x)bquote(b[.(x)]))
axis(side=1,at = 1:3,labels =do.call(expression,xaxis_labs),cex=1.25)
abline(h=0,lty=2)
axis(2,at = seq(-.5,1,.25),cex.axis=1)
axis(4,at = seq(-.5,1,.25),cex.axis=1)
mtext(bquote("Sensitivity ("*Delta*"1/Year)"),2,outer = T,padj=2,cex = 1.25)
mtext(side = 4,text=bquote("Elasticity ("*Delta*"%)"),padj=-1.5,outer = T,cex=1.25)
#par(xpd=NA)
#text(x=corners[2]+.35,y=mean(corners[3:4]), bquote("Elasticity ("*Delta*"%)"),srt=270,cex=1.25)
dev.off()

#fig5                                
df_sen<-read.csv("Data/b_sensi_local_sur.csv",header = F)
df_sen_se<-read.csv("Data/b_sensi_local_sur_se.csv",header = F)
df_elas<-read.csv("Data/b_elast_local_sur.csv",header = F)
df_elas_se<-read.csv("Data/b_eslast_local_sur_se.csv",header = F)

xaxis_labs<-lapply(6:1,function(x)bquote("a"["1"*.(x)]))
df_sen<-apply(df_sen,2,as.numeric)
df_sen_se<-apply(df_sen_se,2,as.numeric)
df_elas<-apply(df_elas,2,as.numeric)
df_elas_se<-apply(df_elas_se,2,as.numeric)


pdf("MetaCarpFig5.pdf")
par(mfrow=c(1,3),mar=c(3,0,2,0),oma=c(5,5,2,5),xpd=TRUE)
plot((1:6)-.2,df_sen[3,1:6],ylim=c(-.05,.1),xlim=c(0,7),xaxt="n",pch=21,bg="grey",cex=1.25,cex.axis=1.25)
arrows((1:6)-.2,df_sen[3,1:6],(1:6)-.2,1.96*sqrt(n)*df_sen_se[3,1:6]+df_sen[3,1:6],angle = 90,length = 0)
arrows((1:6)-.2,df_sen[3,1:6],(1:6)-.2,-1.96*sqrt(n)*df_sen_se[3,1:6]+df_sen[3,1:6],angle = 90,length = 0)
points((1:6)+.2,df_elas[3,1:6],pch=21,bg="black")
arrows((1:6)+.2,df_elas[3,1:6],(1:6)+.2,1.96*sqrt(n)*df_elas_se[3,1:6]+df_elas[3,1:6],angle = 90,length = 0)
arrows((1:6)+.2,df_elas[3,1:6],(1:6)+.2,-1.96*sqrt(n)*df_elas_se[3,1:6]+df_elas[3,1:6],angle = 90,length = 0)
axis(side=1,at = 1:6,labels =do.call(expression,xaxis_labs),cex.axis=1.25)
legend("topright",legend = bquote("b"[4]),bty='n',pch=NULL,cex=1.75)
abline(h=0,lty=2)

plot((1:6)-.2,df_sen[2,1:6],ylim=c(-.05,.1),xlim=c(0,7),xaxt="n",yaxt="n",pch=21,bg="grey",cex=1.25,cex.axis=1.25)
arrows((1:6)-.2,df_sen[2,1:6],(1:6)-.2,1.96*sqrt(n)*df_sen_se[2,1:6]+df_sen[2,1:6],angle = 90,length = 0)
arrows((1:6)-.2,df_sen[2,1:6],(1:6)-.2,-1.96*sqrt(n)*df_sen_se[2,1:6]+df_sen[2,1:6],angle = 90,length = 0)
points((1:6)+.2,df_elas[2,1:6],pch=21,bg="black")
arrows((1:6)+.2,df_elas[2,1:6],(1:6)+.2,1.96*sqrt(n)*df_elas_se[2,1:6]+df_elas[2,1:6],angle = 90,length = 0)
arrows((1:6)+.2,df_elas[2,1:6],(1:6)+.2,-1.96*sqrt(n)*df_elas_se[2,1:6]+df_elas[2,1:6],angle = 90,length = 0)
axis(side=1,at = 1:6,labels =do.call(expression,xaxis_labs),cex.axis=1.25)
legend("topright",legend = bquote("b"[5]),bty='n',pch=NULL,cex=1.75)
abline(h=0,lty=2)

plot((1:6)-.2,df_sen[1,1:6],ylim=c(-.05,.1),xlim=c(0,7),xaxt="n",yaxt="n",pch=21,bg="grey",cex=1.25,cex.axis=1.25)
arrows((1:6)-.2,df_sen[1,1:6],(1:6)-.2,1.96*sqrt(n)*df_sen_se[1,1:6]+df_sen[1,1:6],angle = 90,length = 0)
arrows((1:6)-.2,df_sen[1,1:6],(1:6)-.2,-1.96*sqrt(n)*df_sen_se[1,1:6]+df_sen[1,1:6],angle = 90,length = 0)
points((1:6)+.2,df_elas[1,1:6],pch=21,bg="black")
arrows((1:6)+.2,df_elas[1,1:6],(1:6)+.2,1.96*sqrt(n)*df_elas_se[1,1:6]+df_elas[1,1:6],angle = 90,length = 0)
arrows((1:6)+.2,df_elas[1,1:6],(1:6)+.2,-1.96*sqrt(n)*df_elas_se[1,1:6]+df_elas[1,1:6],angle = 90,length = 0)
axis(side=1,at = 1:6,labels =do.call(expression,xaxis_labs),cex.axis=1.25)
legend("topright",legend = bquote("b"[6]),bty='n',pch=NULL,cex=1.75)
abline(h=0,lty=2)
axis(4,at = seq(-.05,.1,.05),cex.axis=1.25)
mtext("Contributing Term",1,outer = T,cex=1.5,padj =1)
mtext(bquote("Sensitivity ("*Delta*"1/Year)"),2,outer = T,padj=-2,cex = 1.25)
mtext(side = 4,text=bquote("Elasticity ("*Delta*"%)"),padj=2.5,outer = T,cex=1.25)
#par(xpd=NA)
#text(x=corners[2]+5.5,y=mean(corners[3:4]+.015),bquote("Elasticity ("*Delta*"%)"),srt=270,cex=2)
dev.off()
