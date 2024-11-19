install.packages("tidyverse")
library(tidyverse)

View(iris)

boxplot(iris$Sepal.Width, main = "Original Data", ylab = "Sepal Width")

iris$Sepal.Width <- replace(
  iris$Sepal.Width,
  iris$Sepal.Width %in% boxplot.stats(iris$Sepal.Width)$out,
  NA
)

iris1<-na.exclude(iris)

boxplot(iris1$Sepal.Width, main = "Cleaned Data", ylab = "Sepal Width")
