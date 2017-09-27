# Function to plot the probability mass function of a binomial distribution with
# parameters n (the number of independent trials) and p (the probability of
# success within each trial). There is also the option to overlay a normal
# approximation to the binomial.
plotBinom <- function(n, p, plot.normal = FALSE, ...) {
  x <- 0:n
  prob <- dbinom(x, size = n, prob = p)
  plot(x, prob, type = "h", ...)
  points(x, prob, pch = 19)
  if (plot.normal) {
    xx <- seq(from = 0, to = n, length = 500)
    yy <- dnorm(xx, mean = n * p, sd = sqrt(n * p * (1- p)))
    lines(xx, yy, col = "red", lwd = 2)
  }
}
