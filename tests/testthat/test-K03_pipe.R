K03 <- read_file("../../R/K03_pipe.R")

test_that("K03: Question 1", {
  skip_incomplete(K03, 1)
  expect_equal(str_match_q(K03, 1), matrix("us_data %>% nrow()"))
})
