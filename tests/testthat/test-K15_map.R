K15 <- read_file("../../R/K15_map.R")
# K15 <- read_file("R/K15_map.R")

test_that("K15: Question 1", {
  skip_if(is.null(parse_eval(str_match_f(K15, "1"))), message = "incomplete")
  expect_true(parse_eval(str_match_f(K15, "1")))
})

test_that("K15: Question 2", {
  skip_if(is.null(parse_eval(str_match_f(K15, "2"))), message = "incomplete")
  expect_equal(parse_eval(str_match_f(K15, "2")), c(T, T, T))
})

test_that("K15: Question 3", {
  skip_if(is.null(parse_eval(str_match_f(K15, "3"))), message = "incomplete")
  expect_equal(length(parse_eval(str_match_f(K15, "3"))), 10)
})
