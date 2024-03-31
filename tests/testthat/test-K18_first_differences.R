K18 <- read_file("../../R/K18_first_differences.R")

test_that("K18: Question 1", {
  skip_incomplete(K18, "01")
  expect_equal(parse_eval(str_match_q(K18, "01"))[[1, 6]],
               parse_eval(str_match_q(K18, "01"))[[2, 7]])
})

test_that("K18: Question 2", {
  skip_incomplete(K18, "02")
  expect_true(parse_eval(str_match_q(K18, "02"))[[1]] < -1)
})

test_that("K18: Question 3", {
  skip_incomplete(K18, "03")
  expect_true(parse_eval(str_match_q(K18, "03"))[[1]] > 1)
})

test_that("K18: Question 4", {
  skip_incomplete(K18, "04")
  expect_true(parse_eval(str_match_q(K18, "04")))
})

test_that("K18: Question 5", {
  skip_incomplete(K18, "05")
  p <- parse_eval(str_match_q(K18, "05"))
  expect_equal(p$labels$x, "year")
})

test_that("K18: Question 6", {
  skip_incomplete(K18, "06")
  p <- parse_eval(str_match_q(K18, "06"))
  expect_equal(p$labels$y, "lifeExp_diff")
})

test_that("K18: Question 7", {
  skip_incomplete(K18, "07")
  p <- parse_eval(str_match_q(K18, "07"))
  expect_equal(p$labels$x, "year")
})

test_that("K18: Question 8", {
  skip_incomplete(K18, "08")
  p <- parse_eval(str_match_q(K18, "08"))
  expect_equal(p$labels$x, "year")
})

test_that("K18: Question 9", {
  skip_incomplete(K18, "09")
  p <- parse_eval(str_match_q(K18, "09"))
  expect_equal(p$labels$x, "year")
})

test_that("K18: Question 10", {
  skip_incomplete(K18, "10")
  p <- parse_eval(str_match_q(K18, "10"))
  expect_equal(p$labels$x, "year")
})
