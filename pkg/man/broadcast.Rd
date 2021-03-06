\docType{methods}
\name{value}
\alias{broadcast}
\alias{value}
\alias{value,Broadcast-method}
\title{Broadcast a variable to all workers}
\usage{
value(bcast)

\S4method{value}{Broadcast}(bcast)

broadcast(sc, object)
}
\arguments{
  \item{bcast}{The broadcast variable to get}

  \item{sc}{Spark Context to use}

  \item{object}{Object to be broadcast}
}
\description{
\code{value} can be used to get the value of a broadcast
variable inside a distributed function.

Broadcast a read-only variable to the cluster, returning a
\code{Broadcast} object for reading it in distributed
functions.
}
\examples{
\dontrun{
sc <- sparkR.init()
rdd <- parallelize(sc, 1:2, 2L)

# Large Matrix object that we want to broadcast
randomMat <- matrix(nrow=100, ncol=10, data=rnorm(1000))
randomMatBr <- broadcast(sc, randomMat)

# Use the broadcast variable inside the function
useBroadcast <- function(x) {
  sum(value(randomMatBr) * x)
}
sumRDD <- lapply(rdd, useBroadcast)
}
}

