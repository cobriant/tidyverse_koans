# Intro to the Tidyverse by Colleen O'Briant

# In order to progress, all you need to do is fill in the blanks: __.
# Then run the code to make sure you're getting the desired result.
# Use hotkeys for this: highlight the code you want to run, or put
# your cursor at the end of the line. Then hit command + enter on a
# mac, or ctrl + enter on windows.

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

__

# --- dt() ---------------------------------------------------------------
# 2. Draw the t distribution (with 55 degrees of freedom) in a ggplot.

__

# --- qt() ----------------------------------------------------------------
# 3. Is a test statistic of 2.2 in the accept region or the reject region?
# Conduct a two-sided test at the 5% level using 55 degrees of freedom.

__

# --- 4. Visualize the hypothesis test using ggplot: ----------------------

__

#-------------------------------------------------------------------------
# --- The F distribution -------------------------------------------------
#-------------------------------------------------------------------------

#  Read the help docs here:
?rf

# --- rf() ---------------------------------------------------------------
# 5. Generate 10 random numbers from the F distribution with 10 degrees of 
# freedom in the numerator and 20 degrees of freedom in the denominator.

__

# --- df() ---------------------------------------------------------------
# 6. Draw the F distribution in a ggplot. Continue to use the degrees of
# freedom in question 5.

__

# --- qf() ----------------------------------------------------------------
# 7. Is a test statistic of 2.2 in the accept region or the reject region?
# Perform a one-tailed test at the 5% level.

__

# --- 8. Visualize the hypothesis test using ggplot: ----------------------

__


#-------------------------------------------------------------------------
# --- The Chi-square distribution ----------------------------------------
# ------------------------------------------------------------------------

#  Read the help docs here:
?rchisq

# --- rchisq() -----------------------------------------------------------
# 9. Generate 10 random numbers from the chi-square distribution with 4
# degrees of freedom.

__


# --- dchisq() -----------------------------------------------------------
# 10. Draw the Chi-square distribution in a ggplot. Continue to use the 
# degrees of freedom in question 9.

__


# --- qchisq() -------------------------------------------------------------
# 11. Is a test statistic of 13 in the accept region or the reject region 
#  for a 95% one-tailed test?

__


# --- 12. Visualize the hypothesis test using ggplot: ----------------------

__


#-------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.
