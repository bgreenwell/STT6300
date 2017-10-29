# Systolic blood pressure before taking captorpil
before <- c(210, 169, 187, 160, 167, 176, 185, 206, 
            173, 146, 174, 201, 198, 148, 154)

# Systolic blood pressure after taking captorpil
after <- c(201, 165, 166, 157, 147, 145, 168, 180, 
           147, 136, 151, 168, 179, 129, 131)

# Scatterplot of before and after measurements
plot(before, after, pch = 19)

plot(before, ylim = range(c(before, after)))
points(after, pch = 19)
legend("bottomleft", legend = c("before", "after"), pch = c(1, 19),
       inset = 0.01)

# Paired t-test
t.test(x = after, 
       y = before,
       alternative = "less",
       paired = TRUE,         # paired t-test
       conf.level = 0.95)

# Confidence interval requires two-sided test
t.test(x = after, 
       y = before,
       alternative = "two.sided",
       paired = TRUE,         # paired t-test
       conf.level = 0.95)

# Equivalent to a one-sample t-test on the differences
t.test(after - before)
