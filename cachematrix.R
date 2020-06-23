## Put comments here that give an overall description of what your
## functions do


## The original matrix will be stored in 'matrix_' its inverse in 'matrix_inverse'.
## I declare my original matrix inside the function it could be out but for this case 
## I prefered in that way.

makeCacheMatrix <- function(matrix_ = matrix(), y) {
      matrix_inverse <- NULL #inverse
      set <- function() {
        matrix_ <<- y
        matrix_inverse <<- NULL
      } 
      
      get <- function() matrix_
      setInverse <- function(inverse_) matrix_inverse  <<- inverse_
      getInverse <- function() matrix_inverse
      
      list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## This function receives what 'makeCacheMatrix' returns and compute the response.
## Also, I store the original matrix to compare in the 'if' statement.


cacheSolve <- function(matrix_) {
    matrix_inverse2 <- matrix_$getInverse()
    matrix2  <- matrix_$get()
    original2 <- original_ 
    
    if(!is.null(matrix_inverse2)){
      if(identical(matrix2, original2)){
        message("Getting data matrix's inverse")
        return (matrix_inverse2)
      }
    }
    
    data <- matrix_$get()
    matrix_inverse2 <- solve(data)
    matrix_$setInverse(matrix_inverse2)
    message('Computing the inverse')
    matrix_inverse2
        
}

## To check the two possible options:
## First, run the whole script. You will see the message 'Computing the inverse'
## Second, run the last line of this script 'cacheSolve(matrix_return)'. 
## And you will see the message 'Getting data matrix's inverse'.

original_ <<- matrix(1:4, nrow=2, ncol=2) #original
matrix_return <- makeCacheMatrix(original_)
cacheSolve(matrix_return)





