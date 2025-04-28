###load dataset
load("nhis.RData")

###inspect variables
summary(nhis)


library(synthpop)

visit.ini<-c(1,3,6,4,2,5,7)
method.ini<-c("","cart","","cart","cart","","cart")
syn.data1<-syn(nhis,visit=visit.ini,method=method.ini,m=10)

###Exercise 3
method.new<-c("","polyreg","","polyreg","polyreg","","logreg")
syn.data2<-syn(nhis,visit=visit.ini,method=method.new,m=10)

###Exercise 4
compare(syn.data1,nhis,vars=c("age.grp","race","inc.grp","notcov"))
compare(syn.data2,nhis,vars=c("age.grp","race","inc.grp","notcov"))

###Exercise 5
table(syn.data1$syn[[1]]$medicaid,syn.data1$syn[[1]]$notcov)
table(syn.data2$syn[[1]]$medicaid,syn.data2$syn[[1]]$notcov)
table(nhis$medicaid,nhis$notcov)

###how to compute q.bar across 10 replicates
q.i<-lapply(syn.data1$syn,function(x) table(x$medicaid,x$notcov))
q.bar<-apply(simplify2array(q.i), 1:2, mean)
q.bar

###Exercise 6
syn.data3<-syn(nhis,visit=visit.ini,method=method.ini,m=20,
  rules = list(notcov = "medicaid==1"),rvalues = list(notcov = 2))

q.i<-lapply(syn.data3$syn,function(x) table(x$medicaid,x$notcov))
q.bar<-apply(simplify2array(q.i), 1:2, mean)
q.bar

syn.data4<-syn(nhis,visit=visit.ini,method=method.new,m=20,
  rules = list(notcov = "medicaid==1"),rvalues = list(notcov = 2))

q.i<-lapply(syn.data4$syn,function(x) table(x$medicaid,x$notcov))
q.bar<-apply(simplify2array(q.i), 1:2, mean)
q.bar


###Exercise 7
syn.reg1<-glm.synds(notcov~sex+educ+race+inc.grp,family=binomial(link="logit"),data=syn.data3)
syn.reg2<-glm.synds(notcov~sex+educ+race+inc.grp,family=binomial(link="logit"),data=syn.data4)

###Exercise 8
compare(syn.reg1,nhis,incomplete=TRUE,population.inference=TRUE)
compare(syn.reg2,nhis,incomplete=TRUE,population.inference=TRUE)

###maybe more interesting to look at coefficients
compare(syn.reg1,nhis,incomplete=TRUE,population.inference=TRUE,plot="coef")
compare(syn.reg2,nhis,incomplete=TRUE,population.inference=TRUE,plot="coef")


###Exercise 9
mean(sapply(syn.data1$syn,function(x) sum(nhis$inc.grp==x$inc.grp)))
mean(sapply(syn.data2$syn,function(x) sum(nhis$inc.grp==x$inc.grp)))

###risk of correct match with random imputation
nrow(nhis)/8

###Exercise 10

###load dataset
load("cps5000.RData")

###transform data
org.data<-cps
org.data$income<-org.data$income^(1/3)
org.data$tax<-org.data$tax^(1/3)
org.data$csp<-org.data$csp^(1/3)
org.data$ss<-org.data$ss^(1/3)

visit.ini<-c(2,3,4,5,6,7,8,9,1)
method.ini<-c("cart","","","","","","","","")
syn.data5<-syn(org.data,method=method.ini,visit=visit.ini,
	smoothing=list(tax="density"),m=10,seed=1234)


###Exercise 11

method.new<-c("norm","","","","","","","","")
syn.data6<-syn(org.data,method=method.new,visit=visit.ini,m=10,seed=1234)


###Exercise 12

compare(syn.data5,org.data,vars="tax")
compare(syn.data6,org.data,vars="tax")

###Exercise 13
syn.data7<-syn(org.data,method=method.new,visit=visit.ini,
	semicont=list(tax=0),m=10,seed=1234)
compare(syn.data7,org.data,vars="tax")

