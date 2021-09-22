K08 <- read_file("../../R/K08_qplot_to_ggplot.R")

test_that("K08: Question 1", {
  skip_incomplete(K08, 1)
  p <- parse_eval(str_match_q(K08, 1))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomPoint")
})

test_that("K08: Question 2", {
  skip_incomplete(K08, 2)
  p <- parse_eval(str_match_q(K08, 2))
  expect_type(p$labels$title, "character")
})

test_that("K08: Question 3", {
  skip_incomplete(K08, 3)
  p <- parse_eval(str_match_q(K08, 3))
  expect_equal(class(p$layers[[1]]$geom)[[1]], "GeomPoint")
  expect_equal(class(p$layers[[2]]$geom)[[1]], "GeomLine")
  expect_equal(class(p$layers[[3]]$geom)[[1]], "GeomSmooth")
})
