## Assignment: Caching the inverse of a Matrix

## Create a special object that allows for a given matrix
## - to set and to retrieve its content
## - to set and to retrieve its inverse

makeCacheMatrix <- function(x = matrix()) {
	s <- NULL
	set <- function(y) {
		x <<- y
		s <<- NULL
	}
	get <- function() x
	setsolve <- function(solve) s <<- solve
	getsolve <- function() s

	list(set=set, get=get, setsolve=setsolve, getsolve=getsolve)
}

## Get the inverse of a given matrix
## - if the inverse has already been calculated: return it
## - else: calculate it, cache it and return it

cacheSolve <- function(x, ...) {
	s <- x$getsolve()
	if (!is.null(s)) {
		message("getting cached data")
		return(s)
	}
	data <- x$get()
	s <- solve(data, ...)
	x$setsolve(s)
	s
}
