K01 <- read_file("../../R/K01_vector.R")

test_that("K01: Question 1", {
  skip_incomplete(K01, 1)
  expect_equal(parse_eval(str_match_q(K01, 1))[1], 6)
})

test_that("K01: Question 2", {
  skip_incomplete(K01, 2)
  expect_equal(parse_eval(str_match_q(K01, 2))[3], "economics")
})

test_that("K01: Question 3a", {
  skip_incomplete(K01, "3a")
  expect_equal(parse_eval(str_match_q(K01, "3a")), c(T, T, T))
})

test_that("K01: Question 3b", {
  skip_incomplete(K01, "3b")
  expect_equal(parse_eval(str_match_q(K01, "3b")), T)
})

test_that("K01: Question 3c", {
  skip_incomplete(K01, "3c")
  expect_equal(parse_eval(str_match_q(K01, "3c")), T)
})

test_that("K01: Question 3d", {
  skip_incomplete(K01, "3d")
  expect_equal(parse_eval(str_match_q(K01, "3d")), c(T, T, T))
})

test_that("K01: Question 3e", {
  skip_incomplete(K01, "3e")
  expect_equal(parse_eval(str_match_q(K01, "3e")), c(T, T, T))
})

test_that("K01: Question 4", {
  skip_incomplete(K01, 4)
  expect_equal(parse_eval(str_match_q(K01, 4)), c(T, T, T))
})

test_that("K01: Question 5", {
  skip_incomplete(K01, 5)
  expect_equal(class(parse_eval(str_match_q(K01, 5))), "character")
})
