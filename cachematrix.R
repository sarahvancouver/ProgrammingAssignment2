## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## this function creates a "special" matrix that can cache its inverse. The function enables to:
## - set the value of the matrix
## - get the value of the matrix
## - set the value of the mean
## - get the value of the mean
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function
## this function calculates the inverse of a matrix
## it will either get the inverse in the cache if it has been calculated before
## or calculate it and cache it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
  
}
