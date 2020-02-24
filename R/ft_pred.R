#' Concentration prediction Fourier function
#'
#' This function will allow to predict the concentration after the estimation from `r fourier_est`
#'
#'  @author Mutaz J
#'
#'  @param fourier_est function to estimate Fourier coefficients
#'  @param t time data
#'
#'  @export
#'
#'

ft_pred <- function(fourier_est,t){
  if (h == "1") {
    predft <- fr$estimate[1] + fr$estimate[2] * cos(2 * pi * t / 24) + fr$estimate[3] * sin(2 * pi * t / 24)

  } else if (h == "2") {
    predft <- fr$estimate[1] + fr$estimate[2] * cos(2 * pi * t / 24) + fr$estimate[3]  * sin(2 * pi * t / 24) +
      fr$estimate[4] * cos(2 * pi * t / 12) + fr$estimate[5] * sin(2 * pi * t / 12)
  } else if (h == "3") {
    predft <- fr$estimate[1] + fr$estimate[2] * cos(2 * pi * t / 24) + fr$estimate[3] * sin(2 * pi * t / 24) +
      fr$estimate[4] * cos(2 * pi * t / 12) + fr$estimate[5] * sin(2 * pi * t / 12) +
      fr$estimate[6] * cos(2 * pi * t / 8) + p[7] * sin(2 * pi * t / 2)
  }
  return(predft)
}
