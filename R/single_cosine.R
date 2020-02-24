#' Single cosine model
#'
#' Estimation of Amp, mean concentration
#'
#' @param t time
#' @param y Observed concentration
#' @param p Initial values. p1: Amplitude p2: mean endogenous rate p3: acrophase time
#'
#' @export single_cos


single_cos <- function(y, t, p) {
  pred <- p[1] + p[2] * cos(2 * pi * (t - p[3]) / 24)

  rss <- function(y, pred, t) {
    sum(((y - pred)) ^ 2)
  }
    fr <- stats::nlm(rss,
                     p = p,
                     t = t,
                     y = y)

    return(fr$estimate)
  }




