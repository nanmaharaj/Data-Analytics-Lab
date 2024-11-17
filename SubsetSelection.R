install.packages("tidyverse")
install.packages("leaps")
library(tidyverse)
library(leaps)

View(Titanic)
Titanic = Titanic %>% na.omit()

fwd = regsubsets(Freq~., data = Titanic, method = "forward")
summary(fwd)
coef(fwd, 3)

bwd = regsubsets(Freq~., data = Titanic, method = "backward")
summary(bwd)
coef(bwd, 3)

full = regsubsets(Freq~., data = Titanic)
summary(full)
coef(full, 3)

