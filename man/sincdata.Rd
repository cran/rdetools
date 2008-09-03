\name{sincdata}

\alias{sincdata}

\title{Generate random sinc data}

\description{
  Function draws \code{n} points uniformly from the interval \eqn{[a, b]}, calculates
  the sinc (normalized sinc function) values for that points and adds a normal noise with a standard deviation
  of \code{noise} to these values.
}

\usage{
sincdata(n, noise = 0, a = -4, b = 4)
}

\arguments{
  \item{n}{number of points to generate}
  \item{noise}{noise level to add to sinc values, i.e. standard deviation of normal noise}
  \item{a}{left bound of interval from which the xs are drawn, \code{a} must be smaller than \code{b}}
  \item{b}{right bound of interval from which the ys are drawn, \code{b} must be larger than \code{a}}
}

\value{
Randomly generated sinc data
  \item{X}{matrix with one column (i.e. a vector, but returned object is a matrix) containing the x-values}
  \item{y}{matrix with one row (i.e. a vector, but returned object is a matrix) containing the y-values}
}
\references{http://en.wikipedia.org/wiki/Sinc\_function}

\author{Jan Saputra Mueller}

\seealso{\code{\link{sinc}}}

\examples{
## generate 100 data points with noise level 0
## drawn from the interval [-4,4]
sincdata(100)

## generate 1000 data points with noise level 0.7
## drawn from the interval [-10, 10]
sincdata(100, 0.7, a = -10, b = 10)
}

\keyword{datagen}
