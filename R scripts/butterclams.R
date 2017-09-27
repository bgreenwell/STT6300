# Load the data
butterclams <- read.csv(file.choose(), header = TRUE)

# Print first few rows
head(butterclams)

# Sample mean
mean(butterclams$ratio)

# Sample median
median(butterclams$ratio)

# Sample standard deviation
sd(butterclams$ratio)
sqrt(var(butterclams$ratio))  # should be equivalent

# Histogram
par(mfrow = c(1, 2))
hist(butterclams$ratio, xlab = "Ratio", main = "")
boxplot(butterclams$ratio, ylab = "Ratio")

# You can extract flagged outliers as well
out <- boxplot(butterclams$ratio, plot = FALSE)
out$out
which(butterclams$ratio == out$out)  # the sixth observation may be an outlier

x <- butterclams$ratio[6L]
(x - mean(butterclams$ratio)) / sd(butterclams$ratio)
