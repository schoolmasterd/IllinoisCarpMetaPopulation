#set working directory to script source
#if using RStudio run 
setwd(dirname(rstudioapi::documentPath()))
#create some labels for movement params
vars_list<-list()
k=1
for(i in 1:6)for(j in 1:6){
  vars_list[[k]]<-paste0("phi_{",7-i,7-j,"}")
  k=k+1
}
vars_list[seq(1,36,7)]<-NULL
vars_phi<-unlist(vars_list)

#create labels for per cap contribs
grates<-paste0("a_{1",6:1,"}")

#load data
l_phi_sen<-read.csv("Data/phi_sensi_local_sur.csv",header = F)
l_phi_sen_se<-read.csv("Data/phi_sensi_local_sur_se.csv",header = F)
l_phi_sen_tab<-round((l_phi_sen),4)
l_phi_sen_se_tab<-round(l_phi_sen_se,4)
row.names(l_phi_sen_tab)<-vars_phi
colnames(l_phi_sen_tab)<-grates
d1<-expand.grid(1:6,6:1)
d1<-d1[order(d1$Var1,d1$Var2,decreasing = c(T,T)),]
d1<-d1[-which(d1$Var1==d1$Var2),]


xaxis_labs<-lapply(6:1,function(x)bquote("a"["1"*.(x)]))
new_tab<-as.data.frame(cbind(l_phi_sen_tab,k=d1$Var1,h=d1$Var2))
new_tab_se<-as.data.frame(cbind(l_phi_sen_se_tab,k=d1$Var1,h=d1$Var2))

l_phi_elast<-read.csv("Data/phi_elast_local_sur.csv",header = F)
l_phi_elast_se<-read.csv("Data/phi_elast_local_sur_se.csv",header = F)
l_phi_sen_tab<-round((l_phi_sen),4)
l_phi_sen_se_tab<-round(l_phi_sen_se,4)
row.names(l_phi_elast)<-vars_phi
colnames(l_phi_elast)<-grates

new_tab2<-as.data.frame(cbind(l_phi_elast,k=d1$Var1,h=d1$Var2))
new_tab2_se<-as.data.frame(cbind(l_phi_elast_se,k=d1$Var1,h=d1$Var2))

x11(height = 10,width = 10)
pdf("MetapopCarpFig4.pdf",height = 10,width = 10)

par(mfrow=c(6,5),mar=c(0,0,0,0),oma=c(5,5,5,5),xpd=TRUE)
edges<-c(1,6,11,16,21,26)
rt_edges<-c(5,10,15,20,25,30)
n=25
ela_scale<-5

for(i in 1:25){
  if(i%in%edges){
    plot((1:6)-.2,unlist(new_tab[i,1:6]),ylim=c(-15,15),xlim=c(0,7),xaxt="n",yaxt="n",pch=21,bg="grey",cex=1.25,cex.axis=1)
    arrows((1:6)-.2,unlist(new_tab[i,1:6]),(1:6)-.2,2*sqrt(n)*unlist(new_tab_se[i,1:6])+unlist(new_tab[i,1:6]),angle = 90,length = 0)
    arrows((1:6)-.2,unlist(new_tab[i,1:6]),(1:6)-.2,-2*sqrt(n)*unlist(new_tab_se[i,1:6])+unlist(new_tab[i,1:6]),angle = 90,length = 0)
    points((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),pch=21,bg="black",cex=1.25,cex.axis=1.25)
    arrows((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),(1:6)+.2,2*ela_scale*sqrt(n)*unlist(new_tab2_se[i,1:6])+ela_scale*unlist(new_tab2[i,1:6]),angle = 90,length = 0)
    arrows((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),(1:6)+.2,-2*ela_scale*sqrt(n)*unlist(new_tab2_se[i,1:6])+ela_scale*unlist(new_tab2[i,1:6]),angle = 90,length = 0)
    legend(4,17,legend = bquote(phi[.(new_tab[i,7])*.(new_tab[i,8])]),bty='n',cex = 1.75,pch=NULL)
    abline(h=0,lty=2)
    axis(2,at = seq(-12,12,3),cex.axis=1)  
  } else if(i%in%rt_edges){
    plot((1:6)-.2,unlist(new_tab[i,1:6]),ylim=c(-15,15),xlim=c(0,7),xaxt="n",yaxt='n',pch=21,bg="grey",cex=1.25,cex.axis=1.25)
    arrows((1:6)-.2,unlist(new_tab[i,1:6]),(1:6)-.2,2*sqrt(n)*unlist(new_tab_se[i,1:6])+unlist(new_tab[i,1:6]),angle = 90,length = 0)
    arrows((1:6)-.2,unlist(new_tab[i,1:6]),(1:6)-.2,-2*sqrt(n)*unlist(new_tab_se[i,1:6])+unlist(new_tab[i,1:6]),angle = 90,length = 0)
    points((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),pch=21,bg="black",cex=1.25,cex.axis=1.25)
    arrows((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),(1:6)+.2,2*ela_scale*sqrt(n)*unlist(new_tab2_se[i,1:6])+ela_scale*unlist(new_tab2[i,1:6]),angle = 90,length = 0)
    arrows((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),(1:6)+.2,-2*ela_scale*sqrt(n)*unlist(new_tab2_se[i,1:6])+ela_scale*unlist(new_tab2[i,1:6]),angle = 90,length = 0)
    legend(4,17,legend = bquote(phi[.(new_tab[i,7])*.(new_tab[i,8])]),bty='n',cex = 1.75,pch=NULL)
    axis(side = 4,at = seq(-15,15,by=5),labels = round(seq(-15,15,by=5)/5),2)
    abline(h=0,lty=2)
  } else{
    plot((1:6)-.2,unlist(new_tab[i,1:6]),ylim=c(-15,15),xlim=c(0,7),xaxt="n",yaxt='n',pch=21,bg="grey",cex=1.25)
    arrows((1:6)-.2,unlist(new_tab[i,1:6]),(1:6)-.2,2*sqrt(n)*(unlist(new_tab_se[i,1:6]))+unlist(new_tab[i,1:6]),angle = 90,length = 0)
    arrows((1:6)-.2,unlist(new_tab[i,1:6]),(1:6)-.2,-2*sqrt(n)*(unlist(new_tab_se[i,1:6]))+unlist(new_tab[i,1:6]),angle = 90,length = 0)
    points((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),pch=21,bg="black",cex=1.25,cex.axis=1.25)
    arrows((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),(1:6)+.2, 2*ela_scale*sqrt(n)*unlist(new_tab2_se[i,1:6])+ela_scale*unlist(new_tab2[i,1:6]),angle = 90,length = 0)
    arrows((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),(1:6)+.2,-2*ela_scale*sqrt(n)*unlist(new_tab2_se[i,1:6])+ela_scale*unlist(new_tab2[i,1:6]),angle = 90,length = 0)
    
    legend(4,17,legend = bquote(phi[.(new_tab[i,7])*.(new_tab[i,8])]),bty='n',cex = 1.75,pch=NULL)
    abline(h=0,lty=2)
  }
}

