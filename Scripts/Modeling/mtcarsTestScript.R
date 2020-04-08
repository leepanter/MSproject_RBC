library(nlme)
library(lme4)

data(mtcars)
str(mtcars)
summary(mtcars)

mtcars$cyl.factor=as.factor(mtcars$cyl)

# LM Model
lmod=lm(mpg~wt, data=mtcars)
(lmods=summary(lmod))

# LM-FE Model
LMFE=lm(mpg~cyl.factor+wt, data=mtcars)
(LMFEs=summary(LMFE))



