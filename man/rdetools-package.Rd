\name{rdetools-package}

\alias{rdetools-package}
\alias{rdetools}

\docType{package}

\title{
Relevant Dimension Estimation (RDE) in Feature Spaces
}

\description{
Only a finite number of leading kernel PCA components contain the relevant information of a
supervised learning problem if the kernel matches the problem.
The package provides functions for estimating the relevant dimension in kernel feature spaces.
These functions are also able to calculate denoised versions of your label vectors and to estimate
the noise levels in your data sets.
RDE can also be used for model selection. The package provides functions for this issue and graphical
functions to illustrate the results of RDE and model selection.
For making predictions kernel projection regression is available.
}

\details{
\tabular{ll}{
Package: \tab rdetools\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2008-08-03\cr
License: \tab GPL-2\cr
}
}

\author{
Jan Saputra Mueller

Maintainer: Jan Saputra Mueller <saputra@cs.tu-berlin.de>
}

\references{M. L. Braun, J. M. Buhmann, K. R. Mueller (2008) \_On Relevant Dimensions in Kernel Feature Spaces\_}

\keyword{package}
\keyword{classif}
\keyword{regression}
\keyword{models}

\examples{
## rde on a noisy sinc data set
d <- sincdata(100, 0.1) # generate noisy sinc data
K <- rbfkernel(d$X) # calculate rbf kernel matrix
# estimate relevant dimension, denoised ys and noise level in data set
r <- rde(K, d$y, est_y = TRUE, est_noise = TRUE)
r$rd # relevant dimension
r$yh # denoised ys
r$noise # noise level in data set
drawkpc(r) # draw kernel pca coefficients

## rde for model selection
d <- sincdata(100, 0.1) # generate sinc data
# do model selection
m <- selectmodel(d$X, d$y, sigma = logspace(-3, 3, 100))
m$best # best model
m$rd # relevant dimension for best model
modelimage(m) # graphical illustration of model selection

## kernel projection regression
d <- sincdata(100, 0.1) # generate sinc data
# do model selection
m <- selectmodel(d$X, d$y, sigma = logspace(-3, 3, 100))
f <- kpr(m) # kernel projection regression
plot(f, -4, 4) # draw predicted function
}
