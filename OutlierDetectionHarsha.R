data(iris)
iris1 <- iris

# Define outliers
outliers <- iris1$Sepal.Width < quantile(iris1$Sepal.Width, 0.25) - 1.5 * IQR(iris1$Sepal.Width) | 
  iris1$Sepal.Width > quantile(iris1$Sepal.Width, 0.75) + 1.5 * IQR(iris1$Sepal.Width)

# Remove outliers
iris_clean <- iris1[!outliers, ]

# Create boxplots
boxplot(iris1$Sepal.Width, main = "Original Data", ylab = "Sepal Width")
boxplot(iris_clean$Sepal.Width, main = "Cleaned Data", ylab = "Sepal Width")
