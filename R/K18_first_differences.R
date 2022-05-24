#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                          Koan #18: first differences
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

library(tidyverse)
library(gapminder)

# In class, we talked about first differences as a way to side-step the
# multicollinearity issue of including lags of an independent variable:

# If the true model is this:
# y_t = \beta_0 + \beta_1 x_t + \beta_2 x_{t-1} + u_t

# Then you can also estimate this and recover \beta_1 and \beta_2 without
# getting a large standard error on the coefficient for x_t:

# y_t = \alpha_0 + \alpha_1 x_t + \alpha_2 (x_t - x_{t-1}) + u_t

# Where \alpha_0 = \beta_0,
#       \alpha_1 = \beta_1 + \beta_2, and
#       \alpha_2 = -\beta_2.

# In the next few problems, we'll verify this is true using `gapminder`.

# 1. Create a new variable `gdpPercap_lag` that is the first lag of ------------
# `gdpPercap`. Make sure to `group_by` country so that we don't compare GDP's
# of different countries.

#01@

# gapminder %>%
#   group_by(__) %>%
#   mutate(gdpPercap_lag = __)

#@01


# 2. Lagging a variable is a transformation you can do inside `mutate` or ------
# inside lm() itself. Fill in the blanks below to estimate what we'll call
# model A:

# lifeExp_t = \beta_0 + \beta_1 log(gdpPercap)_t +
#             \beta_2 log(gdpPercap)_{t-1} + u_t

# Write down your estimates for \beta_0, \beta_1, and \beta_2. It doesn't matter
# whether you log() and then lag(), or lag() and then log().

#02@

# gapminder %>%
#   group_by(__) %>%
#   lm(__, data = .) %>%
#   broom::tidy()
#
# beta_0 <- __
# beta_1 <- __
# beta_2 <- __

#@02

# 3. Now estimate what we'll call model B, which includes a first --------------
# difference:

# lifeExp_t = \alpha_0 + \alpha_1 log(gdpPercap)_t +
#             \alpha_2 I(log(gdpPercap)_t - log(gdpPercap)_{t-1}) + u_t.

# Write down your estimates for \alpha_0, \alpha_1, and \alpha_2.

#03@

# gapminder %>%
#   group_by(__) %>%
#   lm(__ ~ __ + I(__), data = .) %>%
#   broom::tidy()
#
# alpha_0 <- __
# alpha_1 <- __
# alpha_2 <- __

#@03


# 4. Verify that the algebra we did in class works by running this code: -------
# Does estimating model B allow us to recover the estimates from model A with a
# smaller standard error for the coefficient on log(gdpPercap)_t?
# You should get TRUE's for all of the following:

#04@

# near(alpha_0, beta_0)
# near(alpha_1, beta_1 + beta_2)
# near(alpha_2, -beta_2)

#@04

# Note: we use near() instead of `==` because of something called "floating
# point imprecision" in computers. This demonstrates how `==` won't work, but
# near() will:

.1 + .2 == .3
near(.1 + .2, .3)

#' More info about floating point imprecision [here](https://www.techradar.com/news/computing/why-computers-suck-at-maths-644771?artc_pg=1).

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# It's also commonplace to see time series variables transformed into their
# first difference. This can be useful because it lets us focus on how the
# period-to-period change in a variable may effect the period-to-period change
# in another variable. It's a different question than asking how the level of a
# variable may effect the level of another variable. We'll explore this in the
# next few problems.

# 5. Use `ggplot()` to plot the lifeExp for the United States over time. -------

#05@

# gapminder %>%
#   filter(__) %>%
#   ggplot(aes(__)) +
#   geom_point() +
#   geom_line()

#@05

# Notice that lifeExp has a strong upward trend in the US. It will therefore
# correlate strongly with any other variable that has an upward time trend, and
# a regression between that variable and lifeExp will yield spurious results.
# We'll talk about this more next week in class, but for now, notice what
# happens to the time trend when we first difference lifeExp:

