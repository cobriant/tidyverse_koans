K05 <- read_file("../../R/K05_dplyr2.R")

library(gapminder)

test_that("K05: Question 1", {
  skip_incomplete(K05, 1)
  expect_equal(ncol(parse_eval(str_match_q(K05, 1))), 3)
})

test_that("K05: Question 2", {
  skip_incomplete(K05, 2)
  expect_equal(ncol(parse_eval(str_match_q(K05, 2))), 2)
})

test_that("K05: Question 3", {
  skip_incomplete(K05, 3)
  expect_equal(nrow(parse_eval(str_match_q(K05, 3))), 52)
})

test_that("K05: Question 4", {
  skip_incomplete(K05, 4)
  expect_equal(nrow(parse_eval(str_match_q(K05, 4))), 60)
})

test_that("K05: Question 5", {
  skip_incomplete(K05, 5)
  expect_equal(nrow(parse_eval(str_match_q(K05, 5))), 142)
})






