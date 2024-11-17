install.packages("tidyverse")
library(tidyverse)
View(airquality)

which(is.na(airquality))
sum(is.na(airquality))

cleaned_aq <- na.exclude(airquality)
ozone_mean <- mean(cleaned_aq$Ozone)

newaq <- airquality %>% mutate(Ozone = ifelse(is.na(Ozone), ozone_mean, Ozone))
View(newaq)
