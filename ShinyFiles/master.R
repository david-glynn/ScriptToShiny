############
# master function
# wrapper function for all functions used
# takes all reacitive inputs from ui.R
# uses the user input to run the appropriate function

# source all R scripts required for use in master function 
# the definition of function1 and function2 here
# (relative address used here - this is required for publishing)

source("otherFile.R", local = TRUE)


# define master function
master <- function(
  input1,
  input2
  # ...all other inputs
  
  ){
  
  
  # RUN function1 if input1 >= 1
  if(input1 >= 1){
    
    # save results from function1 in masterOutput
    masterOutput <- function1(input2 
                              #... other inputs
                              )
    return(masterOutput) # the master function will return this output list if input1 > 0
  }
  
  
  # RUN function2 if input1 < 1
  if(input1 < 1){
    
    # save results from function1 in masterOutput
    masterOutput <- function2(input2
                              #... other inputs
                              )
    return(masterOutput) # the master function will return this output list if input1 < 0
  }
  
  
  # RUN function3 if... similar format
  
} 


# test master() function
# master(0, 2)
