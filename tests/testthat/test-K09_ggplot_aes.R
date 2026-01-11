K09 <- read_file("../../R/K09_ggplot_aes.R")

test_that("K09: Question 1", {
  skip_incomplete(K09, 1)
  p <- parse_eval(str_match_q(K09, 1))
  expect_equal(names(p$facet$params$facets), "year")
})

test_that("K09: Question 2", {
  skip_incomplete(K09, 2)
  p <- parse_eval(str_match_q(K09, 2))
  expect_equal(rlang::as_label(p$mapping$colour), "continent")
})

test_that("K09: Question 3", {
  skip_incomplete(K09, 3)
  p <- parse_eval(str_match_q(K09, 3))

  expect_equal(rlang::as_label(p$mapping$colour), "continent")
  expect_equal(rlang::as_label(p$mapping$fill),   "year")
})

test_that("K09: Question 4", {
  skip_incomplete(K09, 4)
  p <- parse_eval(str_match_q(K09, 4))

  expect_equal(rlang::as_label(p$mapping$shape), "continent")
})

test_that("K09: Question 5", {
  skip_incomplete(K09, 5)
  p <- parse_eval(str_match_q(K09, 5))

  expect_equal(rlang::as_label(p$mapping$colour), "continent")
  expect_equal(rlang::as_label(p$mapping$size),   "pop")
})

