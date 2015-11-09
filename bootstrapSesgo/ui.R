
shinyUI(fluidPage(
  titlePanel("Bootstrap"),
  
  sidebarLayout(position = "right",
                sidebarPanel( "sidebar panel"),
               
                          
                
       sliderInput("Repetitions", 
          label = "Number of Repetitions:",
          min = 0, max = 1000, value = c(0, 1000))
  )
))