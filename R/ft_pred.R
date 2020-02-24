#' Concentration prediction Fourier function
#'
#' This function will allow to predict the concentration after the estimation from `fourier_est`
#'
#' @author Mutaz J
#'
#' @param fourier_est function to estimate Fourier coefficients
#' @param t time data
#' @import fourier_est EndoPro
#' @export
#'
#'

ft_pred <- function(fourier_est,t, h){
  if (h == "1") {
    predft <- fourier_est[1] + fourier_est[2] * cos(2 * pi * t / 24) + fourier_est[3] * sin(2 * pi * t / 24)

  } else if (h == "2") {
    predft <- fourier_est[1] + fourier_est[2] * cos(2 * pi * t / 24) + fourier_est[3]  * sin(2 * pi * t / 24) +
      fourier_est[4] * cos(2 * pi * t / 12) + fourier_est[5] * sin(2 * pi * t / 12)
  } else if (h == "3") {
    predft <- fourier_est[1] + fourier_est[2] * cos(2 * pi * t / 24) + fourier_est[3] * sin(2 * pi * t / 24) +
      fourier_est[4] * cos(2 * pi * t / 12) + fourier_est[5] * sin(2 * pi * t / 12) +
      fourier_est[6] * cos(2 * pi * t / 8) + fourier_est[7] * sin(2 * pi * t / 2)
  }

  return(predft)
}
