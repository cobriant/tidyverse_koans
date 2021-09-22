K11 <- read_file("../../R/K11_lm.R")

test_that("K11: Question 1", {
  skip_incomplete(K11, "01")
  r <- parse_eval(str_match_q(K11, "01"))
  expect_equal(r$call, expr(lm(formula = lifeExp ~ gdpPercap, data = gapminder)))
})

test_that("K11: Question 2", {
  skip_incomplete(K11, "02")
  r <- parse_eval(str_match_q(K11, "02"))
  expect_equal(r[[2, 1]], "gdpPercap")
})

test_that("K11: Question 3", {
  skip_incomplete(K11, "03")
  r <- parse_eval(str_match_q(K11, "03"))
  expect_equal(names(r)[[1]], "r.squared")
})

test_that("K11: Question 4", {
  skip_incomplete(K11, "04")
  r <- parse_eval(str_match_q(K11, "04"))
  expect_equal(length(r), 1704)
})

test_that("K11: Question 5", {
  skip_incomplete(K11, "05")
  r <- parse_eval(str_match_q(K11, "05"))
  expect_equal(length(r), 1704)
})

test_that("K11: Question 6", {
  skip_incomplete(K11, "06")
  r <- parse_eval(str_match_q(K11, "06"))
  expect_equal(r[[2, 1]], "log(gdpPercap)")
})

test_that("K11: Question 7", {
  skip_incomplete(K11, "07")
  r <- parse_eval(str_match_q(K11, "07"))
  expect_equal(round(r[[1, 1]], digits = 1), .7)
})

test_that("K11: Question 8", {
  skip_incomplete(K11, "08")
  r <- parse_eval(str_match_q(K11, "08"))
  expect_equal(round(r[[1, 1]], digits = 2), .05)
})

test_that("K11: Question 9", {
  skip_incomplete(K11, "09")
  r <- parse_eval(str_match_q(K11, "09"))
  expect_equal(round(r[[1, 2]], digits = 3), .003)
})

test_that("K11: Question 10", {
  skip_incomplete(K11, "10")
  r <- parse_eval(str_match_q(K11, "10"))
  expect_equal(round(r[[3, 2]], digits = 1), .2)
})

test_that("K11: Question 11", {
  skip_incomplete(K11, "11")
  r <- parse_eval(str_match_q(K11, "11"))
  expect_equal(round(r[[6, 2]], digits = 1), 18.1)
})

test_that("K12: Question 12", {
  skip_incomplete(K11, "12")
  r <- parse_eval(str_match_q(K11, "12"))
  expect_equal(round(r[[1, 2]], digits = 1), 53.7)
})



