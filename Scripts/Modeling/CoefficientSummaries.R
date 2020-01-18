# Normalizing and Percent Change Calculations


####	Load Packages	 ####
library(reshape)
library(gridExtra)
library(ggplot2)
library(dplyr)
library(stargazer)

####	Load Data	 ####

####	Malat Data	 ####
load("/Users/lee/Documents/GitHub/MSproject_RBC/MSproject_RBC/Scripts/Modeling/mala-cd19/CoefficientMalaCD19.Rdata")
mala.dat=coefTableMala
mala.dat=round(mala.dat, digits=4)
colnames(mala.dat)=c("mala.lmod0",
                     "mala.lmod1",
                     "mala.lmod2",
                     "mala.lmod3.fix",
                     "mala.lmod3.rand",
                     "mala.lmod4.fix",
                     "mala.lmod4.rand",
                     "mala.gee",
                     "mala.lmod3",
                     "mala.lmod4")

mala.import=mala.dat

mala.lmod1.ltfr=mala.dat$mala.lmod1
mala.lmod2.ltfr=mala.dat$mala.lmod2

mala.lmod1.new=rep(mala.lmod1.ltfr[1], times=15)
mala.lmod2.new=rep(mala.lmod2.ltfr[1], times=15)
mala.lmod2.new.slope=rep(mala.lmod2.ltfr[16], times=15)

mala.lmod1.add=c(0, mala.lmod1.ltfr[2:15])
mala.lmod2.add=c(0, mala.lmod2.ltfr[2:15])
mala.lmod2.slope.add=c(0, mala.lmod2.ltfr[17:30])

mala.lmod1.new=mala.lmod1.new+mala.lmod1.add
mala.lmod2.new=mala.lmod2.new+mala.lmod2.add
mala.lmod2.new.slope=mala.lmod2.new.slope+mala.lmod2.slope.add


mala.dat$mala.lmod1[1:15]=mala.lmod1.new
mala.dat$mala.lmod2[1:15]=mala.lmod2.new
mala.dat$mala.lmod2[16:30]=mala.lmod2.new.slope

mala.dat.temp=data.frame(mala.dat$mala.lmod0,
                         mala.dat$mala.lmod1,
                         mala.dat$mala.lmod2,
                         mala.dat$mala.lmod3,
                         mala.dat$mala.lmod4,
                         mala.dat$mala.gee)

mala.dat=mala.dat.temp

colnames(mala.dat)=c("mala.lmod0",
                      "mala.lmod1",
                      "mala.lmod2",
                      "mala.lmod3",
                      "mala.lmod4",
                      "mala.gee")


####	FBLN Data	 ####
load("/Users/lee/Documents/GitHub/MSproject_RBC/MSproject_RBC/Scripts/Modeling/fbln-cd34/CoefficientFBLNCD34.Rdata")
fbln.dat=coefTableFBLN
fbln.dat=round(fbln.dat, digits=4)

colnames(fbln.dat)=c("fbln.lmod0",
                     "fbln.lmod1",
                     "fbln.lmod2",
                     "fbln.lmod3.fix",
                     "fbln.lmod3.rand",
                     "fbln.lmod4.fix",
                     "fbln.lmod4.rand",
                     "fbln.gee",
                     "fbln.lmod3",
                     "fbln.lmod4")

fbln.import=fbln.dat

fbln.lmod1.ltfr=fbln.dat$fbln.lmod1
fbln.lmod2.ltfr=fbln.dat$fbln.lmod2

fbln.lmod1.new=rep(fbln.lmod1.ltfr[1], times=15)
fbln.lmod2.new=rep(fbln.lmod2.ltfr[1], times=15)
fbln.lmod2.new.slope=rep(fbln.lmod2.ltfr[16], times=15)

fbln.lmod1.add=c(0, fbln.lmod1.ltfr[2:15])
fbln.lmod2.add=c(0, fbln.lmod2.ltfr[2:15])
fbln.lmod2.slope.add=c(0, fbln.lmod2.ltfr[17:30])

fbln.lmod1.new=fbln.lmod1.new+fbln.lmod1.add
fbln.lmod2.new=fbln.lmod2.new+fbln.lmod2.add
fbln.lmod2.new.slope=fbln.lmod2.new.slope+fbln.lmod2.slope.add

fbln.dat$fbln.lmod1[1:15]=fbln.lmod1.new
fbln.dat$fbln.lmod2[1:15]=fbln.lmod2.new
fbln.dat$mala.lmod2[16:30]=fbln.lmod2.new.slope

fbln.dat.temp=data.frame(fbln.dat$fbln.lmod0,
                         fbln.dat$fbln.lmod1,
                         fbln.dat$fbln.lmod2,
                         fbln.dat$fbln.lmod3,
                         fbln.dat$fbln.lmod4,
                         fbln.dat$fbln.gee)

