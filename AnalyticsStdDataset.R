install.packages("tidyverse")
library(tidyverse)

titanic <- read.csv("/Users/nandinimaharaj/Downloads/titanic.csv")

head(titanic)
sapply(titanic, class)

titanic$Sex = as.factor(titanic$Sex) 
titanic$Survived = as.factor(titanic$Survived)

summary(titanic)

sum(is.na(titanic))
dropnull_titanic = na.exclude(titanic)
sum(is.na(dropnull_titanic))

#Splitting based on survival
survivedList = dropnull_titanic[dropnull_titanic$Survived == 1 , ] 
notSurvivedList = dropnull_titanic[dropnull_titanic$Survived == 0, ] 

#Pie chart of Survived & Not Survived
mytable <- table(titanic$Survived)
lbls <- c("Not Survived","Survived")
pie(
  mytable,
  labels = lbls,
  main = "pie chart"
)

#Histogram of Ages
hist(titanic$Age, xlab = "gender", ylab = "frequency")

#Bar plot of Gender Distribution among Non-Survivors
barplot(table(notSurvivedList$Sex), xlab = "gender", ylab = "frequency")

#Density plot of fare of Survivors
temp <- density(table(survivedList$Fare))
plot(temp, main = "fare charged")
polygon(temp)

#Box plot of Fare
boxplot(titanic$Fare, main = "fare")
