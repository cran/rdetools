\name{distimage}

\alias{distimage}

\title{Distance image}

\description{
  If you've done a model selection with \code{\link{selectmodel}}, this function can draw you a map, in which
  the distances of the original label vector and the estimated label vectors are shown. This is done by a 
  \code{\link{filled.contour}} plot.
}

\usage{
distimage(model,
          color.palette = terrain.colors,
	  log = TRUE,
	  plottitle = "Distance of Ys",
	  ...)
}

\arguments{
  \item{model}{list of model selection data as it has been returned by \code{\link{selectmodel}}. \code{\link{selectmodel}}
               must have been called with \code{ydist} parameter set to TRUE!}
  \item{color.palette}{color palette function to use, see \code{\link{rainbow}}}
  \item{log}{leave this TRUE, if the axis of the model parameter should be logarithmically scaled. Set this to FALSE
             if you want linear scaling.}
  \item{plottitle}{title of the plot}
  \item{\dots}{additional parameters for \code{\link{filled.contour}}}
}

\references{M. L. Braun, J. M. Buhmann, K. R. Mueller (2008) \_On Relevant Dimensions in Kernel Feature Spaces\_}

\author{Jan Saputra Mueller}

\seealso{\code{\link{selectmodel}}, \code{\link{modelimage}}, \code{\link{drawkpc}}, \code{\link{filled.contour}},
         \code{\link{rainbow}}}

\examples{
## model selection with RBF-kernel and graphical illustration
## of the distances of the labels
d <- sincdata(100, 0.1) # generate sinc data
# do model selection
m <- selectmodel(d$X, d$y, ydist = TRUE, sigma = logspace(-3, 3, 100))
distimage(m) # distance image
}

\keyword{hplot}
\keyword{models}
\keyword{classif}
\keyword{regression}
