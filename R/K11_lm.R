#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                                 Koan #11: lm()
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In order to progress:
# 1. Read all instructions carefully.
# 2. When you come to an exercise, fill in the blank, un-comment the line
#    (Ctrl/Cmd Shift C), and execute the code in the console (Ctrl/Cmd Return).
#    If the piece of code spans multiple lines, highlight the whole chunk or
#    simply put your cursor at the end of the last line.
# 3. Test that your answers are correct (Ctrl/Cmd Shift T)
# 4. Save (Ctrl/Cmd S).

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In this koan, you'll learn how to use lm() to estimate models with:

#   * log transformations,
#   * a squared term,
#   * no intercept,
#   * categorical variables (called "factors"),
#   * and interactions between variables.

# Run this code to get started:
library(tidyverse)
library(gapminder)

# Read the qelp docs on lm():
?qelp::lm

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#             ----- Estimates, Standard Errors, and R-Squared -----

# 1. Simple Regression: How much can a $1 increase to a country's GDP per ------
# capita be expected to boost that country's life expectancy?
# Recall the lm() syntax is: lm(y ~ x, data = gapminder)

#01@

# lm(__)

# A $1 increase to a country's GDP per capita can be associated with a __ year
# increase in life expectancy.

#@01


# lm() prints very limited information. Usually we'd at least want to know the
# standard errors along with the coefficients. Practice piping the lm() call
# into `broom::tidy(conf.int = TRUE)` to get a tidied results table that shows
# you standard errors, test statistics, p-values, and even 95% confidence
# intervals.

# 2. Pipe the simple regression from question 1 into ---------------------------
# `broom::tidy(conf.int = TRUE)`. Is the coefficient on `gdpPercap` greater
# than 0 at the 1% level?

#02@

# lm(__) %>%
#   broom::tidy(conf.int = TRUE)

# The coefficient on `gdpPercap` __ greater than 0 at the 1% level.
# (In the blank above, write "is" or "is not".)

#@02


# 3. To see the regression's r-squared, pipe the lm() call into ----------------
# `broom::glance()`.

#03@

# lm(__) %>%
#   broom::glance()

# This model explains __% of the variation in lifeExp.

#@03

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                    ----- Fitted Values and Residuals -----
#
# In this class, we'll sometimes need to access fitted values and residuals from
# an lm() call. You should use the functions fitted.values() and residuals() to
# do that.

# 4. Pipe the simple regression into fitted.values() to get a vector of --------
# length 1704 (the same length as the number of rows of gapminder).

#04@

# lm(__) %>%
#   __

#@04


# 5. Pipe the simple regression into residuals() to get another vector ---------
# of length 1704. Recall that the fitted values plus the residuals will be equal
# to the observed values for lifeExp.

#05@

# lm(__) %>%
#   __

#@05

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                      ----- Transforming Variables ------
#
# 6. Take the simple regression we've been working on and apply a log ----------
# transformation to both the dependent variable and the explanatory variable by
# wrapping the variable names in the function log():
# lm(log(y) ~ log(x), data = gapminder).

#06@

# lm(__) %>%
#   broom::tidy(conf.int = TRUE)

# When GDP per capita increases by 1%, life expectancy will increase by __%.

#@06


# 7. Instead of applying log() to both the dependent and explanatory -----------
# variable, apply it only to the explanatory variable. Does the R-squared
# improve?

#07@

# lm(__) %>%
#   broom::glance()

#@07


# 8. Instead of doing a log transformation, try taking the square --------------
# of gdpPercap. You'll need to wrap the transformation in I(), which "inhibits
# the interpretation" of arithmetic operators like "+", "-", "*", and "^" in
# formulas. So the formula will look like: lm(y ~ I(x^2), data = gapminder).
# What's the R-squared now? Does a log transformation, square transformation,
# or no transformation at all of gdpPercap seem to be the best fit?

#08@

# lm(__) %>%
#   broom::glance()

# This model explains __% of the variation in lifeExp.

#@08

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 9. If you wanted to omit the intercept term, you can do that like this: ------
#    lm(y ~ 0 + x, data = gapminder). Take the simple regression and omit
#    the intercept.

#09@

# lm(__) %>%
#   broom::tidy(conf.int = TRUE)

#@09


# 10. Take the simple regression we've been working on and add a second --------
# explanatory variable: 'year'.

#10@

# lm(__ ~ __ + __, data = __) %>%
#   broom::tidy(conf.int = TRUE)

# Every year, a country's life expectancy is expected to increase by __ years.

#@10


# 11. Take out 'year' from the model and add 'continent'. This variable --------
# is different from the numerical variables we've been working with (lifeExp,
# gdpPercap, and year are all numeric). 'continent' is a "factor" variable,
# which means the data is categorical rather than numeric. When you add
# 'continent', lm() lets different continents have different intercepts.

#11@

# lm(__ ~ __ + __, data = __) %>%
#   broom::tidy(conf.int = TRUE)

# What happened to Africa? One level has to be omitted to avoid the dummy
# variable trap. So the intercept is the OLS prediction for the intercept for
# Africa. It's saying that if a country in Africa has a GDP per capita of $0
# (which is nonsense), the life expectancy of the people in that country is
# expected to be 47.9 years. The intercept for a country in the Americas is
# 47.9 + 13.6 = 61.5 years.

# Our model predicts that a country in Asia with $0 GDP per capita will have a
# life expectancy of __ years.

#@11

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In the previous question, we learned that you can allow different continents
# to have different *intercepts* by including 'continent' as an explanatory
# variable.

# You can also allow different continents to have different *slopes* by
# including an interaction between 'continent' and another variable like
# 'gdpPercap'.

# 12. Estimate a model of lifeExp where the explanatory variable is ------------
# the interaction between 'gdpPercap' and 'continent'. Hint: an interaction
# between x and z is done like this: lm(y ~ x:z, data = gapminder)

#12@

# lm(__) %>%
#   broom::tidy(conf.int = TRUE)

# According to our model, a $1 larger GDP per capita can be associated with a
# __ year higher life expectancy in Europe.

#@12


# Note: When you include interactions between variables, you usually also
# include the variables by themselves: y ~ x + z + x:z. That way, you're letting
# both the slope and the intercept vary by the variables. A shorthand for that
# specification is this: y ~ x*z.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.

# If you're ready, you can move on to koan 12: stats in R.
