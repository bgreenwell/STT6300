################################################################################
# Voles data
################################################################################

# A study was conducted to differentiate between two different species of voles
# found in Europe. Several morphometric measurements were obtained from a sample
# of voles of each species (Airoldi, Flury, and Salvioni, 1996). For now, we
# shall look at the skull length measured in mmX100 of one of the species:
# microtus multiplex. In the R code below, we store the n = 43 measurements in
# the variable skull_length.
skull_length <- c(2145, 2237, 2250, 2270, 2300, 2300, 2305, 2305, 2305, 2330,
                  2330, 2340, 2345, 2345, 2345, 2350, 2350, 2352, 2355, 2355,
                  2370, 2370, 2370, 2385, 2385, 2388, 2390, 2396, 2410, 2435,
                  2445, 2452, 2457, 2465, 2470, 2470, 2475, 2500, 2500, 2525,
                  2535, 2590, 2600)

# Obtain a histogram of the skull length measurements
hist(skull_length,
     freq = FALSE,  # use probability density for the y-axis instead of counts
     main = "Histogram of vole skull lengths",  # histogram title
     xlab = "Length (mmX100)",  # x-axis label
     xlim = c(2000, 2700))

# Overlay a normal density
x <- seq(from = 2000, to = 2700, length = 500)
y <- dnorm(x, mean = mean(skull_length), sd = sd(skull_length))
lines(x, y, lwd = 2, col = "red")

# Estimate P(X > 2600)
1 - pnorm(2600, mean = mean(skull_length), sd = sd(skull_length))
abline(v = 2600, lty = 2, lwd = 2, col = "blue")


################################################################################
# Simulated blood pressure data
################################################################################

# Histograms for data with different sample sizes
set.seed(101)  # set random seed for reproducibility
par(mfrow = c(1, 3))
hist(rnorm(10, mean = 120), freq = FALSE,
     main = "Coarse", xlab = "Blood pressure (mmHg)")
hist(rnorm(100, mean = 120), freq = FALSE,
     main = "Finer", xlab = "Blood pressure (mmHg)")
hist(rnorm(10000, mean = 120), breaks = 100, freq = FALSE,
     main = "Super fine with density curve", xlab = "Blood pressure (mmHg)")
x <- seq(from = 100, to = 130, length = 500)
y <- dnorm(x, mean = 120)
lines(x, y, lwd = 2, col = "red")
