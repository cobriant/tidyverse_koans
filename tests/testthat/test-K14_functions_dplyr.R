K14 <- read_file("../../R/K14_functions_dplyr.R")
#K14 <- read_file("R/K14_functions_dplyr.R")

test_that("K14: Question 1", {
  skip_incomplete(K14, "1")
  expect_error(parse_eval(str_match_q(K14, "1")), NA)
})

test_that("K14: Question 2", {
  skip_na(K14, "2")
  expect_equal(parse_eval(str_match_q(K14, "2"))[[1, 4]], 53.82)
})
