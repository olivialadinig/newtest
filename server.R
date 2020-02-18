#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
# select columns to be used in the analysis
diam <- diamonds[,c(1:4,7)]
# Define server logic 
shinyServer(function(input, output) {
    output$result <- renderText({
        # renders the text for the prediction
        fit <- lm( price~., diam)
        pred <- predict(fit, newdata = data.frame(carat = input$carat,
                                                  cut = input$cut,
                                                  color = input$color,
                                                  clarity = input$clarity))
        res <- paste(round(pred, digits = 0), "$")
        res
    })
    
})
