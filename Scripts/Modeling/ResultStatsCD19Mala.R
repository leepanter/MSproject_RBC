# ResultStatsCD19Mala.R
# Nested Model Comparisons and Percent Change Matrices


# Load Data
load("/Users/lee/Google Drive/RBC Project/Data and Scripts/FinalData/CompiledDataEnvironments/CD19MalaWS.RData")


# Packages
library(nlme)
library(stargazer)

# We first Calculate the nested model comparisons

loglmod0.nlme=gls(model = logmala~logcd19,
                  data = dat)

logLMMwREint.nlme=lme(fixed=logmala~1 + logcd19,
                        random=~1|subject.no,
                        data = dat)

logLMMwREslope.nlme=lme(fixed=logmala~1 + logcd19,
                        random=~1+logcd19|subject.no,
                        data = dat)

## Model 0 < Model 1
x= anova(loglmod0, logLMwFEint)

## Model 0 < Model 3
x=anova.lme(loglmod0.nlme,logLMMwREint.nlme)

## Model 3 < Model 4
x=anova.lme(logLMMwREint.nlme,logLMMwREslope.nlme)



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

coef.loglmod=4.918*10**(-2)
coef.logLMwFEint=4.833*10**(-2)
coef.logLMMwREint=4.92*10**(-2)
coef.logLMMwREslope=5.938*10**(-2)
coef.logGEE=2.22*10**(-1)

# Calculate Coeficient percentage of change
coef.CD19Mala=c(coef.loglmod,coef.logLMwFEint,coef.logLMMwREint,
                coef.logLMMwREslope,coef.logGEE)
(perctChange.coefCD19Mala=PerctChangeMatrix(coef.CD19Mala))

model.names=c("Mod 0", "Mod 1", "Mod 2", "Mod 3", "Mod 4")

colnames(perctChange.coefCD19Mala)=model.names
rownames(perctChange.coefCD19Mala)=model.names

perctChange.coefCD19Mala.df=data.frame(perctChange.coefCD19Mala)


# Create Standard Error Vector
se.loglmod        =1.455*10 **(-2)
se.logLMwFEint    =1.381*10 **(-2)
se.logLMMwREint   =1.374*10  **(-2)
se.logLMMwREslope =3.538*10 **(-2)
se.logGEE         =6.3*10  **(-1)

# Calculate SE Percent Change matrix
se.CD19Mala=c(se.loglmod,
              se.logLMwFEint,
              se.logLMMwREint,
              se.logLMMwREslope,
              se.logGEE)

(perctChange.seCD19Mala=PerctChangeMatrix(se.CD19Mala))


