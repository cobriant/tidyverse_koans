K19 <- read_file("../../R/K19_reduce.R")
# K19 <- read_file("R/K19_reduce.R")

test_that("K19: Question 1", {
  skip_if(is.null(parse_eval(str_match_f(K19, "1"))), message = "incomplete")
  expect_true(parse_eval(str_match_f(K19, "1")))
})

test_that("K19: Question 2", {
  skip_if(is.null(parse_eval(str_match_f(K19, "2"))), message = "incomplete")
  expect_true(parse_eval(str_match_f(K19, "2")))
})

test_that("K19: Question 3", {
  skip_if(is.null(parse_eval(str_match_f(K19, "3"))), message = "incomplete")
  expect_equal(parse_eval(str_match_f(K19, "3"))(c(1, 2, 3)), 1)
})

test_that("K19: Question 4", {
  skip_if(is.null(parse_eval(str_match_f(K19, "4"))), message = "incomplete")
  expect_equal(parse_eval(str_match_f(K19, "4"))(c(1, 2, 3)), 6)
})

