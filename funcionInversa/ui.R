library(shiny)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Simular exponencial"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("nsim",
                  "Number of simulations:",
                  min = 1,
                  max = 5000,
                  value = 300),
    numericInput("lambda",
                "Parameter of the exponential",
                value = 2)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))