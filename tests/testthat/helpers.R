library(tidyverse)
parse_eval <- function(string){
  eval(parse(text = string))
}
str_match_p <- function(k, q){
  str_match(k, paste0("(?!#", q, "@\\n\\n).+(?=\\n\\n#@", q, ")"))
}
str_match_q <- function(k, q){
  str_match(k, regex(paste0("(?<=#", q, "@\\n\\n).+(?=\\n\\n#@", q, ")"), dotall = TRUE))
}
skip_incomplete <- function(k, q){
  skip_if(is.null(parse_eval(str_match_q(k, q))), message = "incomplete")
}

