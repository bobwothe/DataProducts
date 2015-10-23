library(shiny)

# UI
shinyUI(
  
  # Fluid Bootstrap layout
  fluidPage(    
    
    titlePanel("Windchill Calculator"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(

        
        sliderInput("wind",
                    "Enter windspeed in miles per hour:",
                    min = 0,
                    max = 80,
                    value = 10),
        
        numericInput("temp", "Enter temperature in Fahrenheit", 10,
                     min = -25, max = 50, step = 10),
        
        submitButton("Submit")
        
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("tempplot"), textOutput("text5"),
        verbatimTextOutput("text1"),verbatimTextOutput("text2"), 
        textOutput("text3")
      )
      
    ))
)