K02 <- read_file("../../R/K02_tibble.R")

test_that("K02: Question 1", {
   skip_incomplete(K02, 1)
   expect_error(parse_eval(str_match_q(K02, 1)), NA)
})

test_that("K02: Question 2", {
  skip_incomplete(K02, 2)
  expect_equal(parse_eval(str_match_q(K02, 2)), T)
})

test_that("K02: Question 3", {
  skip_incomplete(K02, 3)
  expect_equal(parse_eval(str_match_q(K02, 3)), c(T, T, T))
})

test_that("K02: Question 4", {
  skip_incomplete(K02, 4)
  expect_equal(nrow(parse_eval(str_match_q(K02, 4))), 4)
})
