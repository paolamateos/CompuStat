#tarea4 -.Corrección sesgo de Bootstrap
#Ejemplo (Copper Nockel Alloy)
install.packages(boot)

#nsim <- 1000
#sam[,1] <- runif(nsim, 0,1)

#sam[2,] <- [runif(nsim,0,2)]  
#sam  

# estadístico que será estimado con bootstrapp
library(boot)
beta <- function(formula, data, indices) {
  d <- data[indices,] # permite seleccionar la muestra
  regMod <- lm(formula, data=d)
  return(coef(regMod))
} 


?runif
resp <- boot(data=mtcars, statistic=beta, 
                R=1000, formula=mpg~wt+disp)
resp
plot(resp, index=1) # intercept 
plot(resp, index=2) # wt 
plot(resp, index=3) # disp
