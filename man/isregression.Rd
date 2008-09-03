\name{isregression}

\alias{isregression}

\title{Estimate from labels whether this is a regression problem}

\description{
  Estimates whether this is a regression or classification problem by looking
  at the labels. If all labels are only -1 and 1 a classification problem is assumed,
  otherwise a regression problem. If the argument 'regression' is TRUE, the function
  always returns TRUE.
}

\usage{
isregression(y, regression = FALSE)
}

\arguments{
  \item{y}{label vector for which the kind of problem should be estimated}
  \item{regression}{if \code{regression} is TRUE, the function returns always TRUE,
                    if you want an estimation leave this FALSE}
}

\value{
  TRUE, if this is a regression problem or the argument \code{regression} was TRUE, otherwise FALSE
}

\author{Jan Saputra Mueller}

\seealso{\code{\link{rde_loocv}}, \code{\link{rde_tcm}}, \code{\link{estnoise}}}

\examples{
## some examples
y_cl <- c(-1, 1, 1, -1, 1) # label vector for classification problem
y_reg <- runif(5) # label vector for regression problem
isregression(y_cl) # FALSE!
isregression(y_cl, regression = TRUE) # Always TRUE!
isregression(y_reg) # TRUE!
}

\keyword{classif}
\keyword{regression}
