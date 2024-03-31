#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                              Koan #12: Stats in R
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# To complete this assignment, edit this R script inside the brackets for
# question 1, for example: between #1@ and @#1. Un-comment the line to make it
# live code instead of a comment (Ctrl Shift C on Windows; Cmd Shift C on Macs),
# save your progress (Ctrl/Cmd S), execute the code in the console (put your
# cursor in the piece of code and hit Ctrl/Cmd Return), and test your answer by
# running the test file (Ctrl/Cmd Shift T). When you've passed all tests, compile
# ("knit") the script to html (Ctrl/Cmd Shift K) and turn the html file in on
# Canvas.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Statistical Distributions in R

# The first section of this exercise is an example of how to work with the
# normal distribution in R for random number generation, plots, and hypothesis
# testing.

# In the three sections that follow, you'll practice the same thing but with the
# t distribution and the F distribution.

# Run this code to get started:
library(tidyverse)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                      ----- The normal distribution -----

#  Read the help docs here:
?rnorm

#                              ----- rnorm() -----
# Random generation: 'rnorm(n, mean, sd)' (r is for random). This generates a
# vector of n random numbers from the normal (0, 1) distribution:

rnorm(n = 10, mean = 0, sd = 1)

#                              ----- dnorm() -----
# Here I use 'dnorm' (d is for density) to draw the density of the normal
# distribution in a ggplot.

ggplot() +
  stat_function(
    fun = dnorm,
    args = list(mean = 0, sd = 1),
    geom = "line"
  ) +
  xlim(-5, 5)

#                              ----- qnorm() -----
# Hypothesis testing using 'qnorm()' (q for quantile):
# Is a test statistic of 1.6 in the accept region or the reject region? This
# looks up the critical value for the normal distribution for a two-sided test
# at the 5% level.

qnorm(p = .975, mean = 0, sd = 1)

# This  will tell you if 1.6 exceeds that critical value:

1.6 > qnorm(p = .975, mean = 0, sd = 1)

# Visualize the hypothesis test using ggplot:

ggplot() +
  stat_function(fun = dnorm, args = list(mean = 0, sd = 1), geom = "line") +
  stat_function(fun = dnorm, args = list(mean = 0, sd = 1), geom = "area",
                fill = "red", xlim = c(qnorm(.975), 5)) +
  xlim(-5, 5) +
  geom_vline(xintercept = 1.6, color = "blue")


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                         ----- The t distribution -----
#
#  Read the help docs here:
?rt

#                                  --- rt() ---
# 1. Generate 8 random numbers from the t distribution with 55 degrees of ------
# freedom.

#01@

# __

#@01

#                                  --- dt() ---
# 2. Draw the t distribution (with 55 degrees of freedom) in a ggplot. ---------

#02@

# __

#@02

#                                  --- qt() ---
# 3. Is a test statistic of 2.2 in the accept region or the reject region? -----
# Conduct a two-sided test at the 5% level using 55 degrees of freedom.

#03@

# __

#@03

# 4. Visualize the hypothesis test using ggplot: -------------------------------

#04@

# __

#@04



#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                         ----- The F distribution -----
#
#  Read the help docs here:
?rf

#                                  --- rf() ---
# 5. Generate 10 random numbers from the F distribution with 10 degrees of -----
# freedom in the numerator and 20 degrees of freedom in the denominator.

#05@

# __

#@05

#                                  --- df() ---
# 6. Draw the F distribution in a ggplot. Continue to use the degrees of -------
# freedom in question 5.

#06@

# __

#@06

#                                  --- qf() ---
# 7. Is a test statistic of 2.2 in the accept region or the reject region? -----
# Perform a one-tailed test at the 5% level.

#07@

# __

#@07

# 8. Visualize the hypothesis test using ggplot: -------------------------------

#08@

# __

#@08

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.
