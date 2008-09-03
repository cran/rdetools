\name{rbfkernel}

\alias{rbfkernel}

\title{Calculate RBF kernel matrix}

\description{
  Calculates the RBF kernel matrix for the dataset contained in the matrix \code{X},
  where each row of \code{X} is a data point. If \code{Y} is also a matrix (with the
  same number of columns as \code{X}), the kernel function is evaluated between all
  data points of \code{X} and \code{Y}.
}

\usage{
rbfkernel(X, sigma = 1, Y = NULL)
}

\arguments{
  \item{X}{matrix containing a data point in each row}
  \item{sigma}{kernel width of rbf kernel}
  \item{Y}{leave this NULL if the kernel function should be evaluated between the data points only contained in
           \code{X} (which can be regarded as \code{Y} = \code{X}) or to a matrix with same number of columns as \code{X}
	   if you want to evaluate the function between the points of \code{X} and \code{Y}}
}

\details{
  Each row of \code{X} must be a data point, i.e. \eqn{X = (x_1, x_2, ..., x_n)}.
  The kernel matrix \code{K} is then defined as
  
  \deqn{K = (k(x_i, x_j))_{i,j=1,...,n}}{K = (k(x_i, x_j)), i,j=1,...,n}
  
  If \code{Y} is not NULL and also contains data points in each row, i.e. \eqn{Y = (y_1, y_2, ..., y_m)},
  the kernel matrix \code{K} of \code{X} and \code{Y} is defined as
  
  \deqn{K = (k(x_i, y_j))_{i=1,...,n,j=1,...,m}}{K = (k(x_i, x_j)), i=1,...,n, j=1,...,m}
  
  In this case, k is the rbf (radial basis function) kernel, which is defined as
  
  \deqn{k(x, y) = exp(-\frac{||x - y||^2}{2\sigma})}{k(x, y) = exp(-0.5*\|\|x - y\|\|\^2/sigma)}
  
  where x, y are data points and sigma is the rbf kernel width.
}

\value{
  RBF kernel matrix \code{K} for the given dataset
}

\author{Jan Saputra Mueller}

\seealso{\code{\link{polykernel}}, \code{\link{sincdata}}}

\examples{
## generate sinc data and calculate rbf kernel matrix with sigma = 1
d <- sincdata(100, noise = 0.1)
K <- rbfkernel(d$X)
}

\keyword{models}
