#######################
# server.R
# 


# load up required libraries
library(shiny) # always required for Shiny apps
# library(scales) 
# library(fdrtool)

# absolute path for running on local computer
source("W:/teehta/David G/Presentations and posters/R user presentation Feb2018/FebPresentation/ShinyFiles/master.R")
source("W:/teehta/David G/Presentations and posters/R user presentation Feb2018/FebPresentation/ShinyFiles/otherFile.R")


# relative paths for publishing in shinyapps.io
# source("master.R", local = TRUE)
# source("otherFile.R", local = TRUE)


shinyServer(function(input, output) {
  
  # Create a "managed state variable" (i.e. a Shiny reactive list) which stores the values required for reporting the results to the user
  # (for an intro to managed state variables see 1:22:46 in R studio Shiny toutorial https://shiny.rstudio.com/tutorial/ )
  ShinyResults <- reactiveValues()
  
  # input initial values to reduce errors
  ShinyResults$output1 <- NA
  ShinyResults$output2 <- NA
  ShinyResults$plotData <- 0
  
  # ACTION BUTTON: when this is pressed by the user the master() function will run
  ##########################
  
  observeEvent(input$run, {
    
    # a list which holds the results of the appropriate analysis
    resultsHolder <- reactive({
      # the master function takes all inputs, runs the appropriate model and returns a list of the results
      master(
        input1 = input$input1,
        input2 = input$input2
        # add other inputs in a similar way
        
      )
    })
    
    # assign results from master() function to ShinyResults via resultsHolder()
    ShinyResults$output1 <- resultsHolder()$output1
    ShinyResults$output2 <- resultsHolder()$output2
    ShinyResults$plotData <- resultsHolder()$plotData
    
  }) # end observe event expression
  
  
  # Create conditional text segments for reporting result
  ###########################
  
  # Headline results and overview
  ########
  
  # text explaining results
  output$resultsText1 <- renderText({
    paste("Given an input 1 value of",input$input1,
          "the first model result is",ShinyResults$output1, 
          "and the second model result is", ShinyResults$output2
          
    ) 
  })
  
  # plot output
  output$resultsPlot1 <- renderPlot({
    plot(ShinyResults$plotData,
         main = "Results",
         xlim = c(-10, 10),
         ylim = c(-10, 10))
  })
  
})

