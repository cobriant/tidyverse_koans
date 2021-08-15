#' ---
#' title: "Project 7: Simulation with map(.x, .f)"
#' author: "Colleen O'Briant"
#' output: html_document
#' ---
#' 
#' Before starting this project, make sure to carefully review the intro to 
#' `map` from class. When you fill in all the blanks correctly, this document
#' will knit when you hit `Cmd + Shift + K` on macs, `Ctrl + Shift + K` on windows.
#' 
#' Run this code to get started:
#' 
#+ message = FALSE
library(tidyverse)
library(gapminder)

#' 
#' In class, we used 'map(.x, .f)' to generate a list of 100 sets of 10
#' random numbers with increasing standard deviations like this:
#' 
#+ eval = FALSE
map(.x = 1:100, .f = ~ rnorm(n = 10, mean = 0, sd = .x))

#' In that 'map' call, I used a formula to reference '.x' directly using 
#' the tilde symbol '~'. We saw you could also use anonymous or named functions:
#' 
  #' Anonymous functions:

#+ eval = FALSE
map(.x = 1:100, .f = function(input) rnorm(n = 10, mean = 0, sd = input))

  #' Named functions:

#+ eval = FALSE
rnorm_sd <- function(input){
  rnorm(n = 10, mean = 0, sd = input)
}

map(.x = 1:100, .f = rnorm_sd)

#' 
#' Suppose we want to take the vector 1:10 and multiply each element by 3.
#' Multiplication is vectorized, so this is clearly the best way:

(1:10)*3

#' But this will work as a simple example of `map(.x, .f)`.
#'
#' ## 1. Use a named function as `.f`:
#'

multiply_by_three <- function(a){
  __
}

map(.x = 1:5, .f = multiply_by_three)

#'
#' ## 2. Use an anonymous function as '.f':
#'

map(.x = 1:5, .f = function(a) __)

#'
#' ## 3. Use a formula as '.f':
#'

map(.x = 1:5, .f = ~ __ )

#' ## Simulations using 'map(.x, .f)':
#'
#' Last week, we worked on Breusch-Pagan tests as functions.
#' A simple version (with only one explanatory variable):
#' 

breusch_pagan <- function(tibble, y, x){
  tibble %>%
    mutate(
      resid = residuals(lm(paste(y, "~", x), tibble))
    ) %>%
    lm(paste("resid^2 ~ ", x), data = .) %>%
    broom::glance() %>%
    select(r.squared) %>%
    mutate(
      test_statistic = r.squared*nrow(tibble),
      critical_value = qchisq(.99, df = 1),
      heteroskedasticity = test_statistic > critical_value
    )
}

#' Testing that our function works:
breusch_pagan(gapminder, "lifeExp", "gdpPercap")

#' But how accurate is 'breusch_pagan'? How good of a job does it do at
#' detecting different types of heteroskedasticity? We're going to use
#' 'map(.x, .f)' to evaluate this.
#'
#' The plan:
#' 
#'  * generate 100 heteroskedastic datasets
#'  * run 'breusch_pagan' on each of them
#'  * count how many times 'breusch_pagan' accurately detects the heteroskedasticity
#'
#' ## 4. Generate a dataset 
#' 
#' That has two variables and 20 observations:
#' 
#'  * `income`, which takes values pulled from a Normal distribution
#'  * `consumption`, which takes values pulled from a Normal distribution,
#'        *where the standard deviation is a function of income like income^2*.
#'   (challenge: make sure these variables take on reasonable values)
#'  

tibble(
  income = __,
  consump = __
) %>%
  ggplot(aes(x = income, y = consump)) +
  geom_point() +
  geom_smooth(method = lm)

#' In the next few problems, make sure to copy-paste the tibble you defined
#' above (without the plotting).
#' 
#' ## 5. Does 'breusch_pagan' detect the heteroskedasticity once? 
#' 
#' Run this code a couple of times! You may get different answers because each
#'    dataset is generated randomly.
#'    

tibble(
  income = __,
  consump = __
  ) %>%
  breusch_pagan(y = "consump", x = "income")

#' 
#' ## 6. How many times out of 100 
#' 
#' does breusch_pagan detect the heteroskedasticity?
#'   We just want to take the code above and run it 100 times, counting the
#'   number of times 'breusch_pagan' outputs TRUE.
#'   Since we don't want to change anything each time we run the function, 
#'   I'll use .x = 1:100 and use function(...). 
#'   This way, our function simply executes 100 times with no changes.
#'   What do you need to do here? To define the function body in line 154,
#'   just take what you wrote in lines 131-135: that's what we want to repeat
#'   100 times.
#' 

map_dfr(
  .x = 1:100, 
  .f = function(...) {
    __
  }
  ) %>%
  count(heteroskedasticity)
# We can use 'count' (recall, count is the same as group by with summarize with n())
# to find the number of times heteroskedasticity is detected

#' 
#' ## 7. How many times was heteroskedasticity detected?
#' 
#' Go back and change your data generating process to make it so that
#' heteroskedasticity is detected more than 75% of the time. What aspect
#' of the data generating process made it more likely that `breusch-pagan`
#' would successfully detect the heteroskedasticity?
#' 