fbln.dat=fbln.dat.temp

colnames(fbln.dat)=c("fbln.lmod0",
                     "fbln.lmod1",
                     "fbln.lmod2",
                     "fbln.lmod3",
                     "fbln.lmod4",
                     "fbln.gee")

####	Define Subject Variable	 ####
subject=c("5","6","7","9","10","11","13","14","15","17",
               "19","20","22","24","26")
subject=factor(subject, ordered=TRUE,
               levels = c("5","6","7","9","10","11","13","14","15","17",
                          "19","20","22","24","26"))

subject.no=c(5,6,7,9,10,11,13,14,15,17,19,20,22,24,26)
subject.no=as.numeric(subject.no)


####	Define Mala Variables	 ####
mala.intercept=c()
mala.slope=c()
for( i in 1:6){
  mala.intercept[i]=mala.dat[1,i]
  mala.slope[i]=mala.dat[16,i]
}

mala.mod1.SubjectIntercepts=mala.dat$mala.lmod1[1:15]
mala.mod2.SubjectIntercepts=mala.dat$mala.lmod2[1:15]
mala.mod3.SubjectIntercepts=mala.dat$mala.lmod3[1:15]
mala.mod4.SubjectIntercepts=mala.dat$mala.lmod4[1:15]

mala.mod2.SubjectSlopes=mala.dat$mala.lmod2[16:30]
mala.mod4.SubjectSlopes=mala.dat$mala.lmod4[16:30]



####	Define Fbln Variables	 ####
fbln.intercept=c()
fbln.slope=c()
for( i in 1:6){
  fbln.intercept[i]=fbln.dat[1,i]
  fbln.slope[i]=fbln.dat[16,i]
}

fbln.mod1.SubjectIntercepts=fbln.dat$fbln.lmod1[1:15]
fbln.mod2.SubjectIntercepts=fbln.dat$fbln.lmod2[1:15]
fbln.mod3.SubjectIntercepts=fbln.dat$fbln.lmod3[1:15]
fbln.mod4.SubjectIntercepts=fbln.dat$fbln.lmod4[1:15]

fbln.mod2.SubjectSlopes=fbln.dat$fbln.lmod2[16:30]
fbln.mod4.SubjectSlopes=fbln.dat$fbln.lmod4[16:30]



####	Normalized mala.Subject variables	 ####

####  Intercepts
mean_mala.mod1.SubjectIntercepts=mean(mala.mod1.SubjectIntercepts)
mean_mala.mod2.SubjectIntercepts=mean(mala.mod2.SubjectIntercepts)
mean_mala.mod3.SubjectIntercepts=mean(mala.mod3.SubjectIntercepts)
mean_mala.mod4.SubjectIntercepts=mean(mala.mod4.SubjectIntercepts)

sd_mala.mod1.SubjectIntercepts=sd(mala.mod1.SubjectIntercepts)
sd_mala.mod2.SubjectIntercepts=sd(mala.mod2.SubjectIntercepts)
sd_mala.mod3.SubjectIntercepts=sd(mala.mod3.SubjectIntercepts)
sd_mala.mod4.SubjectIntercepts=sd(mala.mod4.SubjectIntercepts)

normal.mala.mod1.SubjectIntercepts=(mala.mod1.SubjectIntercepts-mean_mala.mod1.SubjectIntercepts)/sd_mala.mod1.SubjectIntercepts
normal.mala.mod2.SubjectIntercepts=(mala.mod2.SubjectIntercepts-mean_mala.mod2.SubjectIntercepts)/sd_mala.mod2.SubjectIntercepts
normal.mala.mod3.SubjectIntercepts=(mala.mod3.SubjectIntercepts-mean_mala.mod3.SubjectIntercepts)/sd_mala.mod3.SubjectIntercepts
normal.mala.mod4.SubjectIntercepts=(mala.mod4.SubjectIntercepts-mean_mala.mod4.SubjectIntercepts)/sd_mala.mod4.SubjectIntercepts

normal.mala.SubjectIntercepts=data.frame(subject.no,
                                         normal.mala.mod1.SubjectIntercepts,
                                         normal.mala.mod2.SubjectIntercepts,
                                         normal.mala.mod3.SubjectIntercepts,
                                         normal.mala.mod4.SubjectIntercepts)

####  Slopes
mean_mala.mod2.SubjectSlopes=mean(mala.mod2.SubjectSlopes)
mean_mala.mod4.SubjectSlopes=mean(mala.mod4.SubjectSlopes)

sd_mala.mod2.SubjectSlopes=sd(mala.mod2.SubjectSlopes)
sd_mala.mod4.SubjectSlopes=sd(mala.mod4.SubjectSlopes)

