## makeCacheMatrix is function which return a list of functions as describe below.
##  set : To set a the value of the matrix
##  get : To get a the value of the matrix
##  setinv : To set a the value of the inverse matrix
##  getinv : To get a the value of the inverse matrix
makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinv <- function(inv) i <<- inv
        getinv <- function() i
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## cacheSolve is a function which will return a matrix that is the inverse of 'x'.
## Notice the x argument must be built with makeCacheMatrix function.
## If the inverse of 'x' has already been compute it will return the cached value, otherwise
## the inverse matrix will be computed thanks to solve() method and the result will be cached  
## for a future usage
cacheSolve <- function(x, ...) {
        i <- x$getinv()
        if(!is.null(i)) {
                message("getting cached inverse matrix")
                return(i)
        }
        matrix <- x$get()
        i <- solve(matrix, ...)
        x$setinv(i)
        ## Return a matrix that is the inverse of 'x'
        i
}
