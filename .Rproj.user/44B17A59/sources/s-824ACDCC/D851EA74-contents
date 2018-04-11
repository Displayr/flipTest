#' Bayesian Binomial Proportions test
#'
#' Fits a Bayesian binomial proportions model for a Bernoulli experment, 
#' returning the probability of each alterntive being best.
#' @param x Number of successes.
#' @param n  A vector of the number of trials.
#' @useDynLib flipTest, .registration = TRUE
#' @return A vector of the probability of each alternative being best.
#' @import Rcpp methods
#' @importFrom rstan sampling extract
#' @export
BinomialProportions <- function(x, n)
{
    k <- length(x)
    stanfit = sampling(
        stanmodels$binomialproportions, 
        chains = 8, 
        iter = 2500, 
        data = list(
            groups = k,
            trials = n,
             successes = x))
    probabilities <- colMeans(extract(stanfit)[["preferred"]])
    names(probabilities) <- names(x)
    list(stanfit = stanfit, probabilities = probabilities)
}

