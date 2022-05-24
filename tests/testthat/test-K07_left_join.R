K07 <- read_file("../../R/K07_left_join.R")

test_that("K07: Question 1", {
  skip_incomplete(K07, 1)
  expect_equal(names(parse_eval(str_match_q(K07, 1))),
               c("id",
                 "name",
                 "license_id",
                 "address_number",
                 "address_street_name",
                 "ssn"))
})

test_that("K07: Question 2", {
  skip_incomplete(K07, 2)
  expect_equal(ncol(parse_eval(str_match_q(K07, 2))), 1)
})

test_that("K07: Question 3", {
  skip_incomplete(K07, 3)
  expect_equal(parse_eval(str_match_q(K07, 3))[[1, 2]], 27)
})

test_that("K07: Question 4", {
  skip_incomplete(K07, 4)
  expect_error(parse_eval(str_match_q(K07, 4)), NA)
})

test_that("K07: Question 5", {
  skip_incomplete(K07, 5)
  expect_equal(ncol(parse_eval(str_match_q(K07, 5))), 7)
})

test_that("K07: Question 6", {
  skip_incomplete(K07, 6)
  expect_equal(parse_eval(str_match_q(K07, 6))[[1, "annual_income"]], 68100)
})

test_that("K07: Question 7", {
  skip_incomplete(K07, 7)
  expect_equal(ncol(parse_eval(str_match_q(K07, 7))), 15)
})