# 6. Take the plot above, but instead of plotting US lifeExp over time, --------
# now plot the first difference of US lifeExp (lifeExp_t - lifeExp_{t-1}) over
# time. You should see that the time trend disappears:

#06@

# gapminder %>%
#   filter(__) %>%
#   mutate(lifeExp_diff = __) %>%
#   ggplot(aes(__)) +
#   geom_point() +
#   geom_line()

#@06


# 7. Next we'll take the plot above, but add the time series for the first -----
# difference of gdpPercap. We'll also focus on Afghanistan rather than the
# United States.

#07@

# gapminder %>%
#   filter(__) %>%
#   mutate(
#     lifeExp_diff = __,
#     gdpPercap_diff = __,
#     ) %>%
#   ggplot() +
#   geom_line(aes(__)) +
#   geom_line(aes(__))

#@07

# 8. The plot above isn't very good at comparing the two time series -----------
# because changes in gdpPercap are so much larger than changes in lifeExp.
# Transform gdpPercap through multiplication, division, addition, or subtraction
# until patterns in both the variables are visually clear. I've also added an
# aesthetic mapping for linetype so that we can differentiate between the two
# series.

#08@

# gapminder %>%
#   filter(__) %>%
#   mutate(
#     lifeExp_diff = __,
#     gdpPercap_diff = __,
#   ) %>%
#   ggplot() +
#   geom_line(aes(x = year, y = lifeExp_diff, linetype = "Life Expectancy")) +
#   geom_line(
#     aes(x = year,
#         y = (gdpPercap_diff/__) + __,
#         linetype = "GDP per cap")
#     )

#@08


# 9. Finally, we'll add two vertical axis labels and a title to make the -------
# plot look really professional. The second axis should reverse the algebraic
# transformation you made to gdpPercap_diff. So if you divided and then added,
# the second axis should subtract and then multiply: the syntax is:
# ~ (. - 5)*50

#09@

# gapminder %>%
#   filter(__) %>%
#   mutate(
#     lifeExp_diff = __,
#     gdpPercap_diff = __)
#   ) %>%
#   ggplot() +
#   geom_line(aes(x = year, y = lifeExp_diff, linetype = "Life Expectancy")) +
#   geom_line(
#     aes(x = year,
#         y = (gdpPercap_diff/__) + __,
#         linetype = "GDP per cap")
#     ) +
#   scale_y_continuous(
#     "Change in Life Expectancy (Years)",
#     sec.axis = sec_axis(
#       ~ (. - __)*__,
#       name = "Change in GDP per Capita ($)"
#     )
#   ) +
#   labs(title = "GDP and Life Expectancy in Afghanistan")

#@09

# A plot like the one you made in 9 lets us visually inspect whether a bump to
# one variable (GDP per capita in this case) seems to cause a bump to another
# (Life Expectancy) in the same period, or in one or two periods ahead. This is
# the intuition behind a time series test called
#' [Granger Causality](https://en.wikipedia.org/wiki/Granger_causality).

# It's plain to see in this plot that increases in GDP per capita does not
# clearly cause a boost to life expectancy in Afghanistan: the relationship
# between the two variables may be a little more complicated, or it might be
# completely spurious!


# 10. Consider another country that isn't the US or Afghanistan, and draw a-----
# plot just like the plot in 9 for that country. Do increases in gdpPercap seem
# to Granger Cause increases in life expectancy there?

#10@

# gapminder %>%
#   filter(__) %>%
#   mutate(
#     lifeExp_diff = __,
#     gdpPercap_diff = __)
# ) %>%
#   ggplot() +
#   geom_line(aes(x = year, y = lifeExp_diff, linetype = "Life Expectancy")) +
#   geom_line(
#     aes(x = year,
#         y = (gdpPercap_diff/__) + __,
#         linetype = "GDP per cap")
#     ) +
#   scale_y_continuous(
#     "Change in Life Expectancy (Years)",
#     sec.axis = sec_axis(
#       ~ (. - __)*__,
#       name = "Change in GDP per Capita ($)"
#     )
#   ) +
#   labs(title = "GDP and Life Expectancy in __")

#@10

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.
