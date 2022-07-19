#Code to create Figure 6

#set working directory to script source
#if using RStudio run 
setwd(dirname(rstudioapi::documentPath()))

####Load data####

PSI_bhcp<-read.csv("Data/psi_bhcp.csv")
#define order of pools 
pool_order <- c("Alton", "La Grange",
                "Peoria", "Starved Rock",
                "Marseilles", "Dresden Island")
n_pools <- 6
####Write Workhorse Functions####

#create function to write data in form of useful matrix
# takes row number as input
make_x<-function(who){
  a <- seq(1, n_pools^2, by = n_pools + 1) #diagonal index numbers
  b <- which(seq(1, n_pools^2, by = 1) != a) #off diagonal index numbers
  hold_matrix <- matrix(NA, n_pools, n_pools) #Holding matrix
  psi<-unlist(PSI_bhcp[who,])
  #psi<-apply(PSI_bhcp,2,mean)
  hold_matrix[b] <-  psi
  #hold_matrix <- t(hold_matrix)
  hold_matrix[a] <- .99*(1 - colSums(hold_matrix, na.rm = T))
  #hold_matrix<-t(hold_matrix)
  return(hold_matrix)
}

#create function to calculate matrix powers
# takes as input a square matrix and a power to be applied
mat_pwr<-function(x,power){
  fun<-paste(rep("x",power),collapse="%*%")
  return(eval(str2expression(fun)))
}

#create function to calculate per capital effect on Dresden Pool
#takes as input a matrix and recruitment rate
per_cap_Dresden<-function(x,b){
  A<-mat_pwr(x,6)%*%(mat_pwr(x,3)+diag(b))%*%mat_pwr(x,3)
  p_cap<-A[6,]
  return(p_cap)
}

####Start Analysis####

#define recruitment
b_a<-seq(0,50,5)
len<-length(b_a)
nsamp<-1000
pc_Dresden<-matrix(NA,nrow=nsamp,ncol=6)
ans_Dres<-list()

#Resample at increasing levels of recruitment b_a
for(i in 1:len){
  for(j in 1:nsamp){
    who<-sample(1:nrow(PSI_bhcp),1,replace = T)
    x<-make_x(who)
    b<-c(b_a[i],b_a[i],b_a[i],0,0,0)
    pc_Dresden[j,]<-per_cap_Dresden(x,b)
  }
  ans_Dres[[i]]<-pc_Dresden
}
#get median, lower and upper quantiles of results
med<-sapply(ans_Dres,function(x)apply(x,2,quantile,.5))
lower<-sapply(ans_Dres,function(x)apply(x,2,quantile,.025))
upper<-sapply(ans_Dres,function(x)apply(x,2,quantile,.975))

#set colors for plotting
cols<-RColorBrewer::brewer.pal(n = 6, name = "Accent")
ord<-c(3,4,1,5,2,6)

#create pdf plot of results and uncertainty 

pdf("MetaCarpFig6.pdf")
plot(b_a,med[ord[1],],ylim = c(0,1),type =  'n',bty='n',xlab="Per Capita Recruitment Rate",
     ylab="Per Capita Contrib. to Dresden Island")
for(i in 1:6)polygon(c(b_a,rev(b_a)),c(lower[ord[i],],rev(upper[ord[i],])),lty=2,col = adjustcolor("lightgrey",alpha.f = 0.5),border = NA)
for(i in 1:6)lines(b_a,med[ord[i],],col=cols[ord[i]],lwd=3)
for(i in 1:6)lines(b_a,upper[ord[i],],col=cols[ord[i]],lwd=.5,lty=2)
for(i in 1:6)lines(b_a,lower[ord[i],],col=cols[ord[i]],lwd=.5,lty=2)
legend(30,.4,legend = pool_order,col = cols,bty = 'n',lty = 1,lwd=2)
dev.off()
