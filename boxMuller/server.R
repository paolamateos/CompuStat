#Tarea 2 Box Muller
#Método de generación de pares de números aleatorios indep, con distribución
#Normal estándar

#Generamos dos v.a.i. uniformemente distribuidas en (0,1] y utilizamos el 
#método polar para transformar las variables
library(shiny)

<<<<<<< HEAD
=======
#u1 <- runif(1)
#u2 <- runif(1)
>>>>>>> cfbd129ad4369aa94d5a76877754c83af83a8743

x <- function(...) {
  u1 <- runif(1)
  u2 <- runif(1)
  sqrt(-2*log(u2))*cos(2*pi*u1)}

y <- function(...){
<<<<<<< HEAD
  u3 <- runif(1)
  u4 <- runif(1)
  sqrt(-2*log(u4))*sin(2*pi*u3)
=======
  u1 <- runif(1)
  u2 <- runif(1)
  sqrt(-2*log(u2))*sin(2*pi*u1)
>>>>>>> cfbd129ad4369aa94d5a76877754c83af83a8743
    }

shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
 
  output$distPlot <- renderPlot({
    xg <- sapply(numeric(input$X),x)
    yg <-sapply(numeric(input$Y),y)
    # draw the histogram with the specified number of bins
<<<<<<< HEAD
    hist(xg, col = 'skyblue', border = 'white')
    
  })
 
=======
    hist(yg, col = 'skyblue', border = 'white')
    
  })
>>>>>>> cfbd129ad4369aa94d5a76877754c83af83a8743
})