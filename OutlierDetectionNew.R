data(iris)
iris1 <- iris

iris_clean <- iris1[!iris1$Sepal.Width %in% outliers, ]

boxplot(iris1$Sepal.Width, main = "Original Data", ylab = "Sepal Width")
boxplot(iris_clean$Sepal.Width, main = "Cleaned Data", ylab = "Sepal Width")