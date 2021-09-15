#-------------------------------------------------------------------------
#            Intro to the Tidyverse by Colleen O'Briant
#                      Koan #11: Stats in R
#-------------------------------------------------------------------------

# In order to progress:
# 1. Read all instructions carefully.
# 2. When you come to an exercise, fill in the blank and remove the hashtag
#    (Ctrl/Cmd Shift C) to execute the code in the console (Ctrl/Cmd Return).
#    If the piece of code spans multiple lines, highlight the whole chunk
#    or simply put your cursor at the end of the last line.
# 3. Test that your answers are correct (Ctrl/Cmd Shift T)

#-------------------------------------------------------------------------

# Statistical Distributions in R

# The first section of this exercise is an example of how to work with the
# normal distribution in R for random number generation, plots, and
# hypothesis testing.

# In the three sections that follow, you'll practice the same thing but
# with the t distribution, the F distribution, and the Chi-square
# distribution.

# Run this code to get started:

library(tidyverse)

#-------------------------------------------------------------------------
# --- The normal distribution --------------------------------------------
#-------------------------------------------------------------------------

#  Read the help docs here:
?rnorm

# --- rnorm() ------------------------------------------------------------
# Random generation: 'rnorm(n, mean, sd)' (r is for random)
#   This generates a vector of n random numbers from the normal (0, 1)
#   distribution:

rnorm(n = 10, mean = 0, sd = 1)

# --- dnorm() ------------------------------------------------------------
# Here I use 'dnorm' (d is for density) to draw the normal distribution
#   in a ggplot.

ggplot() +
  stat_function(
    fun = dnorm,
    args = list(mean = 0, sd = 1),
    geom = "line"
    ) +
  xlim(-5, 5)

# --- qnorm() ------------------------------------------------------------
# Hypothesis testing using 'qnorm()' (q for quantile):

# Is a test statistic of 1.6 in the accept region or the reject region?
#  This looks up the critical value for the normal distribution for a
#  two-sided test at the 5% level.

qnorm(p = .975, mean = 0, sd = 1)

# This  will tell you if 1.6 exceeds that critical value:

1.6 > qnorm(p = .975, mean = 0, sd = 1)

# --- Visualize the hypothesis test using ggplot: ------------------------

ggplot() +
  stat_function(fun = dnorm, args = list(mean = 0, sd = 1), geom = "line") +
  stat_function(fun = dnorm, args = list(mean = 0, sd = 1), geom = "area",
                fill = "red", xlim = c(qnorm(.975), 5)) +
  xlim(-5, 5) +
  geom_vline(xintercept = 1.6, color = "blue")

#-------------------------------------------------------------------------
# --- The t distribution -------------------------------------------------
#-------------------------------------------------------------------------

#  Read the help docs here:
?rt

# --- rt() ---------------------------------------------------------------
# 1. Generate 8 random numbers from the t distribution with 55 degrees of
# freedom.

#1@

# __

#@1

# --- dt() ---------------------------------------------------------------
# 2. Draw the t distribution (with 55 degrees of freedom) in a ggplot.

#2@

# __

#@2

# --- qt() ----------------------------------------------------------------
# 3. Is a test statistic of 2.2 in the accept region or the reject region?
# Conduct a two-sided test at the 5% level using 55 degrees of freedom.

#3@

# __

#@3

# --- 4. Visualize the hypothesis test using ggplot: ----------------------

#4@

# __

#@4

#-------------------------------------------------------------------------
# --- The F distribution -------------------------------------------------
#-------------------------------------------------------------------------

#  Read the help docs here:
?rf

# --- rf() ---------------------------------------------------------------
# 5. Generate 10 random numbers from the F distribution with 10 degrees of
# freedom in the numerator and 20 degrees of freedom in the denominator.

#5@

# __

#@5

# --- df() ---------------------------------------------------------------
# 6. Draw the F distribution in a ggplot. Continue to use the degrees of
# freedom in question 5.

#6@

# __

#@6

# --- qf() ----------------------------------------------------------------
# 7. Is a test statistic of 2.2 in the accept region or the reject region?
# Perform a one-tailed test at the 5% level.

#7@

# __

#@7

# --- 8. Visualize the hypothesis test using ggplot: ----------------------

#8@

# __

#@8


#-------------------------------------------------------------------------
# --- The Chi-square distribution ----------------------------------------
# ------------------------------------------------------------------------

#  Read the help docs here:
?rchisq

# --- rchisq() -----------------------------------------------------------
# 9. Generate 10 random numbers from the chi-square distribution with 4
# degrees of freedom.

#9@

# __

#@9


# --- dchisq() -----------------------------------------------------------
# 10. Draw the Chi-square distribution in a ggplot. Continue to use the
# degrees of freedom in question 9.

#10@

# __

#@10


# --- qchisq() -------------------------------------------------------------
# 11. Is a test statistic of 13 in the accept region or the reject region
#  for a 95% one-tailed test?

#11@

# __

#@11


# --- 12. Visualize the hypothesis test using ggplot: ----------------------

#12@

# __

#@12


#-------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.
