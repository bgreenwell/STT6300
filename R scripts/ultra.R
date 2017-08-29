# Load required packages
library(lattice)

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

mean.time.male

# Histogram of time, stratified by gender
histogram(~ time | gender, data = ultra)
