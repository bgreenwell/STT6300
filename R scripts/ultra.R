# Load the data set
ultra <- read.csv(file = file.choose(), header = TRUE)

# Create a new variable called time; use $ to access the different columns
ultra$time <- ultra$hours * 60 + ultra$minutes + ultra$seconds / 60

# Recode gender to somethinf more meaningful
ultra$gender <- ifelse(ultra$gender == 0, "male", "female")

# Print the first 6 rows
head(ultra)

# Print a summary of the the data set
summary(ultra)

# To compute the sample variance/standard deviation use the var/sd functions. 
# For example, to get the sample variance for the variable age, use:
var(ultra$age)

# To get the sample variance for each variable use
sapply(ultra, FUN = var)

# Subset the data by gender
males <- ultra[ultra$gender == "male", ]
females <- ultra[ultra$gender == "female", ]

# Compute the mean time for males
cat("The average time for males was", mean(males$time), "minutes \n")

# Compute the standard deviation of male times
cat("The standard deviation for male times was", sd(males$time), "minutes \n")

# Compute the mean time for females
cat("The average time for females was", mean(females$time), "minutes \n")

# Compute the standard deviation of female times
cat("The standard deviation for female times was", sd(females$time), "minutes \n")

# Histograms of running times for males and females
par(mfrow = c(1, 2))
hist(males$time, main = "Males", xlab = "Running time")
hist(females$time, main = "Females", xlab = "Running time")

# Boxplots of running times for males and females
boxplot(time ~ gender, data = ultra, notch = TRUE)

# Notice the notches in the boxplot that are included since I specified
# notch = TRUE. Read the help file for this function and read about how these
# notches can be useful for comparing groups
?boxplot

#
# Alternative approach using the lattice package that comes with R
#

# Histogram and boxplot of time, stratified by gender
library(lattice)
histogram(~ time | gender, data = ultra, xlab = "Running time")
bwplot(~ time | gender, data = ultra)
