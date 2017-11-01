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
