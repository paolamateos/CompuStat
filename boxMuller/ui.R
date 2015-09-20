library(shiny)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  #r
  # Application title
  titlePanel("Box Muller"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("X",
                  "X:",
                  min = 1,
                  max = 4000,
                  value = 30),
      
      
      sliderInput("Y",
                  "Y:",
                  min = 1,
                  max = 4000,
                  value = 30)
      
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h1("Box Muller Method"),
      tabsetPanel(
        tabPanel("X",plotOutput("distPlot"))
      #plotOutput("distPlot")
    ))
    )
  
))