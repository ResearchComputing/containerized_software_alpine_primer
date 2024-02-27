#Function to compute all prime numbers < argument "n"
#https://www.r-bloggers.com/lets-be-faster-and-more-parallel-in-r-with-doparallel-package/
getPrimeNumbers <- function(n) {  
  n <- as.integer(n)
  if(n > 1e6) stop("n too large")
  primes <- rep(TRUE, n)
  primes[1] <- FALSE
  last.prime <- 2L
  for (i in last.prime:floor(sqrt(n))) {
    primes[seq.int(2L*last.prime, n, last.prime)] <- FALSE
    last.prime <- last.prime + min(which(primes[(last.prime+1):n]))
    }
  which(primes)
}

#start R code below here
getPrimeNumbers(100)
