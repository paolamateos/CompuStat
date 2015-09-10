#EJEMPLO CLASE 09 DE SEPT
#NOMBRE TAREA ImportanceSampling

install.packages('plyr')

require(plyr)

mc.intervals <- function(Phi, N, X.dens = runif, alpha = 0.05) {
# - N: is a vector which contains diffetent sample sizes for our estimate
# - alpha: determines the confidence intervals of level 1-alpha
# - sample: must be a function from which to draw N trials of X.
# - Phi: is used sum-{i = 1}**N(phi(x_i))= E(phi(x_i)) ~ int phi(x)/f_X(x)dx

 
  
  # Loop part, run for each element of N
  results.list <- lapply(N, function(nsim){
  #  MonteCarlo Steps  
    X <- sapply(FUN= X.dens, nsim) # N samples of the density of X.
    PhiX <- sapply(X, Phi) # Evaluate phi at each x_i
    estim <- mean(PhiX) # Estunate of int_A**b
    S2 <- var(PhiX) # Estunate of the variance of phi(X_i)
    quant <- qnorm(alpha/2, lower.tail = FALSE) #Right quantile for alpha/2
    int.upper <- estim + sqrt(S2/nsim)*quant #Upper confidence interval
    int.lower <- estim - sqrt(S2/nsim)*quant #Lower confidence Interval
    return (data.frame(N=nsim, Estimate = estim, LI = int.lower, UI = int.upper))
  })
  results.table <- ldply(results.list) # Assembels list in data.frame
  return(results.table)
}

#Me regresa una lista que dice N = q0,estimacion ## num N = 20...
#Cada elemento es un renglón que quiero de un data.frame
#con ldply los ensamblo (recivo lista y regreso data.frame)

#PRUEBA:
#set.seed(110104)
#Phi <- function(x) 2*sqrt(4-x^2)
#X.dens <- function(nsim) runif(nsim,0,2)
#N <- sequ(from=1000, to = 10000, by=1000)
#data <- mc.intervals(Phi = Phi, N=N, X.dens = X.dens)

