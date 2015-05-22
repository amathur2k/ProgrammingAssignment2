## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## What to say, this method is a copy of the example code with mean 
## replaced by inv

makeCacheMatrix <- function(x = matrix()) {
 	  inv <- NULL
        set <- function(y) {
                ## Didnt get the point of this <<- here, lexical Scoping sucks
		    x <<- y
                inv <<- NULL
        }
        get <- function() x
        setInv <- function(inverse) inv <<- inverse
        getInv <- function() inv

        ## This is how methods were encapsulated in Objects before Oop!
        list(set = set, get = get,
             setInv = setInv,
             getInv = getInv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Duh !! Return a matrix that is the inverse of 'x'
	  inv <- x$getInv()
        if(!is.null(inv)) {
                message("getting cached data, yay! getting a major turn on")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setInv(inv)
        inv
}
## TestBench
mat = matrix(c(4,3,3,2), nrow = 2, ncol = 2)
cm <- makeCacheMatrix(mat)
cacheSolve(cm)
cacheSolve(cm)


