# Simulate exponential regression data
n = 100
p = 3 
X = matrix(rnorm(n*p), n, p)
X = cbind(1,X)
betaVect = c(1, 1, 0.5, -1)
mu = exp( X %*% betaVect ) # X %*% betaVect give vector, element i, x_i'*betaVect
y = rexp(n, rate = 1/mu)

# Plot features against log(y), since mean is exp(x'beta)
plot(X[,2], log(y), pch = 19)
plot(X[,3], log(y), pch = 19)
plot(X[,4], log(y), pch = 19)

logLikExpReg = function(betaVect, y, X){
  mu = exp(X %*% betaVect)
  logLik = sum(dexp(y, rate = 1/mu, log = TRUE))
  return(logLik)
}

# Now we find the MLE
lmfit = lm(log(y) ~ 0 + X)
roughBetaHat = lmfit$coefficients
initVal = roughBetaHat
optRes = optim(initVal, logLikExpReg, gr = NULL, y, X, method = "BFGS",
               control = list(fnscale = -1), hessian = TRUE)
betaHat = optRes$par
optRes$par

optRes$hessian # matrix 4 x 4 of second partial derivates
covBetaHat = -solve(optRes$hessian) # -inv(Hessian)
varianceBetaHat = diag(covBetaHat)
stdBetaHat = sqrt(varianceBetaHat)
betaHat - 1.96*stdBetaHat
betaHat + 1.96*stdBetaHat

