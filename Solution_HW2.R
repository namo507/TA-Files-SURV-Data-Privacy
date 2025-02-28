load "synthetic_cps.RData"

###1)

##original data
tax.mean.org<-mean(cps$tax)
tax.var.org<-var(cps$tax)/nrow(cps)

###synthetic data
q.i<-sapply(syn.data,function(x) mean(x$tax))
u.i<-sapply(syn.data,function(x) var(x$tax)/nrow(x))

q.m<-mean(q.i)
u.bar<-mean(u.i)
b.m<-var(q.i)

T.p<-u.bar+b.m/length(q.i)

###org mean
tax.mean.org

###syn.mean
q.m

###org variance
tax.var.org

###syn variance
T.p

###2

##original data
black.mean.org<-mean(cps$race==2)
black.var.org<-black.mean.org*(1-black.mean.org)/nrow(cps)

###synthetic data
q.i<-sapply(syn.data,function(x) mean(x$race==2))
u.i<-q.i*(1-q.i)/nrow(cps)

q.m<-mean(q.i)
u.bar<-mean(u.i)
b.m<-var(q.i)

T.p<-u.bar+b.m/length(q.i)

###org mean
black.mean.org

###syn.mean
q.m

###org variance
black.var.org

###syn variance
T.p

###Exercise 3
org.reg<-lm(log(income)~.,data=cps)

q.i<-sapply(syn.data,function(x)coef(lm(log(income)~.,data=x)))
q.m<-apply(q.i,1,mean)

###coefficient for sex
coef(org.reg)[names(coef(org.reg))=="sex2"]
q.m["sex2"]

###Exercise 4
p.value.org<-summary(org.reg)$coef[names(coef(org.reg))=="sex2",4]

u.i<-sapply(syn.data,function(x)summary(lm(log(income)~.,data=x))$coef[,2]^2)
u.bar<-apply(u.i,1,mean)
b.m<-apply(q.i,1,var)

m<-length(syn.data)
T.p<-u.bar+b.m/m

T.value<-q.m/sqrt(T.p)

df<-(m-1)*(1+u.bar/(b.m/m))^2
p.values<-2*(1-pt(df=df,abs(T.value)))

p.value.org
p.values[names(p.values)=="sex2"]