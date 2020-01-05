titanic<-read.csv("/Users/Administrator/Documents/MSDatascience/IST707/train.csv")
str(titanic)
summary(titanic)

#read.csv("\C:\Users\Administrator\Documents\MSDatascience\IST707\")

#this conve3rs the Survived Int type attribute to FActor  and if you run summary(titanic) you will see the needed analytical data for Survided attribute
titanic$Survived=(titanic$Survived)
summary(titanic)

titanic$PassengerId=as.numeric(titanic$PassengerId)
summary(titanic)

#now let's convert the Pclass which is also treated as int variable by R into Ordinal (1 or 2 o 3rd class) using "ordered"
titanic$Pclass=ordered(titanic$Pclass)
summary(titanic)

#Month defined as a list
mons=c("Jan","Jan","Feb","Feb","Mar","Apr", "May", "Jun", "Jul", "Aug","Sep", "Oct", "Oct", "Nov", "Dec", "Dec")
table(mons)
mons

#Month defined as Ordered factor to use it for analysis
#newtablevar = factor(listvar, levels = c(required order)

mons_factor = factor(mons, levels = c("Jan","Feb","Mar","Apr", "May", "Jun", "Jul", "Aug","Sep", "Oct", "Nov", "Dec"),ordered = TRUE)


sum(is.na(titanic$Cabin))

apply(is.na(titanic),2,sum)

na.pass(titanic)
na.omit(Titanic)
na.exclude(titanic)
na.fail(titanic)


table(titanic$Pclass)
str(titanic)
summary(titanic)



hist(titanic$Age)

plot(titanic$Age, titanic$Fare)

table(titanic$Sex, titanic$Survived)


hist(titanic$Fare, titanic$Pclass=3)

titanicpclass3 = data.frame[titanic$Pclass>2]
library(ggplot2)
library(dplyr)
library(gridExtra)
 
boxplot <- ggplot(titanic %>% filter(Pclass == 3), aes(y = Fare)) + geom_boxplot()
histogram <- ggplot(titanic %>% filter(Pclass == 3), aes(x = Fare)) + geom_histogram()
grid.arrange(boxplot, histogram, ncol = 2)

titanicEmb <- titanic %>% filter(Embarked != "") 
crossTab <- table(titanicEmb$Embarked, titanicClean$Survived)[2:4, ]



titanic %>% group_by(Sex) %>% summarize(avgFare = mean(Fare))

#2.10.1 - Transformation

#Discretization
fareCut <- cut(titanic$Fare, breaks = c(0, 50, 100, 150, 250, 500), 
               labels = c('Cheapest', 'Cheap', 'Moderate', 'Expensive', 'SuperExpensive'))
table(fareCut)

#log
ggplot(titanic, aes(Fare, log(Fare))) + geom_point()

#Z-score
titanic %>% mutate(zScore = (Fare-mean(Fare))/sd(Fare)) %>% select(Fare, zScore) %>% head()

#min_max
titanic %>% mutate(minMax = (Fare-min(Fare))/(min(Fare)-max(Fare))) %>% select(Fare, minMax) %>% head()

# Random and systematic sampling
randomSample <- titanic[sample(1:nrow(titanic), 100, replace = FALSE), ]
systemSample <- titanic[seq(1, nrow(titanic), 8.91), ]
randomSample