normal.mala.mod2.SubjectSlopes=(mala.mod2.SubjectSlopes-mean_mala.mod2.SubjectSlopes)/sd_mala.mod2.SubjectSlopes
normal.mala.mod4.SubjectSlopes=(mala.mod4.SubjectSlopes-mean_mala.mod4.SubjectSlopes)/sd_mala.mod4.SubjectSlopes

normal.mala.SubjectSlopes=data.frame(subject.no,
                                     normal.mala.mod2.SubjectSlopes,
                                     normal.mala.mod4.SubjectSlopes)



####	Normalized fbln.Subject variables	 ####

####  Intercepts
mean_fbln.mod1.SubjectIntercepts=mean(fbln.mod1.SubjectIntercepts)
mean_fbln.mod2.SubjectIntercepts=mean(fbln.mod2.SubjectIntercepts)
mean_fbln.mod3.SubjectIntercepts=mean(fbln.mod3.SubjectIntercepts)
mean_fbln.mod4.SubjectIntercepts=mean(fbln.mod4.SubjectIntercepts)

sd_fbln.mod1.SubjectIntercepts=sd(fbln.mod1.SubjectIntercepts)
sd_fbln.mod2.SubjectIntercepts=sd(fbln.mod2.SubjectIntercepts)
sd_fbln.mod3.SubjectIntercepts=sd(fbln.mod3.SubjectIntercepts)
sd_fbln.mod4.SubjectIntercepts=sd(fbln.mod4.SubjectIntercepts)

normal.fbln.mod1.SubjectIntercepts=(fbln.mod1.SubjectIntercepts-mean_fbln.mod1.SubjectIntercepts)/sd_fbln.mod1.SubjectIntercepts
normal.fbln.mod2.SubjectIntercepts=(fbln.mod2.SubjectIntercepts-mean_fbln.mod2.SubjectIntercepts)/sd_fbln.mod2.SubjectIntercepts
normal.fbln.mod3.SubjectIntercepts=(fbln.mod3.SubjectIntercepts-mean_fbln.mod3.SubjectIntercepts)/sd_fbln.mod3.SubjectIntercepts
normal.fbln.mod4.SubjectIntercepts=(fbln.mod4.SubjectIntercepts-mean_fbln.mod4.SubjectIntercepts)/sd_fbln.mod4.SubjectIntercepts

normal.fbln.SubjectIntercepts=data.frame(subject.no,
                                         normal.fbln.mod1.SubjectIntercepts,
                                         normal.fbln.mod2.SubjectIntercepts,
                                         normal.fbln.mod3.SubjectIntercepts,
                                         normal.fbln.mod4.SubjectIntercepts)

####  Slopes
mean_fbln.mod2.SubjectSlopes=mean(fbln.mod2.SubjectSlopes, na.rm = TRUE)
mean_fbln.mod4.SubjectSlopes=mean(fbln.mod4.SubjectSlopes, na.rm = TRUE)

sd_fbln.mod2.SubjectSlopes=sd(fbln.mod2.SubjectSlopes, na.rm = TRUE)
sd_fbln.mod4.SubjectSlopes=sd(fbln.mod4.SubjectSlopes, na.rm = TRUE)

normal.fbln.mod2.SubjectSlopes=(fbln.mod2.SubjectSlopes-mean_fbln.mod2.SubjectSlopes)/sd_fbln.mod2.SubjectSlopes
normal.fbln.mod4.SubjectSlopes=(fbln.mod4.SubjectSlopes-mean_fbln.mod4.SubjectSlopes)/sd_fbln.mod4.SubjectSlopes

normal.fbln.SubjectSlopes=data.frame(subject.no,
                                     normal.fbln.mod2.SubjectSlopes,
                                     normal.fbln.mod4.SubjectSlopes)

####	Reshape Data Frames	 ####

#### Mala SubjectIntercepts
colnames(normal.mala.SubjectIntercepts)=c("subject.no", "mod1", "mod2", "mod3", "mod4")

normal.mala.SubjectIntercepts.long=melt(normal.mala.SubjectIntercepts,
                                   id.vars = "subject.no")

normal.mala.SubjectIntercepts.long = normal.mala.SubjectIntercepts.long %>%
  arrange(subject.no)


####  Mala Subject Slopes
colnames(normal.mala.SubjectSlopes)=c("subject.no", "mod2",  "mod4")

normal.mala.SubjectsSlopes.long=melt(normal.mala.SubjectSlopes,
                                        id.vars = "subject.no")

normal.mala.SubjectsSlopes.long = normal.mala.SubjectsSlopes.long %>%
  arrange(subject.no)



