K16 <- read_file("../../R/K16_more_map.R")
# K16 <- read_file("R/K16_more_map.R")

test_that("K16: Question 1", {
  skip_if(is.null(parse_eval(str_match_f(K16, "01"))), message = "incomplete")
  ans <- parse_eval(str_match_f(K16, "01"))
  expect_equal(ans[[1]], 3)
  expect_equal(ans[[2]], 6)
  expect_equal(ans[[3]], 9)
})

test_that("K16: Question 2", {
  skip_if(is.null(parse_eval(str_match_f(K16, "02"))), message = "incomplete")
  ans <- parse_eval(str_match_f(K16, "02"))
  expect_equal(ans[[1]], 3)
  expect_equal(ans[[2]], 6)
  expect_equal(ans[[3]], 9)
})

test_that("K16: Question 3", {
  skip_if(is.null(parse_eval(str_match_f(K16, "03"))), message = "incomplete")
  ans <- parse_eval(str_match_f(K16, "03"))
  expect_equal(ans[[1]], 3)
  expect_equal(ans[[2]], 6)
  expect_equal(ans[[3]], 9)
})

test_that("K16: Question 4", {
  skip_if(is.null(parse_eval(str_match_f(K16, "04"))), message = "incomplete")
  ans <- parse_eval(str_match_f(K16, "04"))
  expect_equal(nrow(ans), 10000)
})

test_that("K16: Question 5", {
  skip_if(is.null(parse_eval(str_match_f(K16, "05"))), message = "incomplete")
  ans <- parse_eval(str_match_f(K16, "05"))
  expect_equal(ncol(ans), 3)
})

test_that("K16: Question 6", {
  skip_if(is.null(parse_eval(str_match_f(K16, "06"))), message = "incomplete")
  ans <- parse_eval(str_match_f(K16, "06"))
  expect_equal(nrow(ans), 2)
})

test_that("K16: Question 7", {
  skip_if(is.null(parse_eval(str_match_f(K16, "07"))), message = "incomplete")
  ans <- parse_eval(str_match_f(K16, "07"))
  expect_equal(length(ans), 100)
})

test_that("K16: Question 8", {
  skip_if(is.null(parse_eval(str_match_f(K16, "08"))), message = "incomplete")
  ans <- parse_eval(str_match_f(K16, "08"))
  expect_equal(nrow(ans), 100)
})

test_that("K16: Question 9", {
  skip_if(is.null(parse_eval(str_match_f(K16, "09"))), message = "incomplete")
  p <- parse_eval(str_match_f(K16, "09"))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomDensity")
})

test_that("K16: Question 10", {
  skip_if(is.null(parse_eval(str_match_f(K16, "10"))), message = "incomplete")
  p <- parse_eval(str_match_f(K16, "10"))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomDensity")
})

