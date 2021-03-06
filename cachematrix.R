## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  ## SETTER
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  ## GETTTER
  get <- function() x
  
  ## For Inverse
  setInverse <- function(inverse) m <<- inverse
  getInverse <- function() m
  
  ##creat a list of operations
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function
## This function computes the inverse of the special
## "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated
## (and the matrix has not changed), then cacheSolve
## should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  ## Check cached or not
  if(!is.null(m)) {
    message("getting cached data")
    ## Return the cached version
    return(m)
  }
  ## Get the matrix and compute the inverse
  data <- x$get()
  m <- solve(data)
  ## Set the cache
  x$setInverse(m)
  ##
  m
}
