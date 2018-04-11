#' Bayesian Multinomial Proportions test
#'
#' Fits a Bayesian MultinomialProportions proportions model for a multinomial experment, 
#' returning the probability of each alterntive being best.
#' @param observed Vector of the number of observed choices.
#' @param expected Vector of expected choices. If missing, it is rep(mean(observed), length(observed))
#' @useDynLib flipTest, .registration = TRUE
#' @return A vector of the probability of each alternative being best.
#' @import Rcpp methods
#' @importFrom rstan sampling extract
#' @export
MultinomialProportions <- function(observed, expected = rep(mean(observed), length(observed)))
{
    k <- length(observed)
    stanfit = sampling(
        stanmodels$multinomialproportions, 
        chains = 8, 
        iter = 2500, 
        data = list(
            groups = k,
            counts = observed,
            alpha = expected))
    probabilities <- colMeans(extract(stanfit)[["preferred"]])
    names(probabilities) <- names(observed)
    list(stan.output = stanfit, probabilities = probabilities)
}

