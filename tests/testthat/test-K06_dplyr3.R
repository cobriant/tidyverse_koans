K06 <- read_file("../../R/K06_dplyr3.R")

library(gapminder)

test_that("K06: Question 1", {
  skip_incomplete(K06, 1)
  expect_equal(parse_eval(str_match_q(K06, 1))[[1, 3]], 1952)
})

test_that("K06: Question 2", {
  skip_incomplete(K06, 2)
  expect_equal(parse_eval(str_match_q(K06, 2))[[1, 3]], 2007)
})

test_that("K06: Question 3", {
  skip_incomplete(K06, 3)
  expect_equal(parse_eval(str_match_q(K06, 3))[[1, 3]], 1952)
})

test_that("K06: Question 4", {
  skip_incomplete(K06, 4)
  expect_equal(parse_eval(str_match_q(K06, 4))[[3, 3]], 2002)
})

test_that("K06: Question 5", {
  skip_incomplete(K06, 5)
  expect_equal(nrow(parse_eval(str_match_q(K06, 5))), 5)
})
