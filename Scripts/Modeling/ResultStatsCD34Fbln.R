# ResultStatsCD34Fbln.R
# Nested Model Comparisons and Percent Change Matrices


# Load Data
load("/Users/lee/Google Drive/RBC Project/Data and Scripts/FinalData/CompiledDataEnvironments/CD34FblnWS.RData")

# Packages
library(nlme)
library(stargazer)

# We first Calculate the nested model comparisons

loglmod0.nlme=gls(model = logfbln~logcd34,
                  data = dat)

logLMMwREint.nlme=lme(fixed=logfbln~1 + logcd34,
                      random=~1|subject.no,
                      data = dat)

logLMMwREslope.nlme=lme(fixed=logfbln~1 + logcd34,
                        random=~1+logcd34|subject.no,
                        data = dat)

## Model 0 < Model 1
anova(loglmod0, logLMwFEint)

## Model 0 < Model 3
anova.lme(loglmod0.nlme,logLMMwREint.nlme)

## Model 3 < Model 4
anova.lme(logLMMwREint.nlme,logLMMwREslope.nlme)



# Define Percent Change Function
PerctChange=function(bef,aft){
  diff=aft-bef
  out=round(diff/((aft+bef)/2), digits = 4)
  return(out)
}


# Function to calculate Percent Change Matrices
PerctChangeMatrix=function(vec){
  len=length(vec)
  out.mat=matrix(NA, nrow = len, ncol = len)
  for(i in 1:len){
    for(j in 1:len){
      out.mat[i,j]=PerctChange(vec[i], vec[j])
    }
  }
  return(out.mat)
}


# Create Coefficient Vector:

coef.loglmod=7.884*10**(-1)
coef.logLMwFEint=1.306*10**(-1)
coef.logLMMwREint=1.35*10**(-1)
coef.logLMMwREslope=1.705*10**(-1)
coef.logGEE=7.88*10**(-1)

# Calculate Coeficient percentage of change
coef.CD34Fbln=c(coef.loglmod,coef.logLMwFEint,coef.logLMMwREint,
                coef.logLMMwREslope,coef.logGEE)
(perctChange.coef.CD34Fbln=PerctChangeMatrix(coef.CD34Fbln))

model.names=c("Mod 0", "Mod 1", "Mod 2", "Mod 3", "Mod 4")

colnames(perctChange.coef.CD34Fbln)=model.names
rownames(perctChange.coef.CD34Fbln)=model.names

perctChange.coef.CD34Fbln.df=data.frame(perctChange.coef.CD34Fbln)


# Create Standard Error Vector
se.loglmod        =4.92*10**(-2)
se.logLMwFEint    =3.42*10**(-2)
se.logLMMwREint   =3.42*10**(-2)
se.logLMMwREslope =7.29*10**(-2)
se.logGEE         =4.69*10**(-1)

# Calculate SE Percent Change matrix
se.CD34Fbln=c(se.loglmod,
              se.logLMwFEint,
              se.logLMMwREint,
              se.logLMMwREslope,
              se.logGEE)

(perctChange.seCD34Fbln=PerctChangeMatrix(se.CD34Fbln))


