# Coefficient DataFrame Creation

CoefRowNames=c("(Intercept)",
               "subject.no6",
               "subject.no7",
               "subject.no9",
               "subject.no10",
               "subject.no11",
               "subject.no13",
               "subject.no14",
               "subject.no15",
               "subject.no17",
               "subject.no19",
               "subject.no20",
               "subject.no22",
               "subject.no24",
               "subject.no26",
               "logcd19",
               "subject.no6:logcd19",
               "subject.no7:logcd19",
               "subject.no9:logcd19",
               "subject.no10:logcd19",
               "subject.no11:logcd19",
               "subject.no13:logcd19",
               "subject.no14:logcd19",
               "subject.no15:logcd19",
               "subject.no17:logcd19",
               "subject.no19:logcd19",
               "subject.no20:logcd19",
               "subject.no22:logcd19",
               "subject.no24:logcd19",
               "subject.no26:logcd19")

coefTableMala=data.frame(coefTable.lmod0,
                         coefTable.lmod1,
                         coefTable.lmod2,
                         CoefTable.lmod3,
                         ranefTable.lmod3,
                         CoefTable.lmod4,
                         ranefTable.lmod4,
                         coefTable.GEE)
row.names(coefTableMala)=CoefRowNames

Final.coef.lmod3=c()
for(i in 1:15){
  Final.coef.lmod3[i]=coefTableMala$CoefTable.lmod3[i]+ranefTable.lmod3[i]
}

coefTableMala$Final.coef.lmod3=c(Final.coef.lmod3,
                                 coefTableMala$CoefTable.lmod3[16],
                                 x1)


Final.coef.lmod4=c()
for(i in 1:30){
  Final.coef.lmod4[i]=coefTableMala$CoefTable.lmod4[i]+ranefTable.lmod4[i]
}

coefTableMala$Final.coef.lmod4=Final.coef.lmod4


setwd("/Users/lee/Documents/GitHub/MSproject_RBC/MSproject_RBC/Scripts/Modeling/mala-cd19")
save(coefTableMala, file = "CoefficientMalaCD19.Rdata")
write.csv(coefTableMala, file = "CoefficientMalaCD19.csv")


################################################################################

coefTableFBLN=data.frame(coefTable.lmod0,
                         coefTable.lmod1,
                         coefTable.lmod2,
                         CoefTable.lmod3,
                         ranefTable.lmod3,
                         CoefTable.lmod4,
                         ranefTable.lmod4,
                         coefTable.GEE)
row.names(coefTableFBLN)=CoefRowNames

Final.coef.lmod3=c()
for(i in 1:15){
  Final.coef.lmod3[i]=coefTableFBLN$CoefTable.lmod3[i]+ranefTable.lmod3[i]
}

coefTableFBLN$Final.coef.lmod3=c(Final.coef.lmod3,
                                 coefTableFBLN$CoefTable.lmod3[16],
                                 x1)


Final.coef.lmod4=c()
for(i in 1:30){
  Final.coef.lmod4[i]=coefTableFBLN$CoefTable.lmod4[i]+ranefTable.lmod4[i]
}

coefTableFBLN$Final.coef.lmod4=Final.coef.lmod4


setwd("/Users/lee/Documents/GitHub/MSproject_RBC/MSproject_RBC/Scripts/Modeling/fbln-cd34")
save(coefTableFBLN, file = "CoefficientFBLNCD34.Rdata")
write.csv(coefTableFBLN, file = "CoefficientFBLNCD34.csv")

