#### fbln SubjectIntercepts
colnames(normal.fbln.SubjectIntercepts)=c("subject.no", "mod1", "mod2", "mod3", "mod4")

normal.fbln.SubjectIntercepts.long=melt(normal.fbln.SubjectIntercepts,
                                        id.vars = "subject.no")

normal.fbln.SubjectIntercepts.long = normal.fbln.SubjectIntercepts.long %>%
  arrange(subject.no)


####  Mala Subject Slopes
colnames(normal.fbln.SubjectSlopes)=c("subject.no", "mod2",  "mod4")

normal.fbln.SubjectsSlopes.long=melt(normal.fbln.SubjectSlopes,
                                     id.vars = "subject.no")

normal.fbln.SubjectsSlopes.long = normal.fbln.SubjectsSlopes.long %>%
  arrange(subject.no)




####	Coefficient Plots	 ####

#### Mala SubjectIntercepts
pmala.1=ggplot(normal.mala.SubjectIntercepts.long,
               aes(x=subject.no, y=value, color=variable, shape=variable, size=4))+
  geom_jitter(width = 0.25)+
  geom_vline(xintercept = subject.no, linetype="dashed", alpha=0.15)+
  geom_hline(yintercept = 0)+
  ylim(-3,3)
pmala.1

#### Mala SubjectSlopes
pmala.2=ggplot(normal.mala.SubjectsSlopes.long,
               aes(x=subject.no, y=value, color=variable, shape=variable, size=4))+
  geom_jitter(width = 0)+
  geom_vline(xintercept = subject.no, linetype="dashed", alpha=0.15)+
  geom_hline(yintercept = 0)+
  ylim(-1.5,3.5)
pmala.2


#### fbln SubjectIntercepts
pfbln.1=ggplot(normal.fbln.SubjectIntercepts.long,
               aes(x=subject.no, y=value, color=variable, shape=variable, size=4))+
  geom_jitter(width = 0.25)+
  geom_vline(xintercept = subject.no, linetype="dashed", alpha=0.15)+
  geom_hline(yintercept = 0)+
  ylim(-3,3)
pfbln.1

#### fbln SubjectSlopes
pfbln.2=ggplot(normal.fbln.SubjectsSlopes.long,
               aes(x=subject.no, y=value, color=variable, shape=variable, size=4))+
  geom_jitter(width = 0)+
  geom_vline(xintercept = subject.no, linetype="dashed", alpha=0.15)+
  geom_hline(yintercept = 0)+
  ylim(-1.5,3.5)
pfbln.2

grid.arrange(pmala.1,pfbln.1, nrow=2)
grid.arrange(pmala.2,pfbln.2, nrow=2)


####	Save data	 ####
non.subject.data=data.frame(mala.intercept,
                            fbln.intercept,
                            mala.slope,
                            fbln.slope)

setwd("/Users/lee/Documents/GitHub/MSproject_RBC/MSproject_RBC/Scripts/Modeling")
save(non.subject.data, file="NonSubjectData.Rdata")


subject.no=normal.mala.SubjectIntercepts$subject.no
mala.mod1=normal.mala.SubjectIntercepts$mod1
mala.mod2=normal.mala.SubjectIntercepts$mod2
mala.mod3=normal.mala.SubjectIntercepts$mod3
mala.mod4=normal.mala.SubjectIntercepts$mod4
fbln.mod1=normal.fbln.SubjectIntercepts$mod1
fbln.mod2=normal.fbln.SubjectIntercepts$mod2
fbln.mod3=normal.fbln.SubjectIntercepts$mod3
fbln.mod4=normal.fbln.SubjectIntercepts$mod4

SubjectIntercepts=data.frame(subject.no,
                             mala.mod1,
                             mala.mod2,
                             mala.mod3,
                             mala.mod4,
                             fbln.mod1,
                             fbln.mod2,
                             fbln.mod3,
                             fbln.mod4)

setwd("/Users/lee/Documents/GitHub/MSproject_RBC/MSproject_RBC/Scripts/Modeling")
save(SubjectIntercepts, file="SubjectIntercepts.Rdata")



mala.slope.mod2=normal.mala.SubjectSlopes$mod2
mala.slope.mod4=normal.mala.SubjectSlopes$mod4
fbln.slope.mod2=normal.fbln.SubjectSlopes$mod2
fbln.slope.mod4=normal.fbln.SubjectSlopes$mod4


SubjectSlopes=data.frame(mala.slope.mod2,
                         mala.slope.mod4,
                         fbln.slope.mod2,
                         fbln.slope.mod4)

setwd("/Users/lee/Documents/GitHub/MSproject_RBC/MSproject_RBC/Scripts/Modeling")
save(SubjectSlopes, file="SubjectSlopes.Rdata")
