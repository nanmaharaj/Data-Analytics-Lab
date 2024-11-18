install.packages("caTools")
install.packages("tidyverse")
install.packages("rattle")
install.packages("partykit")

library(caTools)
library(tidyverse)
library(rattle)
library(partykit)

data(weatherAUS)
weatherdata <- weatherAUS
weatherdata$RainTomorrow <- as.factor(weatherdata$RainTomorrow)
weatherdata <- na.omit(weatherdata)  # Remove missing values

split = sample.split(weatherdata$RainTomorrow, SplitRatio = 0.8)
train = subset(weatherdata, split == TRUE)
test = subset(weatherdata, split == FALSE)

model <- ctree(
  RainTomorrow ~ Pressure9am + Pressure3pm + Cloud9am + Cloud3pm,
  data = train,
  control = ctree_control(
    maxdepth = 2
  )
)

plot(model)

predict_model <- predict(model, test)
mat <- table(test$RainTomorrow, predict_model)
print(mat)

accuracy <- sum(diag(mat)) / sum(mat)
print(paste("Accuracy:", accuracy))
