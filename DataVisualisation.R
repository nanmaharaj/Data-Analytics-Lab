View(airquality)

# Bar plot for Ozone concentration
barplot(
  airquality$Ozone,
  main = "Ozone Concentration in Air",
  xlab = "Ozone Levels",
  horiz = TRUE
)

# Histogram of Temperature at La Guardia Airport
hist(
  airquality$Temp,
  main = "La Guardia Airport's Maximum Temperature (Daily)",
  xlab = "Temperature (Fahrenheit)",
  col = "yellow",
  freq = TRUE
)


# Box plots for selected air quality parameters
boxplot(
  airquality[, 1:4],
  main = "Box Plots for Air Quality Parameters"
)

# Scatter plot for Ozone concentration by Month
plot(
  airquality$Ozone, 
  airquality$Month,
  main = "Scatterplot of Ozone Concentration by Month",
  xlab = "Ozone Concentration (ppb)",
  ylab = "Month of Observation"
)

# Creating a sample matrix and drawing a heatmap
data <- matrix(rnorm(25, 0, 5), nrow = 5, ncol = 5)
colnames(data) <- paste("Col", 1:5)
rownames(data) <- paste("Row", 1:5)
heatmap(data)
