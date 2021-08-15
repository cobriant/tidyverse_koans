context("Test koan 1: vectors")
library(tidyverse)
parse_eval <- function(string){
  eval(parse(text = string))
}
K01 <- read_file("../../R_solved/K01_vector.R")
test_that("Please meditate on the following: Question 1", {
  expect_equal(
    parse_eval(str_match(K01, "(?!#1@\\n\\n).+(?=\\n\\n#@1)"))[1],
    6
  )
  print("Question 1 has expanded your awareness.")
})

test_that("Please meditate on the following: Question 2", {
  expect_equal(
    parse_eval(str_match(K01, "(?!#2@\\n\\n).+(?=\\n\\n#@2)"))[3],
    "economics"
  )
  print("Question 2 has expanded your awareness.")
})

test_that("Please meditate on the following: Question 3a", {
  expect_equal(
    parse_eval(str_match(K01, "(?!#3a@\\n\\n).+(?=\\n\\n#@3a)")),
    c(T, T, T)
  )
  expect_equal(
    sum(parse_eval(str_match(K01, "(?!#3a@\\n\\n).+(?===)"))),
    17
  )
  print("Question 3a has expanded your awareness.")
})

  
  
  