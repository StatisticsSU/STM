# Function that uses gradient ascent to maximize the function f(x) with
# first derivative function (gradient) fprime = f'(x)
gradDescentOpt <- function(f, fprime, x0, learnrate = 0.01, tol = 10^-8, maxiter = 1000){
  iter = 0        # counter for the iterations
  xopt = x0       # start at the initial value x0
  while (abs(fprime(xopt)) > tol && iter < maxiter){
    xopt = xopt + learnrate * fprime(xopt)
    iter = iter + 1
  }
  return(xopt)
} 

f <- function(x){1 + 2*x^2 - 0.5*x^3}
fprime = function(x){4*x - 1.5*x^2}

# Plot the function to see things visually
xgrid = seq(-5, 5, length = 1000)
plot(xgrid, f(xgrid), type = "l", lwd = 3, xlab = "x", ylab = "f(x)")

# Run gradient asscent with initial value x0 = 5
x0 = 5
learnrate = 0.1
xopt = gradDescentOpt(f, fprime, x0, learnrate = learnrate)
message(paste("With initial value x0 = ", x0, " the optimum is at x = ", xopt))
abline(v = x0, col = "red")
points(xopt, f(xopt), pch = 19, cex = 1.5, col = "red")

# Run gradient asscent with initial value x0 = -1
x0 = -1
learnrate = 0.1
xopt = gradDescentOpt(f, fprime, x0, learnrate = learnrate)
message(paste("With initial value x0 = ", x0, " the optimum is at x = ", xopt))
abline(v = x0, col = "blue")
points(xopt, f(xopt), pch = 19, cex = 1.5, col = "blue")

