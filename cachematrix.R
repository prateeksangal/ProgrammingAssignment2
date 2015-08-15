## This file contains two functions to make use of caching in R as a result of 
## scoping rules in R. It makes use of <<- operator to change variable in parent
## environment
## This file is set up for the Programming ASsignment for Week 2 of R Programming
## class in Coursera

## makeCacheMatrix takes a matrix as input and returns a list of functions 
## to set,get, inverse the matrix entered as an arguement

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL;
  set<-function(y){
    x<<-y;
    m<<-NULL
  }
  
  get<-function() x
  setmatrix<-function(solve) m<<-solve
  getmatrix<-function() m
  
  list(set=set, get=get,setmatrix=setmatrix,getmatrix=getmatrix)
  
}


## cacheSolve function takes a list of functions as input. It further returns
## the inverse of the matrix stored as cache if the list of functions
## contains a matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m<-x$getmatrix()
  if(! is.null(m)){
    message("Getting Cached Data....")
    return(m)
  }
  
  matrix<-x$get()
  m<-solve(matrix,...)
  x$setmatrix(m)
  m
  
  }
