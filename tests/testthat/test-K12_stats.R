K12 <- read_file("../../R/K12_stats.R")
# K12 <- read_file("R/K12_stats.R")

test_that("K12: Question 1", {
  skip_incomplete(K12, "01")
  expect_equal(length(parse_eval(str_match_q(K12, "01"))), 8)
})

test_that("K12: Question 2", {
  skip_incomplete(K12, "02")
  p <- parse_eval(str_match_q(K12, "02"))
  expect_equal(p$layers[[1]]$stat_params$args$df, 55)
})

test_that("K12: Question 3", {
  skip_incomplete(K12, "03")
  expect_true(parse_eval(str_match_q(K12, "03")))
})

test_that("K12: Question 4", {
  skip_incomplete(K12, "04")
  p <- parse_eval(str_match_q(K12, "04"))
  expect_equal(round(p$layers[[2]]$stat_params$xlim[[1]]), 2)
})

test_that("K12: Question 5", {
  skip_incomplete(K12, "05")
  expect_equal(length(parse_eval(str_match_q(K12, "05"))), 10)
})

test_that("K12: Question 6", {
  skip_incomplete(K12, "06")
  p <- parse_eval(str_match_q(K12, "06"))
  expect_equal(p$layers[[1]]$stat_params$args$df1, 10)
})

test_that("K12: Question 7", {
  skip_incomplete(K12, "07")
  expect_false(parse_eval(str_match_q(K12, "07")))
})

test_that("K12: Question 8", {
  skip_incomplete(K12, "08")
  p <- parse_eval(str_match_q(K12, "08"))
  expect_equal(round(p$layers[[2]]$stat_params$xlim[[1]], digits = 2), 2.35)
})
