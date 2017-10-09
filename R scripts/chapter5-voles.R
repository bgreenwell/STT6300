# Sample of vole skull length measurements (mm x 100) 
skull_length <- c(2355, 2305, 2388, 2370, 2470, 2535, 2385, 2445, 2435, 2330)

# Compute the sample mean
xbar <- mean(skull_length)

# Compute the sample standard deviation
s <- sd(skull_length)

# Compute the degrees of freedom (i.e., the sample size minus one)
n <- length(skull_length)
v <- n - 1

# Compute the 97.5-th percentile from the appropriate t-distribution
(1 + 0.95) / 2
tval <- qt(0.975, df = v)

# Compute a 95% confidence interval for the mean skull length
lwr <- xbar - tval * (s / sqrt(n))
upr <- xbar + tval * (s / sqrt(n))
c(lwr, upr)

# Using R's t.test function to obtain the interval 
t.test(skull_length, conf.level = 0.95)  # only use this to double check your work!!
