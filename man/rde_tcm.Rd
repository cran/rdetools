\name{rde_tcm}

\alias{rde_tcm}

\title{Relevant Dimension Estimation (RDE) by Fitting a Two-Component Model (TCM)}

\description{
  The function estimates the relevant dimension in feature space by fitting a two-component model.
  It's also able to calculate a denoised version of the labels and to estimate the noise level in
  the data set.
}

\usage{
rde_tcm(K, y,
        est_y = FALSE,
	alldim = FALSE,
	est_noise = FALSE,
	regression = FALSE,
	nmse = TRUE,
	dim_rest = 0.5)
}

\arguments{
  \item{K}{kernel matrix of the inputs (e.g. rbf kernel matrix)}
  \item{y}{label vector which contains the label for each data point}
  \item{est_y}{set this to TRUE if you want a denoised version of the labels}
  \item{alldim}{if this is TRUE denoised labels for all dimensions are calculated (instead of only for relevant dimension)}
  \item{est_noise}{set this to TRUE if you want an estimated noise level}
  \item{regression}{only interesting if one of \code{est_y}, \code{alldim}, \code{est_noise} is TRUE. Set this
                    to TRUE if you want to force the function to handle the data as data for
		    a regression problem. If you leave this FALSE, the function will try to determine
		    itself whether this is a classification or regression problem.}
  \item{nmse}{only interesting if \code{est_noise} is TRUE and the function is handling the data as data
              of a regression problem. If you leave this TRUE, the normalized mean squared error is used
	      for estimating the noise level, otherwise the conventional mean squared error.}
  \item{dim_rest}{percantage of leading dimensions to which the search for the relevant dimensions should be
                  restricted. This is needed due to numerical instabilities. 0.5 should be a good choice
		  in most cases (and is also the default value)}
}

\details{
  If \code{est_noise} or \code{alldim} are TRUE, a denoised version of the labels for the relevant dimension
  will be returned even if \code{est_y} is FALSE (so e.g. if you want denoised labels and noise approximation
  it is enough to set \code{est_noise} to TRUE).
}

\value{
  \item{rd}{estimated relevant dimension}
  \item{err}{negative log-likelihood for each dimension (the position of the minimum is the relevant dimension)}
  \item{yh}{only returned if \code{est_y}, \code{alldim} or \code{est_noise} is TRUE, contains the denoised labels}
  \item{Yh}{only returned if \code{alldim} is TRUE, matrix with denoised labels for each dimension in each column}
  \item{noise}{only returned if \code{est_noise} is TRUE, contains the estimated noise level}
  \item{kpc}{kernel pca coefficients}
  \item{eigvec}{eigenvectors of the kernel matrix}
  \item{eigval}{eigenvalues of the kernel matrix}
  \item{tcm}{always TRUE; used to tell other functions that tcm method was used}
}

\references{M. L. Braun, J. M. Buhmann, K. R. Mueller (2008) \_On Relevant Dimensions in Kernel Feature Spaces\_}

\author{Jan Saputra Mueller}

\seealso{\code{\link{rde}}, \code{\link{rde_loocv}}, \code{\link{estnoise}}, 
         \code{\link{isregression}}, \code{\link{rbfkernel}}, \code{\link{polykernel}}, \code{\link{drawkpc}}}

\examples{
## example with sinc data
d <- sincdata(100, 0.1) # generate sinc data
K <- rbfkernel(d$X) # calculate rbf kernel matrix
# rde, return also denoised labels and noise
r <- rde_tcm(K, d$y, est_y = TRUE, est_noise = TRUE)
r$rd # estimated relevant dimension
r$noise # estimated noise
drawkpc(r) # draw kernel pca coefficients
}

\keyword{models}
\keyword{classif}
\keyword{regression}
