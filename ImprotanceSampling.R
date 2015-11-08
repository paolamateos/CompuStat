#tarea 3

# int de 0 a2 1/sqrt(2pi)exp(-x^2/2)df
# verdadero valores 
pnorm(2)-1/2

#opcion crudo
nsim <- 1000
U <- runif(nsim, 0,2)
phi <- function(x) 2*dnorm(x)
estim <- mean(phi(U))
plot(dnorm, xlim=c(0,2))

#opcion prioritaria
nsim <- 1000
#usamos método de función inversa
U <- runif(nsim, 0,1)
# exponencial(lambda=1) truncada a 0,2
x <- -log(1-(1-expm1(-2)+1)*U)
#la densidad de la exponencial truncada
fun <- function(X) dexp(x)/(1-expm1(-2)+1)
phi <- function(X) dnorm(x)/fun(x)
estim2 <- mean(phi(U))
pnorm(10) -1/2
hist(x)

#ejemplo

a <- 0 
b <- 1000
nsim <- 100

U <- runif(nsim,a,b)
mean((b-a)*dnorm(U))

#prioritario
U <- rexp(nsim, rate = 4)
mean(dnorm(U)/dexp(U))


