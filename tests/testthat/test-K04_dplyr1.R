K04 <- read_file("../../R/K04_dplyr1.R")

library(gapminder)

test_that("K04: Question 1", {
  skip_incomplete(K04, 1)
  expect_equal(nrow(parse_eval(str_match_q(K04, 1))), 30)
})

test_that("K04: Question 2", {
  skip_incomplete(K04, 2)
  expect_equal(nrow(parse_eval(str_match_q(K04, 2))), 2)
})

test_that("K04: Question 3", {
  skip_incomplete(K04, 3)
  expect_equal(nrow(parse_eval(str_match_q(K04, 3))), 19)
})

test_that("K04: Question 4", {
  skip_incomplete(K04, 4)
  expect_equal(nrow(parse_eval(str_match_q(K04, 4))), 36)
})

test_that("K04: Question 5", {
  skip_incomplete(K04, 5)
  expect_equal(names(parse_eval(str_match_q(K04, 5))), c("lifeExp", "pop", "gdpPercap"))
})

test_that("K04: Question 6", {
  skip_incomplete(K04, 6)
  expect_true(parse_eval(str_match_q(K04, 6))[[1,7]] < 9000)
})



