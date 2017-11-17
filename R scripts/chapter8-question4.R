# Chlorophyll-a
chlor <- c(95, 39, 27, 12.9, 34.8, 14.9, 157, 5.1, 10.6, 96, 7.2, 130, 4.7, 
           138, 24.8, 50, 12.7, 7.4, 8.6, 94, 3.9, 5, 129, 86, 64)

# Phosphorus
phos <- c(329, 211, 108, 20.7, 60.2, 26.3, 596, 39, 42, 99, 13.1, 267, 14.9, 
          217, 49.3, 138, 21.1, 25, 42, 207, 10.5, 25, 373, 220, 67)

# Nitrogen
nitro <- c(8, 6, 11, 16, 9, 17, 4, 13, 11, 16, 25, 17, 18, 11, 12, 10, 22, 16, 
           10, 11, 25, 22, 8, 12, 19)


# Scatter plot of the data
plot(log(phos), log(chlor), xlab = "Log phosphorus", ylab = "Log chlorophyll-a")

# Fit a simple linear regression model
slr <- lm(log(chlor) ~ log(phos))

# Estimated regression coefficients
coef(slr)

# Print a more in-depth summary of the fitted regression model
summary(slr)

# Compute 95% confidence intervals for the estimated regression coefficients
confint(slr, level = 0.95)
