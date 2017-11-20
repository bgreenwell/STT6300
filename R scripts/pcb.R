# Example: A study was done on the liver PCB concentration in Black Guillemot 
# birds in Canada at three different sites: a reference site, a nearby island, 
# and the beach. Boxplots of the PCB concentrations shows skewness for the 
# birds at the three sites. The shape of the boxplots indicate strongly skewed 
# distributions to the right which is quite common for data on concentrations of 
# toxins. Because the data is strongly skewed, a log-transformed data was used. 
# The goal of the study will be to compare the mean log-PCB lipid concentration 
# in the birds at the three sites. The statistical inference begins with testing 
# to see if there is any difference on average between the log(PCB) 
# concentrations at the three sites. The boxplot in Figure 2 makes it quite 
# clear that the average log(PCB) values differ between the three sites. We 
# shall show how to formally test this. 
#
# Note that this data is observational, not experimental. That is, the data were 
# collected by observing the birds at the three sites. In an experiment, the 
# experimenter would assign units at randomly to the different treatments (i.e. 
# levels of the factor in this case). Because the birds are observed at each 
# site and not placed there, this is observational data, not experimental data.

# Load the data
pcb <- read.csv(file.choose(), header = TRUE)

# Look at first 10 observations
head(pcb, n = 10)

# Boxplot of PCB lipid concentration by site
boxplot(lipid ~ site, data = pcb)

# Boxplot of log-PCB lipid concentration by site
boxplot(log(lipid) ~ site, data = pcb)
# points(log(lipid) ~ site, data = pcb)

# Compute sample means
by(log(pcb$lipid), INDICES = pcb$site, FUN = mean)

# Test for equality of means using an ANOVA
pcb.aov <- aov(log(lipid) ~ site, data = pcb)
summary(pcb.aov)
par(mfrow = c(1, 2))
plot(pcb.aov, which = 1:2)

# As a linear model
pcb.lm <- lm(log(lipid) ~ site, data = pcb)
summary(pcb.lm)
