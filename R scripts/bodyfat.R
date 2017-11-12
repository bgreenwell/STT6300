# Example: Predicting Body Fat Percentage. Can accurate body fat predictions be 
# made using easily obtained body measurements? An experiment was conducted 
# where the body fat percentage of n = 252 men was measured (using Brozek's 
# equation). (SOURCE: Dr. A. Garth Fisher, Human Performance Research Center, 
# Brigham Young University, Provo, Utah 84602). We shall use predictor variables 
# weight (lbs), abdomen (cm), thigh circumference (cm), and wrist circumference 
# (cm) to predict body fat percentage in a multiple regression model.

# Load the body fat percentage data set
bodyfat <- read.csv(file.choose(), header = TRUE)

# Scatterplot matrix
pairs(bodyfat[, c("brozek", "abdomen", "weight", "thigh", "wrist")],
      col = adjustcolor("purple2", alpha.f = 0.5), pch = 19)

# Fit a multiple linear regression model
mlr <- lm(brozek ~ abdomen + weight + thigh + wrist, data = bodyfat)

# Print a summary of the model
summary(mlr)

# Mean square error (i.e., MSE)
mse <- sigma(mlr) ^ 2
mse

# Various diagnostic plots
res <- rstandard(mlr)
fit <- fitted(mlr)
par(mfrow = c(1, 2))
plot(fit, res, xlab = "Fitted value", ylab = "Studentized residual")
abline(h = 0, lty = 2, col = "red")
qqnorm(res, xlab = "Theoretical quantile", ylab = "Sample quantile", main = "")
qqline(res, lty = 2, col = "red")

# 95% Confidence intervals for regression coefficients
confint(mlr, conf.level = 0.95)
