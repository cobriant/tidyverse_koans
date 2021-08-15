#' ---
#' title: "Project 1: lm and qplot"
#' output: html_document
#' ---
#'
#' Grading: Each problem will be graded out of 2 points.  
#' 
#'   *  0 ~ missing (or near identical to another person's solution)
#'   *  1 ~ attempted but incomplete
#'   *  2 ~ well done
#'   *  3 ~ superior (only the very best solutions)
#'   
#' Recall that good code:  
#'  Solves the problem in the simplest way, that's also clear and readable 
#'  for others, with comments that tell readers why you're doing what you're 
#'  doing. Include comments in your solutions by starting the line with a '#',
#'  like this line.
#'
#' # Problem 1: lm
#'
#' Run this code to get started:
#'
#+ message = FALSE
library(tidyverse)
x <- 0:2
u <- c(2, -1, 2)
y <- -3 + 3*x + u

#' You now have access to 3 vectors of sample data: 'x', 'u', and 'y'.
#' 'u' is random noise that's drawn from a distribution with mean = 0,
#'   but in any given sample may not necessarily have mean = 0.
#' 'y' is generated from 'x' and 'u' according to the equation in line
#'   23. This is called the *true model* or the *data generating process*:
#'   it's how 'y' was truly generated.

#' Take a look at the contents of 'x', 'u', and 'y' by printing them to your 
#' console:

x
u
y

#' ### 1.1 Consider the model: $y_i = \beta_0 + \beta_1 x_i + u_i$.  
#' 
#'   Calculate OLS estimates for $\beta_0$ and $\beta_1$ using only these functions:  
#'   
#'   * Addition and subtraction: '+', '-'  
#'   * Multiplication and division: '*', '/'  
#'   * Square: '^2'  
#'   * and three others: 'mean()', 'sum()', and 'sqrt()' for square root.  
#'
#'    Don't just write the final answer, show how you got it using the above functions.
#' 
#' __  
#' 
#' After doing those calculations, check that they match the 'lm()' results:

tibble(x, y) %>%
  lm(y ~ x, data = .) %>%
  broom::tidy()

#' ### 1.2 Did the estimates for $\beta_0$ and $\beta_1$ come close to the true values?
#' 
#' __
#' 
#' ### 1.3 Calculate the fitted values $\hat{y}$ and the residuals e, using only the functions from 1.1.
#' 
#' __
#' 
#' Check that you have the correct answer:

tibble(x, y) %>%
  lm(y ~ x, data = .) %>%
  fitted.values()

tibble(x, y) %>%
  lm(y ~ x, data = .) %>%
  residuals()

#' ### 1.4 In words, explain what the conceptual difference is between u and e.
#' 
#' __
#' 
#' ### 1.5 In a regression, will 'mean(u)' [always/sometimes/never] be equal to 0? 
#' 
#' __
#' 
#' ### 1.6 In a regression, will 'mean(e)' [always/sometimes/never] be equal to 0? 
#' 
#' __
#' 
#' ### 1.7 Calculate the standard error of $\beta_1$ in the example, only using the functions from 1.1. Make sure to show how you got your answer.
#' 
#' __
#' 
#' Check that you have the correct answer.

tibble(x, y) %>%
  lm(y ~ x, data = .) %>%
  broom::tidy()



#' # Problem 2: qplot
#' 
#' This problem is open-ended. You'll create 3 visualizations of a small
#' dataset. You'll use 'qplot()' for drawing the graphs (or if you're already 
#' comfortable with 'ggplot', you're welcome to use that instead).
#' 
#' Run this code to get started:

library(tidyverse)

world_data <- tibble(
  country   = c("Brazil", "Brazil", "Brazil", "Brazil",
                "Haiti", "Haiti", "Haiti", "Haiti",
                "Puerto Rico", "Puerto Rico", "Puerto Rico", "Puerto Rico",
                "Colombia", "Colombia", "Colombia", "Colombia"),
  year      = c(1952, 1972, 1992, 2007, 1952, 1972, 1992, 2007,
                1952, 1972, 1992, 2007, 1952, 1972, 1992, 2007),
  gdpPercap = c(2108.944,  4985.711,  6950.283,  9065.801,
                1840.367,  1654.457,  1456.310,  1201.637,
                3081.960,  9123.042, 14641.587, 19328.709,
                2144.115,  3264.660,  5444.649,  7006.580),
  lifeExp   = c(50.9, 59.5, 67.1, 72.4, 37.6, 48, 55.1, 60.9, 
                64.3, 72.2, 73.9, 78.7, 50.6, 61.6, 68.4, 72.9)
)

#' Your data is called 'world_data'. It tells you the GDP per capita and
#' life expectancy for four different countries during four different years.

view(world_data)

#' Read the qelp docs for 'qplot()' to find out how to use it:

?qelp::qplot

#' Rubric:  
#' 
#' 1. Make 3 nice visualizations of different aspects of the data.
#' 2. You should use 'color' or 'fill' at least once, 
#' 3. Every plot should showcase at least one unique geom so that over
#'    the course of your 3 plots you show at least 3 different geoms, 
#' 4. Each plot should have a title, and 
#' 5. Write comments in your code that explain a little about *why* you're
#'    doing what you're doing.
#' 
#' Write your code for your 3 plots here:
#' 
#' ### Plot 1:
#' 
#' __
#' 
#' ### Plot 2:
#' 
#' __
#' 
#' ### Plot 3:
#' 
#' __
#' 