# makeCacheMatrix and cacheSolve are made to cache
# the matrices inversion.
# 
# First you have to make the object
# by assigning makeCacheMatrix to a variable
# Then you can set the matrix by calling $set function.
#
# To calculate the inverse, call the cacheSolve() with the object
# as the argument.

makeCacheMatrix <- function(x = matrix()) {
    # Setting the variables
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    # Setter and getter
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    
    # Function listing and names
    list(
        set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse
    )
    
}

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    
    # Checking whether if the "m" is NULL or not
    if(!is.null(m)) {
        message("Getting cached inverse data")
        return(m)
    }
    
    data <- x$get()
    
    # Calculating the inverse
    m <- solve(data, ...)
    x$setinverse(m)
    m
}

# Object init and function testing
# Uncomment to test
#
# cached <- makeCacheMatrix()
# cached$set(matrix(runif(100), 10, 10))
# cacheSolve(cached)