# library(tidyverse)
#
# df <- read_csv("acth.csv")
#
# acth <- df$acth
# time <- df$time
# fourier_est <- function(y, t, p, h = c("1", "2", "3")) {
#   options(warn = -1)
#   if (missing(h) == TRUE) {
#     stop("Number of harmonics are required")
#   } else if (h == "1") {
#     pred <- p[1] + p[2] * cos(2 * pi * t / 24) + p[3] * sin(2 * pi * t / 24)
#
#   } else if (h == "2") {
#     pred <- p[1] + p[2] * cos(2 * pi * t / 24) + p[3] * sin(2 * pi * t / 24) +
#       p[4] * cos(2 * pi * t / 12) + p[5] * sin(2 * pi * t / 12)
#   } else if (h == "3") {
#     pred <- p[1] + p[2] * cos(2 * pi * t / 24) + p[3] * sin(2 * pi * t / 24) +
#       p[4] * cos(2 * pi * t / 12) + p[5] * sin(2 * pi * t / 12) +
#       p[6] * cos(2 * pi * t / 8) + p[7] * sin(2 * pi * t / 2)
#   } else {
#     stop("Only three harmonics allowd")
#   }
#
#   rss <- function(y, pred, t, h,p) {
#     sum(((y - pred)) ^ 2)
#   }
#   fr <- stats::nlm(
#     rss,
#     p = p,
#     t = t,
#     y = y,
#     h = h
#   )
#   return(fr$estimate)
#   options(warn = 0)
# }
# ft_pred <- function(fourier_est,t, h){
#   if (h == "1") {
#     predft <- fourier_est[1] + fourier_est[2] * cos(2 * pi * t / 24) + fourier_est[3] * sin(2 * pi * t / 24)
#
#   } else if (h == "2") {
#     predft <- fourier_est[1] + fourier_est[2] * cos(2 * pi * t / 24) + fourier_est[3]  * sin(2 * pi * t / 24) +
#       fourier_est[4] * cos(2 * pi * t / 12) + fourier_est[5] * sin(2 * pi * t / 12)
#   } else if (h == "3") {
#     predft <- fourier_est[1] + fourier_est[2] * cos(2 * pi * t / 24) + fourier_est[3] * sin(2 * pi * t / 24) +
#       fourier_est[4] * cos(2 * pi * t / 12) + fourier_est[5] * sin(2 * pi * t / 12) +
#       fourier_est[6] * cos(2 * pi * t / 8) + fourier_est[7] * sin(2 * pi * t / 2)
#   }
#
#   return(predft)
# }
# esti <- fourier_est(y = acth, t = time, p = c(0.1, 0.01, -0.1,0.01, -0.1,1,1), h="3")
#
# pred <- ft_pred(esti, time, "3")
#
# df <- df %>%
#   mutate(x = pred)
#
# ggplot(df, aes(time, acth))+
#   geom_line()+
#   geom_line(aes(time, x))+
#   theme_bw()
