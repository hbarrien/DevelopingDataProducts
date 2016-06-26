# server.R - BMI calculator
#
# AUTHOR
# H. Barrientos
#
# DATE
# 2016-06-24
#
# DESCRIPTION
# Receives the input provided by the user in terms of height (in cm) and weight (in kg),
# calculates the Body Mass Index, stores the result in a dataframe that is passed as
# parameter to the GoogleVis Gauge display function, and renders the gauge with the BMI
# calculated value. The gauge's arm will also rotate to a colored section indicating the 
# user's health condition.

# Load the required libraries
library(shiny)
suppressPackageStartupMessages(library(googleVis))

# User interface texts
indexName <- "BMI"

# Gauge option values
gaugeMin <- 19
gaugeMax <- 50

gaugeGreenFrom  <- 19
gaugeGreenTo    <- 25
gaugeYellowFrom <- 25
gaugeYellowTo   <- 30
gaugeRedFrom    <- 30
gaugeRedTo      <- 50

# Create the output data frame. Initialize the first variable with the index's name 
bmidf      <- data.frame(1, 2)
bmidf[1,1] <- indexName

shinyServer(
  
  function(input, output) 
  {
      # This function receives the input from the user, calculates the BMI, stores this
      # result in the output dataframe, and returns the data frame
      calculateBMI <- function()
      {
          ht <- input$height
          wt <- input$weight
      
          bmi        <- wt / (ht / 100)^2
          bmidf[1,2] <- as.integer(bmi)
      
          bmidf
          
      }  # END calculateBMI
  
      # Render the GoogleVis gauge
      output$bmiGauge <- renderGvis(
      {
          gvisGauge(calculateBMI(), options=list(min=gaugeMin, max=gaugeMax, greenFrom=gaugeGreenFrom, greenTo=gaugeGreenTo, 
                                                 yellowFrom=gaugeYellowFrom, yellowTo=gaugeYellowTo, redFrom=gaugeRedFrom, 
                                                 redTo=gaugeRedTo))
        
      })  # END renderGvis
  
  }  # END funtion
  
)  # END shinyServer

