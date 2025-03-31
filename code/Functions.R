exp(1)
log10(1000)
log2(256)
2^8
log(exp(6.5))

square <- function(x){
  y = x^2
  return(y)
}
x = 4
y = square(x)

z = 4
y = square(z)
q = square(z)

y = f(x)

xGrid = seq(-5, 5, length = 1000)
plot(xGrid, exp(xGrid), type = "l")

xGrid = seq(0.01, 5, length = 1000)
plot(xGrid, log(xGrid), type = "l")

# Composite functions

# Inner function
h <- function(x){
  z = log(x)
  return(z)
}

# Outer function
g <- function(z){
  y = z^2
  return(y)
}

g(h(2)) # log(2) = 0.6931472 followed by (0.6931472)^2 


