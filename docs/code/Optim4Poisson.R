# IID POISSON MODEL - MAXIMUM LIKELIHOOD ESTIMATE USING OPTIM

# Simulate n data observations from a Poisson distribution with lambda = 4
n = 50 
lambda = 4
data = rpois(n, lambda) # vector with n elements

# In this model we can derive the ML estimate, so we wouldn't really need 
# numerical optimization. The ML estimate is the sample mean:
mean(data)

# Function that computes the log-likelihood for given data and parameter value
logLikPois <- function(lambda, data){
  logLik = sum(dpois(data, lambda, log = TRUE)) # use log = TRUE to get log probabilities
  return(logLik)
}

# Test the function on a few values to see if it works and makes sense:
logLikPois(2, data) # this computes the log-likelihood at lambda = 2
logLikPois(4, data) 
logLikPois(5, data)

# Now we use the built-in optim function to maximize our log-likelihood function
initVal = c(3) # This is the first guess in the algorithm
optRes <- optim(initVal, logLikPois, gr = NULL, data, 
                method = c("L-BFGS-B"), 
                control = list(fnscale = -1), 
                hessian = TRUE,
                lower = 0) 
optRes$par          # maximizer, this should match with mean(data) in this model
optRes$value        # function value at maximum 
optRes$hessian      # second derivative - should be negative if (local) maximum
J = -optRes$hessian # this is the observed information

# The standard error (= standard deviation of the sampling distribution) of the 
# ML estimator is approximately:
stdML = sqrt(1/J) # 1/J is the variance, so sqrt of that gives the standard deviation


