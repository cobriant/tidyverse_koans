K17 <- read_file("../../R/K17_lag.R")

test_that("K17: Question 1", {
  skip_if(is.null(parse_eval(str_match_f(K17, "1"))), message = "incomplete")
  expect_equal(parse_eval(str_match_f(K17, "1")), 1:5)
})

test_that("K17: Question 2", {
  skip_if(is.null(parse_eval(str_match_f(K17, "2"))), message = "incomplete")
  expect_equal(parse_eval(str_match_f(K17, "2")), c(NA, 1:4))
})

test_that("K17: Question 3", {
  skip_if(is.null(parse_eval(str_match_f(K17, "3"))), message = "incomplete")
  expect_equal(parse_eval(str_match_f(K17, "3")), c(NA, NA, 1:3))
})

test_that("K17: Question 4", {
  skip_if(is.null(parse_eval(str_match_f(K17, "4"))), message = "incomplete")
  expect_true(is.na(parse_eval(str_match_f(K17, "4"))[[1, 7]]))
})

test_that("K17: Question 5", {
  skip_if(is.null(parse_eval(str_match_f(K17, "5"))), message = "incomplete")
  expect_error(parse_eval(str_match_f(K17, "5")), NA)
})

test_that("K17: Question 6", {
  skip_if(is.null(parse_eval(str_match_f(K17, "6"))), message = "incomplete")
  expect_true(is.na(parse_eval(str_match_f(K17, "4"))[[1, 7]]))
})

test_that("K17: Question 7", {
  skip_if(is.null(parse_eval(str_match_f(K17, "7"))), message = "incomplete")
  expect_true(is.na(parse_eval(str_match_f(K17, "7"))[[13, 7]]))
})

test_that("K17: Question 7", {
  skip_if(is.null(parse_eval(str_match_f(K17, "7"))), message = "incomplete")
  expect_true(is.na(parse_eval(str_match_f(K17, "7"))[[13, 7]]))
})

test_that("K17: Question 8", {
  skip_if(is.null(parse_eval(str_match_f(K17, "8"))), message = "incomplete")
  expect_equal(as.character(parse_eval(str_match_f(K17, "8"))[[1, 1]]), "Libya")
})
