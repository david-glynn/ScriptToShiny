################
# ui.R function
# controls what the user inputs and sees


library(shiny)

shinyUI(fluidPage(
  
  # heading
  h3("User inputs"),
  
  # action button
  actionButton("run", label = "Run analysis"),
  
  # user specified input1, input2, ...
  numericInput("input1", "Input 1", value = 0, min = 0, max = 2),
  numericInput("input2", "Input 2", value = 0, min = 0, max = 2),
  
  # results
  h3("Results"),
  
  textOutput("resultsText1"), # chunk of text composed in server.R script
  plotOutput("resultsPlot1")  # plot composed in server.R          
  
  )
  )



