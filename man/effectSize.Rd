% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/effect_size.R
\name{effectSize}
\alias{effectSize}
\title{Effect Size Calculation}
\usage{
effectSize(response, treatment, moderator)
}
\arguments{
\item{response}{A vector giving the outcome for all subjects}

\item{treatment}{A vector giving the treatment group index for all subjects}

\item{moderator}{A vector giving the moderator}
}
\value{
\code{eff_size} the calculated effect size for the moderator
}
\description{
Calculates the effect size of a moderator when there are only two treatment groups. More details please see:
\cite{Kraemer, H. C. (2013). Discovering, comparing, and combining moderators of treatment on outcome after randomized clinical trials: a parametric approach. Statistics in medicine, 32(11), 1964-1973.}
}
\examples{
#constructing the covariance matrix
co <- matrix(0.2, 10, 10)
diag(co) <- 1
dataEx <- data_generator1(d = 0.3, R2 = 0.5, v2 = 1, n = 3000,
                    co = co, beta1 = rep(1,10),inter = c(0,0))
#fit the GEM
dat <- dataEx[[1]]
model_nu <- gem_fit(dat = dat, method = "nu")
augmentData <- model_nu[[4]]
es <- effectSize(augmentData$y, augmentData$trt, augmentData$Z) 
#this should be the same with effect size calculated by the gem_fit function
}

