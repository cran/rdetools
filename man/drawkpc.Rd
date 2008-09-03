\name{drawkpc}

\alias{drawkpc}

\title{Draw kernel pca coefficients}

\description{
  The function plots the absolute values of the kernel pca coefficients. The estimated relevant dimension
  and the estimated noise level (if available) are also drawn. Optionally, it puts a rescaled version of
  the loo-cv-error/negative-log-likelihood into the plot.
}

\usage{
drawkpc(model,
        err = TRUE,
	pointcol = "blue",
	rdcol = "red",
	noisecol = "black",
	errcol = "brown",
	...)
}

\arguments{
  \item{model}{list of rde data returned by \code{\link{rde}} or \code{\link{selectmodel}}}
  \item{err}{leave this TRUE, if you want to have a rescaled version of the the loo-cv-error/negative-log-likelihood
             in the plot}
  \item{pointcol}{color of the kernel pca coefficients}
  \item{rdcol}{color of the relevant dimension line}
  \item{noisecol}{color of the noise level line}
  \item{errcol}{color of the the loo-cv-error/negative-log-likelihood}
  \item{\dots}{additional parameters to the plotting functions}
}

\references{M. L. Braun, J. M. Buhmann, K. R. Mueller (2008) \_On Relevant Dimensions in Kernel Feature Spaces\_}

\author{Jan Saputra Mueller}

\seealso{\code{\link{rde}}, \code{\link{selectmodel}}, \code{\link{modelimage}}, \code{\link{distimage}}}

\examples{
## draw kernel pca coefficients after calling rde
d <- sincdata(100, 0.1) # generate sinc data
K <- rbfkernel(d$X)
r <- rde(K, d$y, est_noise = TRUE)
drawkpc(r)

## draw kernel pca coefficients after calling selectmodel
d <- sincdata(100, 0.1) # generate sinc data
m <- selectmodel(d$X, d$y, est_noise = TRUE, sigma = logspace(-3, 3, 100))
drawkpc(m)
}

\keyword{hplot}
\keyword{models}
\keyword{classif}
\keyword{regression}
