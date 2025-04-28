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
summary(cps)
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




# Create summary table of all exercise results
results_summary <- data.frame(
  Exercise = character(),
  Description = character(),
  Results = character(),
  stringsAsFactors = FALSE
)

# Exercise 1-2: Initial synthesis with CART
results_summary <- rbind(results_summary, data.frame(
  Exercise = "1-2",
  Description = "Initial CART synthesis",
  Results = "Created syn.data1 with visit.ini=c(1,3,6,4,2,5,7), method.ini=c('','cart','','cart','cart','','cart')",
  stringsAsFactors = FALSE
))

# Exercise 3: Parametric synthesis
results_summary <- rbind(results_summary, data.frame(
  Exercise = "3",
  Description = "Parametric synthesis",
  Results = "Created syn.data2 with method.new=c('','polyreg','','polyreg','polyreg','','logreg')",
  stringsAsFactors = FALSE
))

# Exercise 4: Compare utility measures
cart_utility <- c("age.grp: pMSE=1.4e-05, S_pMSE=0.97",
                 "race: pMSE=5.0e-06, S_pMSE=0.75", 
                 "inc.grp: pMSE=3.5e-05, S_pMSE=1.38", 
                 "notcov: pMSE=4.0e-06, S_pMSE=1.00")
param_utility <- c("age.grp: pMSE=1.6e-05, S_pMSE=1.13",
                  "race: pMSE=6.0e-06, S_pMSE=0.78", 
                  "inc.grp: pMSE=2.6e-05, S_pMSE=1.02", 
                  "notcov: pMSE=2.0e-06, S_pMSE=0.54")

results_summary <- rbind(results_summary, data.frame(
  Exercise = "4",
  Description = "Utility comparison",
  Results = paste("CART model:", paste(cart_utility, collapse="; "), 
                 "\nParametric model:", paste(param_utility, collapse="; ")),
  stringsAsFactors = FALSE
))

# Exercise 5: Cross-tabulations
results_summary <- rbind(results_summary, data.frame(
  Exercise = "5",
  Description = "Cross-tabulations",
  Results = "Original: medicaid=1,notcov=1: 0; medicaid=1,notcov=2: 1610; medicaid=2,notcov=1: 3051; medicaid=2,notcov=2: 12798
CART: medicaid=1,notcov=1: 27; medicaid=1,notcov=2: 1583; medicaid=2,notcov=1: 2936; medicaid=2,notcov=2: 12913
Parametric: medicaid=1,notcov=1: 2; medicaid=1,notcov=2: 1608; medicaid=2,notcov=1: 3079; medicaid=2,notcov=2: 12770",
  stringsAsFactors = FALSE
))

# Exercise 6: Rules and rvalues
results_summary <- rbind(results_summary, data.frame(
  Exercise = "6",
  Description = "Rules and rvalues",
  Results = "Created syn.data3 and syn.data4 with rules=list(notcov='medicaid==1'), rvalues=list(notcov=2)
No more inconsistencies between medicaid and notcov (all medicaid=1 cases have notcov=2)",
  stringsAsFactors = FALSE
))

# Exercise 7-8: Regression models
results_summary <- rbind(results_summary, data.frame(
  Exercise = "7-8",
  Description = "Regression models",
  Results = "Fitted logistic regression models and compared coefficients
Mean CI overlap CART: ~0.41; Mean CI overlap Parametric: ~0.52
Mean abs std coef diff CART: ~2.33; Mean abs std coef diff Parametric: ~1.88",
  stringsAsFactors = FALSE
))

# Exercise 9: Attribute disclosure risk
results_summary <- rbind(results_summary, data.frame(
  Exercise = "9",
  Description = "Attribute disclosure risk",
  Results = "Average matches CART: 3344.6
Average matches Parametric: 3314.2
Expected matches with random assignment: 2182.4",
  stringsAsFactors = FALSE
))

# Exercises 10-11: Tax variable synthesis
results_summary <- rbind(results_summary, data.frame(
  Exercise = "10-11",
  Description = "Tax variable synthesis",
  Results = "Created syn.data5 with CART and density smoothing
Created syn.data6 with normal model",
  stringsAsFactors = FALSE
))

# Exercise 12: Tax utility comparison
results_summary <- rbind(results_summary, data.frame(
  Exercise = "12",
  Description = "Tax utility measures",
  Results = "CART: pMSE=0.125489, S_pMSE=2509.786
Normal: pMSE=0.125678, S_pMSE=2513.561
Large S_pMSE indicates poor fit for both methods",
  stringsAsFactors = FALSE
))

# Exercise 13: Semicontinuous modeling
results_summary <- rbind(results_summary, data.frame(
  Exercise = "13",
  Description = "Semicontinuous modeling",
  Results = "Created syn.data7 with semicont=list(tax=0)
Utility: pMSE=0.042375, S_pMSE=1130.01
Improved but still high S_pMSE",
  stringsAsFactors = FALSE
))

# Display the table
library(knitr)
kable(results_summary, format = "markdown", 
      col.names = c("Exercise", "Description", "Results"))