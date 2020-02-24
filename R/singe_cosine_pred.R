#' Single cosine function prediction
#'
#' This function will pass `single_cos` arguments to predict the concentration
#'
#' @author Mutaz J.
#' @import single_cos EndoPro
#' @param single_cos function to predict single cosine coefficients
#' @param t time vector
#'
#'

single_cos_pred <- function(single_cos, t){
  pred <- single_cos[1] + single_cos[2] * cos(2 * pi * (t - single_cos[3]) / 24)

  return(pred)
}
