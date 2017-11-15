# url <- "https://raw.githubusercontent.com/songsqian/eesR/master/R/Data/WCA2TP.csv"
# wca2tp <- read.csv("https://raw.githubusercontent.com/songsqian/eesR/master/R/Data/WCA2TP.csv", header=T)
# wca2tp$TP <- 1000 * wca2tp$RESULT
# TP.reference <- wca2tp[wca2tp$Type == "R", ]
# everglades <- data.frame("logTP" = log(TP.reference$TP), 
#                         "year" = as.factor(TP.reference$Year))
# write.csv(everglades, file = "everglades.csv", row.names = FALSE)

# Description: TBD.

# Load the data
everglades <- read.csv(file.choose(), header = TRUE)

# View the data
head(everglades)

# Boxplots
boxplot(logTP ~ year, data = everglades, notch = TRUE)
# boxplot(exp(logTP) ~ year, data = everglades, notch = TRUE)

# Look at sample means by year
by(everglades$logTP, INDICES = everglades$year, FUN = mean)

# ANOVA
owa <- aov(logTP ~ year, data = everglades)

# Print a summary of the ANOVA results
summary(owa)

# Model diagnostic plots
par(mfrow = c(2, 2))
plot(owa)

# Look at pairwise comparisons
pwc <- TukeyHSD(owa)
par(mfrow = c(1, 1), mar = c(5, 6, 4, 2) + 0.1)
plot(pwc, las = 1)
