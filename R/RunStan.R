#' Run Some Stan Code
#'
#' Fits a Bayesian model using stan.
#' @export
#' @useDynLib flipTest, .registration = TRUE
#' @import Rcpp methods
#' @importFrom rstan sampling
RunStan <- function()
{
    n_right_leaners <- c(1500, 1500)
    n_respondents <- c(10658, 10639)
    data_list <- list(nA = n_respondents[1],
                      nB = n_respondents[2],
                      sA = n_right_leaners[1],
                      sB = n_right_leaners[2])


    # Compiling and producing posterior samples from the model.
    options(width = 2000, digits = 15)
    ## stan(model_code = model_string, chains = 8, iter = 200,  data = data_list)
    sampling(stanmodels$test, chains = 8, iter = 200, data = data_list)
}
