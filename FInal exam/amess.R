# 22 bypass-patients were randomly divided into 3 treatment groups A, B, and C 
# (different respiration). Interest was in whether or not the average amount of 
# folic acid in red blood cells after 24 hours differed between the three 
# treatment groups.
rcf <- c(243, 251, 275, 291, 347, 354, 380, 392, 
         206, 210, 226, 249, 255, 273, 285, 295, 309, 
         241, 258, 270, 293, 328)
trt <- factor(rep(c("A", "B", "C"), times = c(8, 9, 5)))

# Basic plots
par(mfrow = c(1, 2))
boxplot(rcf ~ trt, xlab = "Treatment", ylab = "Red cell folate", 
        main = "Boxplots")
boxplot(rcf ~ trt, border = "white", xlab = "Treatment", 
        ylab = "Red cell folate", main = "Raw data")
points(rcf ~ trt)

# One-way ANOVA
fit <- aov(rcf ~ trt)
summary(fit)

# Paired comparisons using Tukey's HSD method
pc <- TukeyHSD(fit, conf.level = 0.95)
print(pc)
plot(pc)

# Residual diagnostic plots
par(mfrow = c(1, 2))
plot(fit, which = 1:2)
