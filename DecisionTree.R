install.packages("partykit")
install.packages("tidyverse")
install.packages("caTools")
library(tidyverse)
library(partykit)
library(caTools)

weatherdata <- read.csv("/Users/nandinimaharaj/Downloads/seattle-weather.csv")

head(weatherdata)
str(weatherdata)

weatherdata$weather <- as.factor(weatherdata$weather)

split=sample.split(weatherdata$weather, SplitRatio=0.8)
train=subset(weatherdata, split==TRUE)
test=subset(weatherdata, split==FALSE)


model <- ctree(weather ~ precipitation + temp_max + temp_min + wind, data = train)
plot(model)

predict_model <- predict(model, test)

mat <- table(test$weather, predict_model)
print(mat)

accuracy <- sum(diag(mat)) / sum(mat)
print(paste("Accuracy:", accuracy))

