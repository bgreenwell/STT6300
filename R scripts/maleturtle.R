# Carapace length
length <- c(93, 94, 96, 101, 102, 103, 104, 106, 107, 112, 113, 114, 116, 117, 
            117, 119, 120, 120, 121, 125, 127, 128, 131, 135)

# Carapce width
width <- c(74, 78, 80, 84, 85, 81, 83, 83, 82, 89, 88, 86, 90, 90, 91, 93, 89, 
           93, 95, 93, 96, 95, 95, 106)

# 99% Confidence interval for carapace length
t.test(length, conf.level = 0.99)$conf.int

# 99% Confidence interval for carapace width
t.test(width, conf.level = 0.99)$conf.int

# Scatterplot of carapace length versus carapace width
plot(length, width, xlab = "Carapace length (mm)", ylab = "Carapace width (mm)",
     pch = 19)

# Plot the associated confidence intervals for each variable
abline(v = t.test(length, conf.level = 0.99)$conf.int, lty = 2, col = "red2")
abline(h = t.test(width, conf.level = 0.99)$conf.int, lty = 2, col = "red2")

# Plot the point (107, 91.7)
points(x = 107, y = 91.7, pch = 19, col = "red2")
