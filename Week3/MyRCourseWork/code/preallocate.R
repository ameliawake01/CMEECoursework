NoPreallocFun <- function(x){
    a <- vector() # empty vector
    for (i in 1:x) {
        a <- c(a, i) # concatenate
        invisible(a)
        invisible(object.size(a))
    }
}

system.time(NoPreallocFun(1000))

PreallocFun <- function(x){
    a <- rep(NA, x) # pre-allocated vector
    for (i in 1:x) {
        a[i] <- i # assign
        invisible(a)
        invisible(object.size(a))
    }
}

system.time(PreallocFun(1000))