i=26
plot((1:6)-.2,unlist(new_tab[i,1:6]),ylim=c(-15,15),xlim=c(0,7),xaxt="n",yaxt="n",pch=21,bg="grey",cex=1.25,cex.axis=1.25)
arrows((1:6)-.2,unlist(new_tab[i,1:6]),(1:6)-.2,2*sqrt(n)*(unlist(new_tab_se[i,1:6]))+unlist(new_tab[i,1:6]),angle = 90,length = 0)
arrows((1:6)-.2,unlist(new_tab[i,1:6]),(1:6)-.2,-2*sqrt(n)*(unlist(new_tab_se[i,1:6]))+unlist(new_tab[i,1:6]),angle = 90,length = 0)
points((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),pch=21,bg="black",cex=1.25,cex.axis=1.25)
arrows((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),(1:6)+.2,2*ela_scale*sqrt(n)*unlist(new_tab2_se[i,1:6])+ela_scale*unlist(new_tab2[i,1:6]),angle = 90,length = 0)
arrows((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),(1:6)+.2,-2*ela_scale*sqrt(n)*unlist(new_tab2_se[i,1:6])+ela_scale*unlist(new_tab2[i,1:6]),angle = 90,length = 0)
legend(4,17,legend = bquote(phi[.(new_tab[i,7])*.(new_tab[i,8])]),bty='n',cex = 1.75,pch=NULL)
axis(side=1,at = 1:6,labels =do.call(expression,xaxis_labs))
axis(2,at = seq(-12,12,3),cex.axis=1)  
abline(h=0,lty=2)
for(i in 27:30){
  plot((1:6)-.2,unlist(new_tab[i,1:6]),ylim=c(-15,15),xlim=c(0,7),xaxt="n",yaxt='n',pch=21,bg="grey",cex=1.25,cex.axis=1.25)
  arrows((1:6)-.2,unlist(new_tab[i,1:6]),(1:6)-.2,2*sqrt(n)*(unlist(new_tab_se[i,1:6]))+unlist(new_tab[i,1:6]),angle = 90,length = 0)
  arrows((1:6)-.2,unlist(new_tab[i,1:6]),(1:6)-.2,-2*sqrt(n)*(unlist(new_tab_se[i,1:6]))+unlist(new_tab[i,1:6]),angle = 90,length = 0)
  points((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),pch=21,bg="black",cex=1.25,cex.axis=1.25)
  arrows((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),(1:6)+.2,2*ela_scale*sqrt(n)*unlist(new_tab2_se[i,1:6])+ela_scale*unlist(new_tab2[i,1:6]),angle = 90,length = 0)
  arrows((1:6)+.2,ela_scale*unlist(new_tab2[i,1:6]),(1:6)+.2,-2*ela_scale*sqrt(n)*unlist(new_tab2_se[i,1:6])+ela_scale*unlist(new_tab2[i,1:6]),angle = 90,length = 0)
  legend(4,17,legend = bquote(phi[.(new_tab[i,7])*.(new_tab[i,8])]),bty='n',cex = 1.75,pch=NULL)
  axis(side=1,at = 1:6,labels =do.call(expression,xaxis_labs))
  if(i==30)axis(side = 4,at = seq(-15,15,by=5),labels = round(seq(-15,15,by=5)/5),2)
  abline(h=0,lty=2)
}

mtext("Contributing Term",1,outer = T,cex=1.5,padj = 2.5)
mtext(bquote("Sensitivity ("*Delta*"1/Year)"),2,outer = T,cex=1.5,padj = -1.25)
mtext(side = 4,text=bquote("Elasticity ("*Delta*"%)"),padj=2,cex=1.5,outer = T)

dev.off()

