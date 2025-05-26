# Illustration of the Fisher information, observed information
# and large sample Normal approximation of the sampling distribution 
# of the maximum likelihood estimator (MLE)
# The data is simulated from the exponential distribution in the rate
# parameterization (not the one used in the course book) with parameter
# lambda

# Try first with n = 10 (no good approx), then n = 100 and n = 500 for better
# and better approximations

n = 10       # sample size
nRep = 10000 # the number of datasets simulated from the sampling distribution
lambda = 3   # True population parameter that we just make up here
lambdaHats = rep(0, nRep) # vector for storing the MLEs for each dataset
# Each iteration of this loop simulates a dataset x and computes the MLE
for (i in 1:nRep){
  x = rexp(n, rate = lambda)
  lambdaHats[i] = 1/mean(x)
}
hist(lambdaHats, 50, freq = FALSE) # Plot histogram of the MLEs

# Large sample normal approximation based in the Fisher information
# In large samples lambdaHat approx N(lambda, 1/I)
I = n/lambda^2
lambdaGrid = seq(0.001, 15, length = 1000) # lambda values for plot of normal density
pdf_theo = dnorm(lambdaGrid, mean = lambda, sd = sqrt(1/I))
lines(lambdaGrid, pdf_theo, col = "steelblue", lwd = 2)

# Large sample normal approximation based in the observed information
# In large samples lambdaHat approx N(lambda, 1/J)
x = rexp(n, rate = lambda) # simulate a single dataset. This is the single dataset
                           # that you would have in real life.
lambdaHat = 1 / mean(x)   # Compute the MLE for this dataset
J = n/lambdaHat^2         # Observed information

pdf_obs = dnorm(lambdaGrid, mean = lambda, sd = sqrt(1/J))
lines(lambdaGrid, pdf_obs, col = "indianred", lwd = 2)

