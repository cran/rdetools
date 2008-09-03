\name{modelimage}

\alias{modelimage}

\title{Model selection image}

\description{
  The function produces a graphical illustration of a model selection which has been done with \code{\link{selectmodel}}.
  Strictly speaking it's a \code{\link{filled.contour}} plot in which additionally the relevant dimensions for the different
  models are drawn as a black line. \code{\link{selectmodel}} chooses the deepest point in this map, that is the model
  and the relevant dimension with the smallest loo-cv-error/negative-log-likelihood-value.
}

\usage{
modelimage(model,
           color.palette = topo.colors,
	   log = TRUE,
	   plottitle = "RDE Model Selection",
	   ...)
}

\arguments{
  \item{model}{list of model selection data as it has been returned by \code{\link{selectmodel}}}
  \item{color.palette}{color palette function to use, see \code{\link{rainbow}}}
  \item{log}{leave this TRUE, if the axis of the model parameter should be logarithmically scaled. Set this to FALSE
             if you want linear scaling.}
  \item{plottitle}{title of the plot}
  \item{\dots}{additional parameters for \code{\link{filled.contour}}}
}

\references{M. L. Braun, J. M. Buhmann, K. R. Mueller (2008) \_On Relevant Dimensions in Kernel Feature Spaces\_}

\author{Jan Saputra Mueller}

\seealso{\code{\link{selectmodel}}, \code{\link{distimage}}, \code{\link{drawkpc}}, \code{\link{filled.contour}},
         \code{\link{rainbow}}}

\examples{
## model selection with RBF-kernel and graphical illustration
d <- sincdata(100, 0.1) # generate sinc data
# do model selection
m <- selectmodel(d$X, d$y, sigma = logspace(-3, 3, 100))
modelimage(m) # draw model selection image
}

\keyword{hplot}
\keyword{models}
\keyword{classif}
\keyword{regression}
