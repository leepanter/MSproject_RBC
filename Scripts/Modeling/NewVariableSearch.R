library(ggplot2)


### flowFilter
load("/Users/lee/Documents/Lee/School/CU Denver/MS_Project/Data:Scripts/FinalData/FilteredMergedData/Rdata/flowFilter.RData")


#### mdataFilter
load("/Users/lee/Documents/Lee/School/CU Denver/MS_Project/Data:Scripts/FinalData/FilteredMergedData/Rdata/mdataFilter.RData")


#### seqFilter
load("/Users/lee/Documents/Lee/School/CU Denver/MS_Project/Data:Scripts/FinalData/FilteredMergedData/Rdata/seqFilter.RData")



seqFilterT=data.frame(t(seqFilter))
#colnames(seqFilterT)=seqFilter[,2]
#seqFilterT=seqFilterT[-c(1,2),]


# CD19 ~ MALAT1
index.cd19=which(colnames(seqFilterT)=="CD19")
cd19=seqFilterT[, index.cd19]

col.indices=sample(1:38354, 1500, replace = FALSE)
dframe=data.frame(seqFilterT[,col.indices ] )
subject.no=mdataFilter$subject.no

plotlist=list()
lmodlist=list()
sumlist=list()
rsquared=c()


for(i in 1:150)
{
  y=dframe[,i]
  dframe.new=data.frame(cd19, y, subject.no)
  p3=ggplot(dframe.new, aes(x=cd19, y=y, color=subject.no))+
    geom_point(alpha=0.5)
  plotlist[[i]]=p3
  lmodlist[[i]]=lm(y~cd19, dframe.new)
  sumlist[[i]]=summary(lmodlist[[i]])
  rsquared[i]=sumlist[[i]]$r.squared
}

j=which.max(rsquared)
print(plotlist[[j]])

## AIRN--2922

#ind.select=which(colnames(seqFilterT)=="AIRN")
ind.y=index.cd19
ind.x=15466

y.var=as.numeric(seqFilterT[, ind.y])
x.var=as.numeric(seqFilterT[, ind.x])

dframe.new=data.frame(y.var,x.var,subject.no)
p3=ggplot(dframe.new, aes(x=x.var, y=y.var, color=subject.no))+
  geom_point(alpha=0.5)
p3

q1=c()
for(i in 1: 38354)
{
  q1[i]=quantile(seqFilterT[, i], 0.75)
}

which.max(q1[-c(16990:17025)])
q1[15466]
q1=q1[-15466]
which.max(q1)
q1[16995]
q1=q1[-16995]
which.max(q1)

print(colnames(seqFilterT)[16990:17025])
print(colnames(seqFilterT)[15466])
colnames(seqFilterT)[17004]
colnames(seqFilterT)[16995]

cd19
logcd19

mala
logmala





# FBLN1 (fbln) ~ CD34
seqFilterT=data.frame(t(seqFilter))
index.cd34=which(colnames(seqFilterT)=="CD34")
cd34=seqFilterT[, index.cd34]
subject.no=mdataFilter$subject.no

sample.vector1=1:6223
sample.vector2=6225:10000
sample.vector3=11000:15463
sample.vector4=15466:16990
sample.vector5=17117:38354

sample.vector=c(sample.vector1, sample.vector2, sample.vector3, sample.vector4)


plotlist=list()
lmodlist=list()
sumlist=list()
r2=c()

for(i in 1:length(sample.vector))
{
  y=seqFilterT[,sample.vector[i]]
  dframe.new=data.frame(cd34, y, subject.no)
  lmodlist[[i]]=lm(y~cd34, dframe.new)
  sumlist[[i]]=summary(lmodlist[[i]])
  r2[i]=sumlist[[i]]$r.squared
}

j=which.max(r2)
colnames(seqFilterT)[sample.vector[j]]

lmod=lm(seqFilterT[,j]~cd34, data = seqFilterT)
summary(lmod)

plot(seqFilterT[,j]~seqFilterT$CD34)
abline(lmod)
plotlist[[j]]

sample.vector=sample.vector[-which(sample.vector==j)]
index.sample=sample(sample.vector, 38352, replace = FALSE)
index.sample=sort(index.sample)



quant.vec=c()
for(i in 1:length(sample.vector)){
  index.temp=sample.vector[i]
  quant.vec[i]=mean(seqFilterT[,index.temp])
}
j=which.max(quant.vec)
colnames(seqFilterT)[index.sample[j]]

plot(seqFilterT$FBLN2~seqFilterT$CD34)

colnames(seqFilterT)[116]

for(i in 1:150)
{
  plot(seqFilterT[,i]~seqFilterT$CD34, main=i)
}

