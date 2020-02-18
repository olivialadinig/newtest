#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Prediction of diamond prices"),
    
    # Sidebar with options selectors 
    sidebarLayout(
        sidebarPanel(
            helpText("This app predicts the price of a diamond based on multiple characteristics."),
            h3(helpText("Please select all known features:")),
            numericInput("carat", label = h4("Carats"), step = 0.1, value = 1),
            selectInput("color", label = h4("Color"), 
                        choices = list("D" = "D", "E" = "E",
                                       "F" = "F", "G" ="G",
                                       "H" = "H", "I" = "I",
                                       "J" = "J")),
            selectInput("clarity", label = h4("Clarity"), 
                        choices = list("I1" = "I1", "SI2" = "SI2",
                                       "SI1" = "SI1", "VS2" = "VS2", "VS1" = "VS1",
                                       "VVS2" = "VVS2", "VVS1" = "VVS1", "IF" = "IF" )),
            selectInput("cut", label = h4("Cut"), 
                        choices = list("Fair" = "Fair", "Good" = "^Good",
                                       "Very Good" = "Very Good", "Premium" = "Premium",
                                       "Ideal" = "Ideal")),
        ),
        
        # Show the price of a diamond
        mainPanel(
            h4("Predicted value of this diamond is:"),
            h3(textOutput("result"))
        )
    )
))
