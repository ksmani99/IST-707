library(ggplot2)
library(dplyr)
library(tidyr)

#Import the data from .csv and list
myschool <-read.csv("C:/Users/subbuk/Documents/MSDatascience/IST707/storyteller.csv")
head(myschool)

#Check the data structure and data volume and learn the data.
str(mysc?ool)

summary(myschool)

dim(myschool)
glimpse(myschool)

#Simplify the columns
colnames(myschool) <- c("school","section","very_ahead","middling_0","behind_1_5","more_behind_6_10","very_behind_11","completed")

#change section into nominal value
myschool$?ection <- factor(myschool$section)

#Now we'll restructure the data set using tidyr principles, having one row per observation.

tidmyschool <- gather(myschool,key= c("very_ahead","middling_0","behind_1_5","more_behind_6_10","very_behind_11","completed"), ?alue=numStudents, c(-section,-school))


colnames(tidymyschool)[3] <- "studentClass"

tidymyschool$studentClass <- factor(tidyDat$studentClass, levels = c("completed", 
                                                                "very_ahead", "middling?0", "behind_1_5", "more_behind_6_10", "very_behind_11"))
