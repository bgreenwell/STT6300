# Plot an exponential distribution with rate parameter lambda = 4
x <- seq(from = 0, to = 1.25, length = 500)
y <- dexp(x, rate = 4)
plot(x, y, type = "l", ylim = c(0, 12), lwd = 2)

# Plot the (true) mean of this distribution
abline(v = 1/4, lty = 2)

simFun <- function(n, col = "black") {
  lines(density(replicate(100000, {
    mean(rexp(n = n, rate = 4))
  })), lwd = 2, col = col)
}

# Look at the sampling distribution of the sample mean for various sample sizes
simFun(n = 2, col = "red3")
simFun(n = 10, col = "blue3")
simFun(n = 50, col = "green3")
