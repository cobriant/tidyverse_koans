K20 <- read_file("../../R/K20_accumulate.R")

test_that("K20: Question 1", {
  skip_incomplete(K20, "1")
  expect_equal(parse_eval(str_match_q(K20, "1")), c(T, T, T, T))
})

test_that("K20: Question 2", {
  skip_incomplete(K20, "2")
  expect_equal(parse_eval(str_match_q(K20, "2")), c(T, T, T, T))
})

test_that("K20: Question 3", {
  skip_incomplete(K20, "3")
  expect_equal(parse_eval(str_match_q(K20, "3"))[[2, 3]], 0)
})

test_that("K20: Question 4", {
  skip_incomplete(K20, "4")
  expect_equal(parse_eval(str_match_q(K20, "4")), c(T, T, T, T))
})
