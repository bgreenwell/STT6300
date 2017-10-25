# Below are the serum acid phosphatase levels in 20 prostate cancer patients 
# whose cancer has spread to surrounding lymph nodes
acid <- c(0.56, 0.67, 0.99, 1.36, 0.82, 0.48, 0.51, 0.49, 0.84, 0.81,
          0.76, 0.70, 0.78, 0.70, 0.67, 0.82, 0.67, 0.72, 0.89, 1.26)

# Plots
par(mfrow = c(2, 2))
hist(acid)
boxplot(acid)
qqnorm(acid)  # If normally distributed, the points should fall on or near the
qqline(acid)  # line

# Hypothesis:
#
# H0: mu = 0.645  vs. H1: mu > 0.645
#
# Run a one-sample t-test
t.test(acid,                     # sample values
       alternative = "greater",  # since H1 involves a ">" sign
       mu = 0.645,               # status quo
       conf.level = 0.95)        # no significance level given

# Sample mean
mean(acid)
