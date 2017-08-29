################################################################################
#
# Obtaining simplle summary statistics for the pelican eggshell data
#
################################################################################


################################################################################
# First, load the data
################################################################################

# If you don't want to specify the path to your data, then just use 
# file.choose()
path.to.data <- file.choose()

# Sicne the data are stored as a CSV, we can read them in using the read.csv()
# function. Setting the option `header = TRUE` tells R that the first row 
# contains the column names
eggshell <- read.csv(file = path.to.data, header = TRUE)

# Print the first six rows
head(eggshell)

# How many observations are there?
nrow(eggshell)

# How many columns/variables are there?
ncol(eggshell)

# nrow and ncol
dim(eggshell)


################################################################################
# Measures of location for the variable thickness
################################################################################

# Extract the variable (not necessary)
thickness <- eggshell$thickness

# The sample mean
mean(thickness)
mean(eggshell$thickness)  # equivalent

# The sample median
median(thickness)

# The mode is more difficults to obtain in R, but here is some code
most_freq <- function(x) {
  tab <- table(x)
  as.numeric(names(tab[which.max(tab)]))
}
most_freq(thickness)  # find the mode


################################################################################
# Measures of location for the variable thickness
################################################################################

# Range
range(thickness)  # actuall reports the min and max
diff(range(thickness))
max(thickness) - min(thickness)

# Sample variance
var(thickness)

# Sample standard deviation
sd(thickness)

# Interquartile range
IQR(thickness)

# Median absolute deviation
mad(thickness)  # this is what we defined as the MADN statistic
mad(thickness, constant = 1)
median(abs(thickness - median(thickness)))
