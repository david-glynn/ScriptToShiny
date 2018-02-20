# this file contains definitions of all the functions used in the app


# define function 1
function1 <- function(input2){
  
  output1 <- input2*1
  output2 <- input2*2
  plotData <- rnorm(4000, input2, 2)
  # returns a list 
  results <- list(output1 = output1, output2 = output2, plotData = plotData)
  
  return(results)
  
}


# define function 2
function2 <- function(input2){
  
  output1 <- input2*2
  output2 <- input2*4
  plotData <- rnorm(200, input2,1)
  # returns a list
  results <- list(output1 = output1, output2 = output2, plotData = plotData)
  
  return(results)
  
}


