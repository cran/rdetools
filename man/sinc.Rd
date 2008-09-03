\name{sinc}

\alias{sinc}

\title{Calculate sinc values}

\description{
  Calculates (normalized) sinc values for each element of a vector/matrix/... etc.,
  \deqn{sinc(x) = \frac{sin(\pi x)}{\pi x}, x \neq 0}{sinc(x) = sin(pi*x)/(pi*x), x != 0}
  If \eqn{x = 0, sinc(x)} is defined as \eqn{1} (removable singularity in zero).
}

\usage{
sinc(X)
}

\arguments{
  \item{X}{an arbitrary vector/matrix/... containing numbers}
}

\value{
  an vector/matrix/... of same size as the argument containing the sinc values for each element
}

\references{http://en.wikipedia.org/wiki/Sinc\_function}

\author{Jan Saputra Mueller}

\seealso{\code{\link{sincdata}}}

\examples{
## calculate sinc values of a vector
v <- 1:10
sinc(v)
}

\keyword{math}
