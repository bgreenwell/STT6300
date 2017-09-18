# Load the data
bodytemp <- read.csv(file.choose(), header = TRUE)

# Convert gender to something more meaningful
bodytemp$gender <- ifelse(bodytemp$gender == 1, "male", "female")

# Compute the average pulse rates for men and women
males <- subset(bodytemp, gender == "male")
females <- subset(bodytemp, gender == "female")
mean(males$pulse)
sd(males$pulse)
mean(females$pulse)
sd(females$pulse)

# Boxplot of pulse rate for men vs. women
boxplot(pulse ~ gender, data = bodytemp, notch = TRUE)
