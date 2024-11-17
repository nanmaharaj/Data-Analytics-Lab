install.packages("lubridate")
install.packages("forecast")
library(lubridate)
library(forecast)

positiveCases <- c(580, 7813, 28266, 59287, 75700, 87820, 95314, 126214, 218843, 471497, 936851, 1508725, 2072113)

deaths <- c(17, 270, 565, 1261, 2126, 2800, 3285, 4628, 8951, 21283, 47210, 88480, 138475)

# Create a multivariate time series object
mts <- ts(cbind(positiveCases, deaths),
          start = decimal_date(ymd("2020-01-22")),
          frequency = 365.25 / 7)
plot(mts, 
     xlab = "Weekly Data", 
     main = "COVID-19 Cases", 
     col.main = "darkgreen")


# Create a time series object for positive cases alone
mts1 <- ts(positiveCases, 
           start = decimal_date(ymd("2020-01-22")), 
           frequency = 365.25 / 7)

fit <- auto.arima(mts1)
fit_forecast <- forecast(fit, h = 5)

plot(fit_forecast, 
     xlab = "Weekly Data", 
     ylab = "Positive Cases", 
     main = "COVID-19 Forecast", 
     col.main = "green")