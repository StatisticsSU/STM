# Function that uses Newton-Raphson to optimize the function f(x) with
# first derivative function fprime = f'(x) and 
# second derivative function fbiss = f''(x)
newtonOpt <- function(f, fprime, fbiss, x0, tol = 10^-8, maxiter = 1000){
  iter = 0        # counter for the iterations
  xopt = x0       # start at the initial value x0
  while (abs(fprime(xopt)) > tol && iter < maxiter){
    xopt = xopt - fprime(xopt)/fbiss(xopt)
    iter = iter + 1
  }
  return(xopt)
} 

f <- function(x){1 + 2*x^2 - 0.5*x^3}
fprime = function(x){4*x - 1.5*x^2}
fbiss = function(x){4 - 3*x}

# Plot the function to see things visually
xgrid = seq(-5, 5, length = 1000)
plot(xgrid, f(xgrid), type = "l", lwd = 3, xlab = "x", ylab = "f(x)")

# Run Newton-Raphson with initial value x0 = 5
x0 = 5
xopt = newtonOpt(f, fprime, fbiss, x0)
message(paste("With initial value x0 = ", x0, " the optimum is at x = ", xopt))
abline(v = x0, col = "red")
points(xopt, f(xopt), pch = 19, cex = 1.5, col = "red")

# Run Newton-Raphson with initial value x0 = -1
x0 = -1
xopt = newtonOpt(f, fprime, fbiss, x0)
message(paste("With initial value x0 = ", x0, " the optimum is at x = ", xopt))
abline(v = x0, col = "blue")
points(xopt, f(xopt), pch = 19, cex = 1.5, col = "blue")

