\name{selectmodel}

\alias{selectmodel}

\title{Model selection}

\description{
  The function can be used for selecting the kernel from a number of possible candidates which fits the problem best.
  You need a parametrized kernel function and a number of possible parameters. A relevant dimension estimation
  will be done for all parameter combinations and the one with the smallest loo-cv-error/negative-log-likelihood 
  on its estimated relevant dimension will be chosen.
}

\usage{
selectmodel(X, y,
            kernel = rbfkernel,
	    est_y = FALSE,
	    ydist = FALSE,
	    est_noise = FALSE,
	    regression = FALSE,
	    nmse = TRUE,
	    tcm = TRUE,
	    Xname = "X",
	    ...)
}

\arguments{
  \item{X}{matrix containing a data point in each row}
  \item{y}{label vector which contains the label for each data point}
  \item{kernel}{parametrized kernel function which should be used}
  \item{est_y}{set this to TRUE if you want a denoised version of the labels for the best model}
  \item{ydist}{set this to TRUE if you want a matrix, which contains the distances between the denoised
               labels and the original labels for all dimensions and all parameter combinations (each line
	       in the matrix contains the distances for one parameter combination. This is needed for \code{\link{distimage}})}
  \item{est_noise}{set this to TRUE if you want an estimated noise level (for the best model)}
  \item{regression}{only interesting if \code{est_y} or \code{est_noise} is TRUE. Set this
                    to TRUE if you want to force the function to handle the data as data for
		    a regression problem. If you leave this FALSE, the function will try to determine
		    itself whether this is a classification or regression problem.}
  \item{nmse}{only interesting if \code{est_noise} is TRUE and the function is handling the data as data
              of a regression problem. If you leave this TRUE, the normalized mean squared error is used
	      for estimating the noise level, otherwise the conventional mean squared error.}
  \item{tcm}{this is TRUE by default; indicates whether rde should be done by TCM or LOO-CV algorithm}
  \item{Xname}{the name of the parameter of the kernel function which should contain the data points. This is \code{X}
               by default and can be left as it is if you use \code{\link{rbfkernel}} or \code{\link{polykernel}}.}
  \item{\dots}{for each parameter of the kernel function you should give a list of parameters to select the best
               parameter combination from (e.g. for \code{\link{rbfkernel}} this is only the parameter \code{sigma}
	       of for \code{\link{polykernel}} it's only the parameter \code{d}. See examples.)}
}

\value{
  \item{rd}{estimated relevant dimension for best model}
  \item{best}{the best parameter combination which has been found through model selection}
  \item{yh}{only returned if \code{est_y}, \code{alldim} or \code{est_noise} is TRUE, contains the denoised labels for the best model}
  \item{noise}{only returned if \code{est_noise} is TRUE, contains the estimated noise level for the best model}
  \item{Yd}{contains the distances of the denoised labels and the original labels; needed for \code{\link{distimage}}}
  \item{rds}{estimated relevant dimensions for each model}
  \item{err}{loo-cv-error/negative-log-likelihood-value for each dimension for the best model}
  \item{errs}{loo-cv-error/negative-log-likelihood-value for each dimension for all models (in each line is the error for one model)}
  \item{kpc}{kernel pca coefficients for best model}
  \item{eigvec}{eigenvectors of the kernel matrix for best model}
  \item{eigval}{eigenvalues of the kernel matrix for best model}
  \item{params}{list of parameters for the kernel function which has been given to the function}
  \item{tcm}{TRUE if TCM algorithm was used, otherwise (LOO-CV algorithm) FALSE}
  \item{kernel}{kernel function which has been used}
  \item{Xname}{the name of the parameter of the kernel function which should contain the data points as it has been given
               to the function}
  \item{X}{matrix with the data points as it has been given to the function}
  \item{regression}{TRUE, if the data are data of a regression problem, FALSE in case of a classification problem}
}

\references{M. L. Braun, J. M. Buhmann, K. R. Mueller (2008) \_On Relevant Dimensions in Kernel Feature Spaces\_}

\author{Jan Saputra Mueller}

\seealso{\code{\link{rde}}, \code{\link{modelimage}}, \code{\link{distimage}}, \code{\link{drawkpc}}}

\examples{
## model selection with RBF-kernel
d <- sincdata(100, 0.1) # generate sinc data
# do model selection, calculate also denoised labels
m <- selectmodel(d$X, d$y, est_y = TRUE, sigma = logspace(-3, 3, 100))
m$best # best model
m$rd # relevant dimension for best model
modelimage(m) # draw model selection image

## model selection with polynomial kernel
d <- sincdata(100, 0.1) # generate sinc data
# do model selection, calculate also denoised labels
m <- selectmodel(d$X, d$y, kernel = polykernel, est_y = TRUE, d = 1:20)
m$best # best model
m$rd # relevant dimension for best model
modelimage(m, log = FALSE) # draw model selection image
}

\keyword{models}
\keyword{classif}
\keyword{regression}
