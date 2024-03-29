\name{MRPCclass-class}
\title{Class of MRPC algorithm results}
\docType{class}
\alias{MRPCclass-class}
\alias{plot,MRPCclass,ANY-method}
\alias{show,MRPCclass-method}
\alias{summary,MRPCclass-method}
\alias{print.MRPCclass}
\description{This class of objects is returned by the functions
  \code{\link{ModiSkeleton}} and \code{\link{MRPC}} to represent the (ModiSkeleton) of an estimated DAG similarly from \code{\link{pcAlgo-class}}. Objects of this class have methods for the functions plot, show and
summary.
}
\usage{% usage ..for methods with "surprising arguments":
\S4method{plot}{MRPCclass,ANY}(x, y, main = NULL,
     zvalue.lwd = FALSE, lwd.max = 7, labels = NULL, \dots)
\S3method{print}{MRPCclass}(x, amat = FALSE, zero.print = ".", \dots)

\S4method{summary}{MRPCclass}(object, amat = TRUE, zero.print = ".", \dots)
\S4method{show}{MRPCclass}(object)
}
\arguments{
  \item{x, object}{a \code{"MRPCclass"} object.}
  \item{y}{(generic \code{plot()} argument; unused).}
  \item{main}{main title for the plot (with an automatic default).}
  \item{zvalue.lwd}{\code{\link{logical}} indicating if the line width
    (\code{lwd}) of the edges should be made proportional to the entries
    of matrix \code{zMin} (originally) or derived from matrix \code{pMax}.}
  \item{lwd.max}{maximal \code{lwd} to be used, if \code{zvalue.lwd} is true.}
  \item{labels}{if non-\code{NULL}, these are used to define node attributes
    \code{nodeAttrs} and \code{attrs}, passed to \code{\link[Rgraphviz]{agopen}()}
    from package \pkg{Rgraphviz}.}
  \item{amat}{\code{\link{logical}} indicating if the adjacency matrix
    should be printed as well.}
  \item{zero.print}{String for printing \code{0} (\sQuote{zero}) entries
    in the adjacency matrix.}
  \item{\dots}{(optional) Further arguments passed from and to methods.}
}
\section{Creation of objects}{
  Objects are typically created as result from
  \code{\link{skeleton}()} or \code{\link{pc}()}, but could be
  be created by calls of the form \code{new("MRPCclass", ...)}.
}

\section{Slots}{
  The slots \code{call}, \code{n}, \code{max.ord}, \code{n.edgetests},
  \code{sepset}, \code{pMax}, \code{graph}, \code{zMin}, \code{test}, \code{alpha} and \code{R} are inherited class.

  In addition, \code{"MRPCclass"} has slots
  \describe{
    
    \item{\code{call}:}{a \link{call} object: the original function call.}
    
    \item{\code{n}:}{The sample 
    size used to estimate the graph.}
    \item{\code{max.ord}:}{The 
    maximum size of the conditioning set used 
    in the conditional independence tests of   
    the first part of the algorithm.}
    \item{\code{n.edgetests}:}{The number of 
    conditional independence tests performed by
    the first part of the algorithm.}
    \item{\code{sepset}:}{Separation sets.}
    \item{\code{pMax}:}{A square matrix
    , where the (i, j)th entry contains the 
    maximum p-value of all conditional
    independence tests for edge i--j.}
    \item{\code{graph}:}{Object of class \code{"\linkS4class{graph}"}:
      The undirected or partially directed graph that was estimated.}
    \item{\code{zMin}:}{Deprecated.}
    \item{\code{test}:}{The number of tests that have been performed.}
    \item{\code{alpha}:}{The level of significance 
    for the current test.}
    \item{\code{R}:}{All of the decisions made from tests that have been performed. A 1 indicates a rejected null hypothesis and 0 represents a null hypothesis that was not rejected.}
    \item{\code{K}:}{The total number of rejections.}
    \item{\code{pval}:}{A vector of p-values calculated for each test.}
    \item{\code{normalizer}:}{The value that ensures the gammai vector sums to one.}
    \item{\code{exponent}:}{The exponent of the p-series used to calculate each value of the gammai vector.}
    \item{\code{alphai}:}{A vector containing the alpha value calculated for each test.}
    \item{\code{kappai}:}{A vector containing the iteration at which each rejected test occurs.}
    \item{\code{kappai_star}:}{Each element of this vector is the sum of the Si vector up to the iteration at which each rejection occurs.}
    \item{\code{Ci}:}{A vector indicating whether or not a p-value is a candidate for being rejected.}
    \item{\code{Si}:}{A vector indicating whether or not a p-value was discarded.}
    \item{\code{Ci_plus}:}{Each element of this vector represents the number of times each kappai value was counted when calculating each alphai value.}
    \item{\code{gammai}:}{The elements of this vector are the values of the p-series 0.4374901658/(m^(1.6)), where m is the iteration at which each test is performed.}
    \item{\code{gammai_sum}:}{The sum of the gammai vector. This value is used in calculating the alphai value at each iteration.}
  }
}

\section{Methods}{
  \describe{
    \item{plot}{\code{signature(x = "MRPCclass")}: Plot the resulting
      graph. If argument \code{"zvalue.lwd"} is true, the
      linewidth an edge reflects \code{zMin}, so that
      thicker lines indicate more reliable dependencies. The argument
      \code{"lwd.max"} controls the maximum linewidth.}
    \item{show}{\code{signature(object = "MRPCclass")}: Show basic properties of
      the fitted object}
    \item{summary}{\code{signature(object = "MRPCclass")}: Show details of
      the fitted object }
  }
}
\author{
Md Bahadur Badsha (mbbadshar@gmail.com)
}
\seealso{
  \link{MRPC}, \link{ModiSkeleton}
}

\examples{
\dontrun{
showClass("MRPCclass")

# Generate a MRPCclass object
data <- simu_data_M1 # load data for model 1
n <- nrow(data)      # Number of rows
V <- colnames(data)  # Column names

# Calculate Pearson correlation
suffStat_C <- list(C = cor(data), 
                   n = n)

# Infer the graph by MRPC
MRPC.fit <- MRPC(data, 
                 suffStat_C, 
                 GV = 1,
                 FDR = 0.05, 
                 indepTest ='gaussCItest',
                 labels = V, 
                 FDRcontrol = 'LOND',
                 verbose = FALSE)


# Use methods of class MRPCclass
show(MRPC.fit)

plot(MRPC.fit)
summary(MRPC.fit)

# Access slots of this object
(g  <- MRPC.fit@graph)
str(ss <- MRPC.fit@sepset, max = 1)
}
}
\keyword{classes}
