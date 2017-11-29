# Fernicola and Roberts (Am J Cardiol. 1994 ) gave the data shown below for the 
# heart weight (grams) of a convenience sample of patients with previously 
# normal mitral valves prior to infective endocarditis. The patients were 
# classified by race (white and black) and by gender (male, female).

# Load required packages
library(lattice)

# Set up the data
sex <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         2, 2, 2, 2, 2, 2, 2, 2, 2, 2)
sex <- ifelse(sex == 1, "Male", "Female")
race <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 
          2, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2)
race <- ifelse(race == 1, "White", "Black")
wt <- c(280, 420, 340, 370, 390, 440, 510, 300, 480, 335, 715, 440, 620, 520, 
        600, 540, 345, 380, 270, 485, 500, 485, 620, 360, 205, 280, 195, 380, 
        200, 210, 390, 360, 320, 350)
heart <- data.frame(sex = sex, race = race, wt = wt)


# Boxplots
bwplot(wt ~ sex, data = heart)
bwplot(wt ~ race, data = heart)
bwplot(wt ~ sex | race, data = heart)

# Interaction plot
interaction.plot(sex, race, wt, type = "b", pch = 19)

# Install the car package
# install.packages("car")

# Two-way ANOVA w/ interaction
aov1 <- car::Anova(lm(wt ~ sex * race, data = heart), type = "II")
aov1
