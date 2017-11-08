# The VO2 data contain the time to run two miles for a sample of middle-aged 
# males versus the maximum volume of oxygen uptake in the blood (VO2 max)

# VO2 max
vol <- c(
  42.33, 53.1, 42.08, 50.06, 42.45, 42.46, 47.82, 49.92, 36.23, 49.66, 41.49, 
  46.17, 48.18, 43.21, 51.81, 53.28, 53.29, 47.18, 56.91, 47.8, 48.65, 53.69, 
  60.62, 56.73
)

# Time to run two miles (in seconds)
time <- c(
  918, 805, 892, 962, 968, 907, 770, 743, 1045, 810, 927, 813, 858, 860, 760, 
  747, 743, 803, 683, 844, 755, 700, 748, 775
)

# Scatterplot
plot(vol, time, pch = 19)

# Simple linear regression
slr <- lm(time ~ vol)
abline(slr)  # add regression line to previous plot

# Print model summary
summary(slr)

# 95% confidence intervals for intercept and slope
confint(slr, level = 0.95)

# Predicted value at vol = 50
predict(slr, newdata = data.frame(vol = 50))

# 95% confidence interval for the mean response
predict(slr, newdata = data.frame(vol = 50), interval = "confidence")

# 95% prediction interval for an individual response
predict(slr, newdata = data.frame(vol = 50), interval = "prediction")

# Install the investr package (requires an internet connection)
# install.packages("investr")

# Load the investr package
library(investr)

# Plot the fitted regression lines with (pointwise) confidence and prediction 
# bands
plotFit(slr, interval = "both", data = data.frame(vol = vol, time = time),
        shade = TRUE)

# Scatterplot of the residuals versus the fitted values
fit <- fitted(slr)
res <- residuals(slr)
plot(fit, res, xlab = "Fitted value", ylab = "Residual")
abline(h = 0, lty = 2, col = "red")

# Scatterplot of the residuals versus VO2 max (vol)
plot(vol, res, xlab = expression(VO[2]), ylab = "Residual")
abline(h = 0, lty = 2, col = "red")

# Scatterplot of the studentized residuals versus the fitted values
stures <- rstandard(slr)
plot(fit, stures, xlab = "Fitted value", ylab = "Studentized residual")
abline(h = 0, lty = 2, col = "red")

# Normal Q-Q plot of residulas
qqnorm(res)
qqline(res)  # adds a reference line

# Residual plots
par(mfrow = c(3, 2))
plot(slr, which = 1:6)


################################################################################
# Simulated data displaying heteroscedasticity
################################################################################

# Simulate data
set.seed(101)
x <- runif(500, min = 0, max = 10)
y <- 1 + 3 * x + rnorm(500, sd = x)
plot(x, y)

# Fit a SLR model
fit <- lm(y ~ x)
abline(fit, col = "red", lwd = 2)

# Diagnostic plots
par(mfrow = c(2, 2))
plot(fit)
