\name{kpr}

\alias{kpr}

\title{Kernel projection regression}

\description{
  The function does a kernel projection regression. It returns a function which predicts labels for new data points.
}

\usage{
kpr(model,
    X = NULL,
    Xname = "X",
    Yname = "Y",
    kernel = NULL,
    regression = TRUE,
    ...)
}

\arguments{
  \item{model}{list of rde data returned by \code{\link{rde}} or \code{\link{selectmodel}}}
  \item{X}{matrix containing the data points, only needed if \code{\link{rde}} was used}
  \item{Xname}{the name of the parameter of the kernel function which should contain the data points,
               only needed if \code{\link{rde}} was used}
  \item{Yname}{the name of the parameter of the kernel function which should contain the 2nd data matrix}
  \item{kernel}{kernel function to use, only needed if \code{\link{rde}} was used}
  \item{regression}{set this to TRUE in case of a regression problem and to FALSE in case of a classification problem;
                    only needed if \code{\link{rde}} was used}
  \item{\dots}{parameters for the kernel function, only needed if \code{\link{rde}} was used}
}

\value{
  function which predicts labels for new input data (gets a matrix with one data point per line)
}

\references{M. L. Braun, J. M. Buhmann, K. R. Mueller (2008) \_On Relevant Dimensions in Kernel Feature Spaces\_}

\author{Jan Saputra Mueller}

\seealso{\code{\link{selectmodel}}}

\examples{
## kernel projection regression after
## calling selectmodel (recommended)
d <- sincdata(100, 0.1) # generate sinc data
# do model selection
m <- selectmodel(d$X, d$y, sigma = logspace(-3, 3, 100))
f <- kpr(m)
plot(f, -4, 4)
}

\keyword{models}
\keyword{classif}
\keyword{regression}
