install.packages("titanic")
install.packages("tidyverse")
library(titanic)
library(tidyverse)

Titanic <- titanic::titanic_train
str(Titanic)

Titanic$Sex <- as.factor(Titanic$Sex)
Titanic$Survived <- as.factor(Titanic$Survived)

summary(Titanic)

sum(is.na(Titanic))
dropnull_Titanic <- na.exclude(Titanic)
sum(is.na(dropnull_Titanic))

survivedList <- dropnull_Titanic[dropnull_Titanic$Survived == 1, ]
notSurvivedList <- dropnull_Titanic[dropnull_Titanic$Survived == 0, ]

mytable <- table(Titanic$Survived)
lbls <- c("Not Survived", "Survived")
pie(
  mytable,
  labels = lbls,
  main = "Pie Chart of Survival"
)

hist(Titanic$Age, xlab = "Age", ylab = "Frequency", main = "Histogram of Ages", col = "blue", breaks = 20)

barplot(table(notSurvivedList$Sex), xlab = "Gender", ylab = "Frequency", main = "Gender Distribution among Non-Survivors", col = "orange")

temp <- density(survivedList$Fare, na.rm = TRUE)
plot(temp, main = "Density Plot of Fare (Survivors)", xlab = "Fare", ylab = "Density")
polygon(temp, col = "lightgreen", border = "darkgreen")

boxplot(Titanic$Fare, main = "Boxplot of Fare", col = "purple", ylab = "Fare")