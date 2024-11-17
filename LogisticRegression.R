install.packages("ggplot2")
install.packages("pROC")
library(ggplot2)
library(pROC)

data(iris)
iris$SpeciesBinary <- ifelse(iris$Species == "setosa", 1, 0)

logistic_model <- glm(SpeciesBinary ~ Sepal.Length, data = iris, family = "binomial")
summary(logistic_model)

iris$predicted_probabilities <- predict(logistic_model, type = "response")
iris$predicted_class <- ifelse(iris$predicted_probabilities > 0.5, 1, 0)

confusion_matrix <- table(Actual = iris$SpeciesBinary, Predicted = iris$predicted_class)
print(confusion_matrix)

ggplot(iris, aes(x = Sepal.Length, y = predicted_probabilities)) +
  geom_point(aes(color = factor(SpeciesBinary)), size = 3) +
  labs(x = "Sepal Length", y = "Predicted Probability of Setosa") +
  ggtitle("Logistic Regression: Predicted Probability of Setosa by Sepal Length") +
  theme_minimal()

roc_curve <- roc(iris$SpeciesBinary, iris$predicted_probabilities)
auc_value <- auc(roc_curve)
print(paste("AUC:", auc_value))
plot(roc_curve, main = paste("ROC Curve (AUC =", round(auc_value, 2), ")"), col = "blue", lwd = 2)