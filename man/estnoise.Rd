\name{estnoise}

\alias{estnoise}

\title{Estimate noise level}
\description{
  Estimates the noise level for a label vector 'y' and a denoised version
  of this label vector 'yh'. Which loss function is used to estimate the noise
  level depends on the kind of problem (regression problem or classification problem).
}

\usage{
estnoise(y, yh, regression = FALSE, nmse = TRUE)
}

\arguments{
  \item{y}{a label vector containg only -1 and 1 for a classification problem, and real numbers in case of regression}
  \item{yh}{a denoised version of y which can be obtained by using e.g. rde}
  \item{regression}{FALSE in case of a classification problem, TRUE in case of a regression problem}
  \item{nmse}{if 'nmse' is TRUE and this is a regression problem, the mean squared error will be normalized}
}

\details{
  In case of a classification problem, the 0-1-loss is used to estimate the noise level:
  \deqn{ y = (y_1, ..., y_n)}
  \deqn{ L_{01}(y, \hat{y}) = \frac{1}{n}\sum_{i=1}^{n}{\mathbf{I}_{\{y_i \neq \hat{y}_i\}}} }{ L\_01(y, yh) = (1/n)*sum(y != yh) }
  In case of a regression problem, the mean squared error (mse) or the normalized mean squared error (nmse) is used,
  depending on whether 'nmse' is FALSE (mse) or TRUE (nmse):
  \deqn{ L_{mse}(y, \hat{y}) = \frac{1}{n}\sum_{i=1}^{n}{(y_i - \hat{y}_i)^2} }{ L\_mse = (1/n)*sum( (y - yh)\^2 ) }
  \deqn{ L_{nmse}(y, \hat{y}) = \frac{L_{mse}(y, \hat{y})}{\frac{1}{n}\sum_{i=1}^{n}{(y_i - \frac{1}{n}\sum_{j=1}^{n}{y_j})^2}} }{ L\_nmse = L\_mse(y, yh) / ((1/n)*sum( (y - (1/n)*sum(y))\^2 ) }
}

\value{
  Estimated noise level
}

\author{Jan Saputra Mueller}

\seealso{\code{\link{sincdata}}, \code{\link{rde_loocv}}, \code{\link{rde_tcm}}, \code{\link{rbfkernel}}, \code{\link{drawkpc}}}

\examples{
## estimate noise of sinc data explicitly
d <- sincdata(100, 0.7) # generate sinc data
K <- rbfkernel(d$X) # calculate rbf kernel matrix
r <- rde(K, d$y, est_y = TRUE) # estimate relevant dimension
noise <- estnoise(d$y, r$yh, regression = TRUE) # estimate noise level

## estimate noise of sinc data implicitly (via rde_loocv)
d <- sincdata(100, 0.7) # generate sinc data
K <- rbfkernel(d$X) # calculate rbf kernel matrix
r <- rde(K, d$y, est_y = TRUE) # estimate relevant dimension AND estimate noise
r$noise # estimated noise level
}

\keyword{models}
\keyword{classif}
\keyword{regression}
