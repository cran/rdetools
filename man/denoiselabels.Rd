\name{denoiselabels}

\alias{denoiselabels}

\title{Denoise labels}

\description{
  The function denoises labels of a dataset by projecting them to the \code{d} first kernel pca principal directions
  if \code{d} is not 0. If \code{d} is 0 the function returns a matrix containing the projected labels for each
  dimension in each column.
  The function is primarily an auxiliary function for the rde functions, and it should not be necessary to call it
  by hand, because rde will do this for you (see examples).
}

\usage{
denoiselabels(d, eigvec, kpc, regression = TRUE)
}

\arguments{
  \item{d}{number of leading kernel pca principal directions to project the labels to or 0, if a matrix should
           be returned which contains the denoised labels for each dimension}
  \item{eigvec}{eigenvectors of the kernel matrix}
  \item{kpc}{kernel pca coefficients}
  \item{regression}{set this to TRUE, if the data should be handled as data of a regression problem and to FALSE
                    in case of a classification problem}
}

\value{
  denoised version of the labels or a matrix with denoised labels for each dimension in its columns if \code{d} was 0.
}

\author{Jan Saputra Mueller}

\seealso{\code{\link{rde}}, \code{\link{rde_loocv}}, \code{\link{rde_tcm}}}

\examples{
## example with sinc data
d <- sincdata(100, 0.7) # generate sinc data
K <- rbfkernel(d$X) # calculate rbf kernel matrix
# rde, return also denoised labels
r <- rde(K, d$y, est_y = TRUE)
r$yh # denoised labels
}

\keyword{models}
\keyword{classif}
\keyword{regression}
