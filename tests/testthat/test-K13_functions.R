K13 <- read_file("../../R/K13_functions.R")

test_that("K13: Question 1", {
  skip_if(is.null(parse_eval(str_match_f(K13, "1"))), message = "incomplete")
  expect_true(parse_eval(str_match_f(K13, "1")))
})

test_that("K13: Question 2", {
  skip_if(is.null(parse_eval(str_match_f(K13, "2"))), message = "incomplete")
  expect_equal(parse_eval(str_match_f(K13, "2")), c(T, T, T))
})

test_that("K13: Question 3", {
  skip_if(is.null(parse_eval(str_match_f(K13, "3"))), message = "incomplete")
  expect_error(parse_eval(str_match_f(K13, "3")), NA)
})

test_that("K13: Question 4", {
  skip_if(is.null(parse_eval(str_match_f(K13, "4"))), message = "incomplete")
  expect_true(parse_eval(str_match_f(K13, "4")))
})

test_that("K13: Question 5", {
  skip_if(is.null(parse_eval(str_match_f(K13, "5"))), message = "incomplete")
  expect_equal(parse_eval(str_match_f(K13, "5")), c(T, T, T))
})

test_that("K13: Question 6", {
  skip_if(is.null(parse_eval(str_match_f(K13, "6"))), message = "incomplete")
  expect_equal(round(parse_eval(str_match_f(K13, "6"))[[1, 7]]), 607535)
})

test_that("K13: Question 7", {
  skip_if(is.null(parse_eval(str_match_f(K13, "7"))), message = "incomplete")
  expect_equal(length(parse_eval(str_match_f(K13, "7"))), 2)
})

test_that("K13: Question 8", {
  skip_if(is.null(parse_eval(str_match_f(K13, "8"))), message = "incomplete")
  p <- parse_eval(str_match_f(K13, "8"))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomPoint")
})

test_that("K13: Question 9", {
  skip_if(is.null(parse_eval(str_match_f(K13, "9"))), message = "incomplete")
  p <- parse_eval(str_match_f(K13, "9"))
  expect_equal(p$layers[[1]]$aes_params[[1]], "blue")
})
