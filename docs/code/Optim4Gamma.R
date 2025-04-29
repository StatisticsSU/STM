# IID GAMMA MODEL - MAXIMUM LIKELIHOOD ESTIMATE USING OPTIM

# This is an example with two parameters

# Simulate n data observations from a gamma distribution with alpha = 4 and beta_ = 2
n = 100 
alpha = 4
beta_ = 2 # beta is the Beta function in R, so best to not use that variable name
data = rgamma(n, alpha, beta_) # vector with n elements

# Function that computes the log-likelihood for given data and parameter value
# Note that optim requires the FIRST argument of the log-likelihood to be a vector 
# containing all model parameters. Inside the function, you can unpack alpha and beta_
logLikGamma <- function(param, data){
  alpha = param[1] 
  beta_ = param[2]
  logLik = sum(dgamma(data, alpha, beta_, log = TRUE)) # use log = TRUE to get log probabilities
  return(logLik)
}

# Test the function on a few values to see if it works and makes sense:
logLikGamma(c(2,3), data) # this computes the log-likelihood at alpha = 2, beta = 3
logLikGamma(c(1,5), data) 


# Now we use the built-in optim function to maximize our log-likelihood function
initVal = c(3,3) # This is the first guess in the algorithm, now a vector
optRes <- optim(initVal, logLikGamma, gr = NULL, data, 
                method = c("L-BFGS-B"), 
                control = list(fnscale = -1), 
                hessian = TRUE,
                lower = c(0,0)) # Note lower is a vector, since parameter is a vector
optRes$par          # maximizer
optRes$value        # function value at the maximum 
optRes$hessian      # matrix of second derivatives of the log-likelihood
J = -optRes$hessian # this is the observed information

# the matrix inverse of J is the covariance matrix of the ML estimator
covML = solve(J)
# the diagonal elements of this matrix are the variances.
varML = diag(covML)
# so taking the square roots gives the standard deviations:
stdML = sqrt(varML)
stdML
