K15 <- read_file("../../R/K15_map.R")
# K15 <- read_file("R/K15_map.R")

test_that("K15: Question 1", {
  skip_na(K15, "1")
  expect_true(parse_eval(str_match_q(K15, "1")))
})

test_that("K15: Question 2", {
  skip_na(K15, "2")
  expect_equal(parse_eval(str_match_q(K15, "2")), c(T, T, T))
})

test_that("K15: Question 3", {
  skip_na(K15, "3")
  expect_equal(length(parse_eval(str_match_q(K15, "3"))), 10)
})
