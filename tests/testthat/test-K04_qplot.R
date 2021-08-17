K04 <- read_file("../../R/K04_qplot.R")

test_that("K04: Plot 1", {
  skip_incomplete(K04, 1)
  expect_equal(attr(parse_eval(str_match_q(K04, 1)), "class"), c("gg", "ggplot"))
})

test_that("K04: Plot 2", {
  skip_incomplete(K04, 2)
  expect_equal(attr(parse_eval(str_match_q(K04, 2)), "class"), c("gg", "ggplot"))
})

test_that("K04: Plot 3", {
  skip_incomplete(K04, 3)
  expect_equal(attr(parse_eval(str_match_q(K04, 3)), "class"), c("gg", "ggplot"))
})
