# ui.R - BMI calculator
#
# AUTHOR
# H. Barrientos
#
# DATE
# 2016-06-24
#
# DESCRIPTION
# This app calculates a person's Body Mass Index, also known as BMI, and visually 
# reports it to the user via an attention-catching GoogleVis Gauge. The gauge is
# preset with using three colors and BMI value ranges reported in several medical 
# websites. 
#
# There are two sliders for user input: one for height in centimeters, and another 
# one for weight in kilograms. These sliders have been preset with value ranges for 
# adult persons. The user just needs to select the desired values, and the app will 
# respond immediately. In addition to the colors and BMI index shown by the gauge, 
# a documentation table is also presented to the user containing the BMI value ranges 
# and the corresponding health condition for each range.
#
# Health condition indicator colors: GREEN - normal weight; AMBER - overweight; RED - obese.
# Height slider range: 100 - 250 cm.
# Weight slider range: 40 - 250 kg.

# Load required libraries
library(shiny)

# User interface texts
appTitle <- "BMI Calculator"
appOwner <- "A free service by The Health Corner"

callToAction_1 <- "Stop! Take a minute to check your health risk by calculating your Body Mass Index, or BMI."
callToAction_2 <- "Simply move the sliders to indicate your height and weight, and compare the result against the gauge indicator and the BMI table."

# Slider values
heightSliderLabel <- "Height in cm:"
weightSliderLabel <- "Weight in kg:"

heightSliderMin    <- 100
heightSliderMax    <- 210
heightSliderPreset <- 170
  
weightSliderMin    <- 40
weightSliderMax    <- 250
weightSliderPreset <- 65
  
# BMI documentation table
bmiInfoTable <- 
"<div align='left'>
  <strong><font size='3'>BMI TABLE</font></strong>
    <table width='100%'>
      <TR>
        <TD width='20%'><strong>Value</strong></TD>
        <TD width='35%'><strong>Condition</strong></TD>
        <TD width='45%'><strong>Health Risk</strong></TD>
      </TR>
      <TR>
        <TD width='20%'>19 - 24</TD>
        <TD width='35%'><strong><font color='green'>Normal weight</font-color></strong></TD>
        <TD width='45%'>Low</TD>
      </TR>
      <TR>
        <TD width='20%'>25 - 29</TD>
        <TD width='35%'><strong><font color='orange'>Overweight</font-color></strong></TD>
        <TD width='45%'>Medium</TD>
      </TR>
      <TR>
        <TD width='20%'>30 - 50</TD>
        <TD width='35%'><strong><font color='red'>Obese</font-color></strong></TD>
        <TD width='45%'>High</TD>
    </TR>
  </table>
</div>"

# Object ids
heightObjectId <- "height"
weightObjectId <- "weight"
outputObjectId <- "bmiGauge"

shinyUI(
  
  fluidPage(
    
    # Provide the title for the app, and the "app owner" name
    titlePanel(appTitle),
    h3(appOwner),
    
    # Create a sidebar with the sliders and the BMI table
    sidebarLayout(
      
      sidebarPanel(
        
        div(callToAction_1),
        br(),
        div(callToAction_2),
        br(),
      
        sliderInput(heightObjectId,
                    heightSliderLabel,
                    min   = heightSliderMin,
                    max   = heightSliderMax,
                    value = heightSliderPreset),
      
        sliderInput(weightObjectId,
                    weightSliderLabel,
                    min   = weightSliderMin,
                    max   = weightSliderMax,
                    value = weightSliderPreset),
      
        br(),
        HTML(bmiInfoTable)
        
      ),  # END sidebarPanel
      
      # Call the output function
      mainPanel(uiOutput(outputObjectId))
      
    )  # END sidebarLayout
  
  )  # END fluidPage
  
)  # END shinyUI
