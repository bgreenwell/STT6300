# Sample from intake site
intake <- c(7.2, 7.5, 6.89, 6.95, 6.73, 7.25, 7.2, 6.85, 7.52, 7.01, 6.65, 7.55, 
            7.14, 7.45, 7.24, 7.75, 6.85, 6.5, 6.64, 7.19, 7.15, 7.21, 7.15, 
            7.3, 6.35)

# Sample from discharge site
discharge <- c(7.25, 7.23, 6.85, 7.07, 6.55, 7.43, 7.3, 6.9, 7.1, 6.95, 7.39, 
               6.54, 6.39, 6.08, 6.3, 6.35, 7.34, 6.7, 7.08, 7.09, 7.4, 6, 6.94, 
               5.95)

# Histograms and boxplots
par(mfrow = c(2, 2))
hist(intake)
hist(discharge)
boxplot(intake, discharge, names = c("Intake", "Discharge"))
boxplot(intake, discharge, names = c("Intake", "Discharge"), notch = TRUE)

# Check equal variance assumption
sd.intake <- sd(intake)
sd.discharge <- sd(discharge)
sd.discharge / sd.intake  # seems plausible

# Two-sample t-test assuming equal variances
t.test(intake, discharge, 
       alternative = "two.sided", 
       mu = 0,
       var.equal = TRUE,
       conf.level = 0.95)

# Two-sample t-test assuming unequal variances
t.test(intake, discharge, 
       alternative = "two.sided", 
       mu = 0,
       var.equal = FALSE,
       conf.level = 0.95)

# Test of our original (one-sided) hypothesis
t.test(intake, discharge, 
       alternative = "greater",  # H1: intake > discharge
       mu = 0,
       var.equal = FALSE,
       conf.level = 0.95)
