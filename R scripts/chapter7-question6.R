# Pulse rates for men
males <- c(96.3, 96.7, 96.9, 97.0, 97.1, 97.1, 97.1, 97.2, 97.3, 97.4, 97.4, 
           97.4, 97.4, 97.5, 97.5, 97.6, 97.6, 97.6, 97.7, 97.8, 97.8, 97.8, 
           97.8, 97.9, 97.9, 98, 98, 98, 98, 98, 98, 98.1, 98.1, 98.2, 98.2, 
           98.2, 98.2, 98.3, 98.3, 98.4, 98.4, 98.4, 98.4, 98.5, 98.5, 98.6, 
           98.6, 98.6, 98.6, 98.6, 98.6, 98.7, 98.7, 98.8, 98.8, 98.8, 98.9, 
           99.0, 99.0, 99.0, 99.1, 99.2, 99.3, 99.4, 99.5)

# Pulse rated for females
females <- c(96.4, 96.7, 96.8, 97.2, 97.2, 97.4, 97.6, 97.7, 97.7, 97.8, 97.8, 
             97.8, 97.9, 97.9, 97.9, 98.0, 98.0, 98.0, 98.0, 98.0, 98.1, 98.2, 
             98.2, 98.2, 98.2, 98.2, 98.2, 98.3, 98.3, 98.3, 98.4, 98.4, 98.4, 
             98.4, 98.4, 98.5, 98.6, 98.6, 98.6, 98.6, 98.7, 98.7, 98.7, 98.7, 
             98.7, 98.7, 98.8, 98.8, 98.8, 98.8, 98.8, 98.8, 98.8, 98.9, 99.0, 
             99.0, 99.1, 99.1, 99.2, 99.2, 99.3, 99.4, 99.9, 100, 100.8)

# Sample means
xbar1 <- mean(males)
xbar2 <- mean(females)

# Sample variances
var1 <- var(males)
var2 <- var(females)

# Pooled variance
n1 <- length(males)
n2 <- length(females)
var.pooled <- ((n1 - 1) * var1 + (n2 - 1) * var2) / (n1 + n2 - 2)

# Observed test statistic
(xbar1 - xbar2) / sqrt(var.pooled * (1 / n1 + 1 / n2))


# Confirm answer using R's built-in t-test function
t.test(x = males, 
       y = females, 
       alternative = "two.sided", 
       var.equal = TRUE, 
       conf.level = 0.95)

# Assuming unequal variances
t.test(x = males, 
       y = females, 
       alternative = "two.sided", 
       var.equal = FALSE, 
       conf.level = 0.95)

# Obtain a 99% confidence interval
t.test(x = males, 
       y = females, 
       alternative = "two.sided", 
       var.equal = TRUE, 
       conf.level = 0.99)

