\name{logspace}

\alias{logspace}

\title{Logarithmically spaced sequence generation}

\description{
  Function generates a logarithmically spaced sequence of \code{n} values between decades
  \eqn{10^l} and \eqn{10^u}.
}

\usage{
logspace(l, u, n)
}

\arguments{
  \item{l}{\eqn{10^l} will be the lower value to start from}
  \item{u}{\eqn{10^u} will be the upper value to end with}
  \item{n}{number of values to generate}
}

\value{
  Logarithmically spaced sequence of length \code{n} between \eqn{10^l} and \eqn{10^u}.
}

\author{Jan Saputra Mueller}

\seealso{\code{\link{seq}}, \code{\link{selectmodel}}}

\examples{
## generate 100 logarithmically spaced values between 10^(-3) and 10^3
logspace(-3, 3, 100)
}

\keyword{models}
