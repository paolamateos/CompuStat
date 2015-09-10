# TAREA 1-- Paola Mateos Ochoa
install.packages("shiny")
install.packages("random")

library(shiny)
library(random)

#rseq <- randomNumbers(n=10, min=1, max=10000)

LCG <- function(nsim, M = 2^32, a = 22695477, c = 1, seed = 118798){ 
  X = c(seed, numeric(nsim-1)) 
  # Preallocate space
  for(i in 1:(nsim-1)) X[i+1] <- ((a*X[i] + c)%% M)
  return(X/M)
  }
#rseq <- LCG(1000)
#head(rseq) 
#runExample("01_hello")

shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    x    <- LCG(input$nsim)
    lam <- input$lambda
    expf <- sapply(x,function(y){ -(1/lam)*log(1-y)})
    
    # draw the histogram with the specified number of bins
    hist(expf, col = 'darkgray', border = 'white')
    
  })
})