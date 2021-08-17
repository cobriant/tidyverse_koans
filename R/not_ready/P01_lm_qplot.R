# ---
# title: "Project 1: lm and qplot"
# output: html_document
# ---
#
# Grading: Each problem will be graded out of 2 points.
#
#   *  0 ~ missing (or near identical to another person's solution)
#   *  1 ~ attempted but incomplete
#   *  2 ~ well done
#   *  3 ~ superior (only the very best solutions)
#
# Recall that good code:
#  Solves the problem in the simplest way, that's also clear and readable
#  for others, with comments that tell readers why you're doing what you're
#  doing. Include comments in your solutions by starting the line with a '#,
#  like this line.
#
# # Problem 1: lm
#
# Run this code to get started:
#
#+ message = FALSE
library(tidyverse)
x <- 0:2
u <- c(2, -1, 2)
y <- -3 + 3*x + u

# You now have access to 3 vectors of sample data: 'x', 'u', and 'y'.
# 'u' is random noise that's drawn from a distribution with mean = 0,
#   but in any given sample may not necessarily have mean = 0.
# 'y' is generated from 'x' and 'u' according to the equation in line
#   23. This is called the *true model* or the *data generating process*:
#   it's how 'y' was truly generated.

# Take a look at the contents of 'x', 'u', and 'y' by printing them to your
# console:

x
u
y

# ### 1.1 Consider the model: $y_i = \beta_0 + \beta_1 x_i + u_i$.
#
#   Calculate OLS estimates for $\beta_0$ and $\beta_1$ using only these functions:
#
#   * Addition and subtraction: '+', '-'
#   * Multiplication and division: '*', '/'
#   * Square: '^2'
#   * and three others: 'mean()', 'sum()', and 'sqrt()' for square root.
#
#    Don't just write the final answer, show how you got it using the above functions.
#
# __
#
# After doing those calculations, check that they match the 'lm()' results:

tibble(x, y) %>%
  lm(y ~ x, data = .) %>%
  broom::tidy()

# ### 1.2 Did the estimates for $\beta_0$ and $\beta_1$ come close to the true values?
#
# __
#
# ### 1.3 Calculate the fitted values $\hat{y}$ and the residuals e, using only the functions from 1.1.
#
# __
#
# Check that you have the correct answer:

tibble(x, y) %>%
  lm(y ~ x, data = .) %>%
  fitted.values()

tibble(x, y) %>%
  lm(y ~ x, data = .) %>%
  residuals()

# ### 1.4 In words, explain what the conceptual difference is between u and e.
#
# __
#
# ### 1.5 In a regression, will 'mean(u)' [always/sometimes/never] be equal to 0?
#
# __
#
# ### 1.6 In a regression, will 'mean(e)' [always/sometimes/never] be equal to 0?
#
# __
#
# ### 1.7 Calculate the standard error of $\beta_1$ in the example, only using the functions from 1.1. Make sure to show how you got your answer.
#
# __
#
# Check that you have the correct answer.

tibble(x, y) %>%
  lm(y ~ x, data = .) %>%
  broom::tidy()
