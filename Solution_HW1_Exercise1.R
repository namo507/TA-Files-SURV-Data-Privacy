#1)
###load lalonde.RData

summary(lalonde[,5:7])
summary(ll.noise1[,5:7])
summary(ll.noise2[,5:7])

#We see that due to the addition of noise, quite a few of the individuals show negative 
#values in their earnings, which seems implausible. We also see that the largest values do 
#not differ too much between the original and the protected data. Thus, these values 
#arguably are also not very well protected.

#4 points: 2 for summary, 2 for discussion 

#2)
cor(lalonde$re74, lalonde$re75)
cor(ll.noise1$re74, ll.noise1$re75)
cor(ll.noise2$re74, ll.noise2$re75)

#By adding noise independently (ll.noise1), the correlation between both variables 
#decreased compared to the original relationship. The method used for the ll.noise2 
#data seems to have preserved the original orrelation between both variables.

#2 points

#3)
#ll.noise1 is the result of adding independent noise and ll.noise2 from adding correlated 
#noise. By adding correlated noise dependent on the covariance structure of the data, we
#can ensure that the correlation structure found in the original data is preserved.

#2 points

#4)

lm1 <- lm(re78 ~ treat + age + education + black, data = lalonde)
lm2 <- lm(re78 ~ treat + age + education + black, data = ll.noise1)
lm3 <- lm(re78 ~ treat + age + education + black, data = ll.noise2)

summary(lm1)
summary(lm2)
summary(lm3)

#Comparing the overall results, all three models imply a 
#significant treatment effect. Point estimates derived from the noisy 
#datasets do not contradict the results of the first dataset 
#(The CI is quite large). However, the estimated effects are 
#higher than in the original sample, especially for ll.noise1. 
#The variance of the treatment estimator is higher in the case 
#of independent noise addition. The SEs of model 1 and 3 are quite 
#close. The impact of the correlated noise on the relationship between  
#re78 and all the covariates doesn't seem very large. In general, the
#estimates based on the correlated noise tend to be closer to the results
#from the original data than those based on uncorrelated noise (e.g., education
#becomes insignificant when uncorrelated noise is used).