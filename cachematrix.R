## Used the previos versions of the provided functions and changed a few thing as per the assignment request
## for the first one, I adapted it to process a Matrix instead of a vector, also changed the mean finction for inverse

## Based on the original provided makeVector and cacheMean functions

makeCacheMatrix <- function(x = matrix()) { # adapted the function in order to get a matrix as input
  i <- NULL                                 # for clarity purposes redefined variable "m" for "i" to match the purpose "(i)nverse
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse # instead of setting the mean we are now using the inverse function
  getinverse <- function() i                    # same as above, getting inverse of the matrix
  list(set = set,
       get = get,
       setinverse = setinverse, # Here, also made changes to switch from mean to inverse function
       getinverse = getinverse) # similar to above line, adapted to inverse the matrix
}


## Made a few modifications to the original provided cacheMean function in order to retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
 i <- x$getinverse() # made changes here to get inverse and assign to "i"
  if (!is.null(i)) { # 
          message("getting cached data")
          return(i)
  }
  data <- x$get()
  i <- solve(data, ...) # also changed this in order to use solve as per ?solve documentation (not quite sure if this works fine though
  x$setinverse(i)  # also made changes here to adapt the functio to inverse the matrix (again, not quite sure how this works!
  i
}        
}
