# A study was done to determine whether or not fire can be used as a viable 
# management tool to increase the amount of forage available to deer. The 
# question of interest is if fire changes calcium levels present in the soil? 
# The experiment was conducted on 12 plots and calcium was measured on soil 
# samples before and after the burn. Data are in units of kilograms per plot. 
# (Source: Probability and Statistics for Engineers and Scientist by Walpole et 
# al, 7th edtion.)

# Before measurements
pre  <- c(50, 50, 82, 64, 82, 73, 77, 54, 23, 45, 36, 54)

# After measurements
post <- c( 9, 18, 45, 18, 18,  9, 32,  9, 18,  9,  9,  9)

# Paired differences: post - pre
dif <- post - pre

# Graphics
par(mfrow = c(2, 2))
plot(pre, post)
hist(dif)
boxplot(dif)
qqnorm(dif)
qqline(dif)

# Paired t-test
t.test(dif, conf.level = 0.95)
# 
# One Sample t-test
# 
# data:  dif
# t = -8.9028, df = 11, p-value = 2.331e-06
# alternative hypothesis: true mean is not equal to 0
# 95 percent confidence interval:
#   -50.61646 -30.55020
# sample estimates:
#   mean of x 
# -40.58333
