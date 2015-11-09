library(shiny)
library(boot)

beta <- function(formula, data, indices) {
  d <- data[indices,] # permite seleccionar la muestra
  regMod <- lm(formula, data=d)
  return(coef(regMod))
} 

x <- function(...){
  boot(data=mtcars, statistic=beta, 
                   R=1000, formula=mpg~wt+disp)
}


shinyServer(
  function(input, output) {
    
    output$distPlot <- renderPlot({
      
    })
})

