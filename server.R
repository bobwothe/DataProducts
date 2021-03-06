library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  
  output$tempplot <- renderPlot({
    wind2 <- input$wind^0.16 #wind variable in new formula
    wind3 <- input$wind^0.5 #wind in old formula
    Newwindchill <- 35.74+0.6215*input$temp-35.75*wind2+0.4275*input$temp*wind2
    Oldwindchill <- 0.0817*(3.71*wind3+5.81-0.25*input$wind)*(input$temp-91.4)+91.4
    Newwindchill <- round(Newwindchill,digits = 2)
    Oldwindchill <- round(Oldwindchill,digits = 2)
    temps <- c(Newwindchill,Oldwindchill)
    # Render a barplot
    barplot(temps, 
            main="Windchill by Calculation Method",
            names.arg = c("Since 2001","Before 2001"),
            ylab="Apparent Windchill",
            ylim = c(-100,75))
    abline (h = 0)
    abline(h = input$temp, lwd = 5, col = "red")
    text(x = 0.35, y = input$temp, pos = 3, col = "red", 
         labels = paste("Real Temp: ",input$temp))
  })
  
  output$text1 <- renderText({paste("Input wind is: ", input$wind, 
                                    "mph and Input Temp is: ",input$temp, "degrees Fahreneit")})
  
  output$text2 <- renderText({
    wind2 <- input$wind^0.16 #wind variable in new formula
    wind3 <- input$wind^0.5 #wind in old formula
    Newwindchill <- 35.74+0.6215*input$temp-35.75*wind2+0.4275*input$temp*wind2
    Oldwindchill <- 0.0817*(3.71*wind3+5.81-0.25*input$wind)*(input$temp-91.4)+91.4
    Newwindchill <- round(Newwindchill,digits = 2)
    Oldwindchill <- round(Oldwindchill,digits = 2)
    temps <- c(Newwindchill,Oldwindchill)
    
    paste("Windchill based on formula since 2001 is: ", temps[1], " and windchill based on formula before 2001 is: ", temps[2])
  })
  
  output$text5 <- renderText({"This app explained via Wikipedia: In November 
    2001, Canada, U.S. and the U.K. implemented a new wind chill index developed by scientists and medical experts on the Joint Action
    Group for Temperature Indices (JAG/TI). This model replaced the original calculation that was
    developed in the 1940s Adjust the slider and temperature input to get the predicted windchill by both the post- and pre-2001 formulas."
  })
  
  output$text3 <- renderText({paste("code at: ",
                                    "https://github.com/bobwothe/DataProducts")})
  
  })