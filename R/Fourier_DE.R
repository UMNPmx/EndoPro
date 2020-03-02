#'@title  Fourier transformation function
#'
#'@description Fourier series analysis will be done to fit the endogenous production mimicing the circadian rhythm
#'
#'@param y Observed endogenous concentration
#'@param t Time array
#'@param p initial estimate of Fourier coefficient
#'@param h Number of harmonics. 3 is allowed
#'
#'@return this function provides estimation of fourier coefficients
#'@export fourier_est
#'

fourier_est <- function(y, t, p, h = c("1", "2", "3")) {
  options(warn = -1)
  if (missing(h) == TRUE) {
    stop("Number of harmonics are required")
  } else if (h == "1") {
    pred <- p[1] + p[2] * cos(2 * pi * t / 24) + p[3] * sin(2 * pi * t / 24)

  } else if (h == "2") {
    pred <- p[1] + p[2] * cos(2 * pi * t / 24) + p[3] * sin(2 * pi * t / 24) +
      p[4] * cos(2 * pi * t / 12) + p[5] * sin(2 * pi * t / 12)
  } else if (h == "3") {
    pred <- p[1] + p[2] * cos(2 * pi * t / 24) + p[3] * sin(2 * pi * t / 24) +
      p[4] * cos(2 * pi * t / 12) + p[5] * sin(2 * pi * t / 12) +
      p[6] * cos(2 * pi * t / 8) + p[7] * sin(2 * pi * t / 2)
  } else {
    stop("Only three harmonics allowd")
  }

  rss <- function(y, pred, t, h,p) {
    sum(((y - pred)) ^ 2, na.rm = T)
  }
  fr <- stats::nlm(
    rss,
    p = p,
    t = t,
    y = y,
    h = h
  )
  return(fr$estimate)
  options(warn = 0)
}






