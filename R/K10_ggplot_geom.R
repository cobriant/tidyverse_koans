#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                             Koan #10: ggplot geoms
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

# In this koan, you'll practice using some of the most commonly used 'geom's,
# one by one. Keep in mind that you can use multiple 'geoms' at a time by
# layering them on top of each other.

# Run this code to get started:

library(tidyverse)
library(gapminder)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# My favorite 'geom's for looking at the distribution of one variable:

#  'geom_histogram()',
#  'geom_freqpoly()',
#  'geom_area()',
#  'geom_density()'

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                           ----- geom_histogram -----

# 1. Draw a histogram to visualize lifeExp using geom_histogram(). -------------

#01@

# ggplot(
#   data = gapminder,
#   aes(x = lifeExp, color = continent, fill = continent)
#   ) +
#   __

#@01

# 2. Experiment with different binwidths for your histogram. -------------------

#02@

# ggplot(
#   data = gapminder,
#   aes(x = lifeExp, color = continent, fill = continent)
#   ) +
#   __(binwidth = __)

#@02

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                           ----- geom_freqpoly -----
#
# 3. geom_freqpoly() is just like a histogram, but it uses lines instead -------
# of bars to communicate the number of observations in each bin. Again,
# experiment with binwidth.

#03@

# ggplot(
#   data = gapminder, aes(x = lifeExp, color = continent)
#   ) +
#   __(binwidth = __)

#@03

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                             ----- geom_area -----
#
# 4. Make a filled frequency polygon using an area plot: geom_area(). In -------
# the blank, experiment with setting 'color' versus 'fill' as 'continent'.

#04@

# ggplot(data = gapminder, aes(x = lifeExp, __ = continent)) +
#   geom_area(stat = "bin")

#@04

# 5. Notice that the continents are stacked up on top of each other in ---------
# the previous plot. To change that behavior, set position = "dodge".

#05@

# ggplot(data = gapminder, aes(x = lifeExp, fill = continent)) +
#   geom_area(stat = "bin", position = __)

#@05

# 6. The issue now is that there's overplotting. Data for the Americas ---------
# is totally hidden behind the other continents! One way to fix this is
# to adjust the transparency of points through 'alpha'. Setting 'alpha = .5'
# reduces the 'geom' transparency to 50%. Experiment with different alphas.

#06@

# ggplot(data = gapminder, aes(x = lifeExp, fill = continent)) +
#   geom_area(stat = "bin", position = "dodge", alpha = __)

#@06

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                            ----- geom_density -----
#
# An alternative to bin visualizations is density visualizations. They smooth
# out the distributions and account for factors like the fact that there aren't
# very many observations from Oceania. The downside is what's measured on the
# y-axis is less intuitive than the 'count' we've seen in the other geoms.

# 7. Experiment with setting 'color' and 'fill' to 'continent'. ----------------

#07@

# ggplot(data = gapminder, aes(x = lifeExp, __)) +
#   __()

#@07

# 8 With geom_density and fill, experiment with different alpha's. -------------

#08@

# ggplot(data = gapminder, aes(x = lifeExp, __)) +
#   __(alpha = __)

#@08

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                    ----- Graphical primitives to know -----
#
# geom_vline() adds a vertical line
# geom_hline() adds a horizontal line
# geom_segment() adds a line segment
# geom_rect() adds a rectangle
# annotate() adds annotations inside the plot

# 9. Add a vertical line to this plot. -----------------------------------------
#     Hint: for a vertical line, you'll need to specify an x-intercept
#     (and for a horizontal line, you'd need to specify a y-intercept).
#     Do this with 'xintercept = 70'.

#09@

# ggplot(data = gapminder, aes(x = lifeExp, color = continent, fill = continent)) +
#   geom_density(alpha = .3) +
#   __

#@09


# 10. Include the vertical line you did above, and also note how the -----------
# annotation ('annotate()') labels the line.

#10@

# ggplot(
#   data = gapminder,
#   aes(x = lifeExp, color = continent, fill = continent)
#   ) +
#   geom_density(alpha = .3) +
#   __ +
#   annotate(
#     "text", x = 70, y = .075, label = "70 years", angle = 90
#     )

#@10

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                       ----- Variables on both axis -----
#
# My favorite 'geom's for plots comparing a variable on the x-axis to a
# variable on the y-axis:

# geom_point()
# geom_smooth()
# geom_line()
# geom_hex()
# geom_boxplot()
# geom_violin()

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 11. We've already talked about basic scatterplots. Try to recall how to ------
# draw a ggplot that plots 'gdpPercap' on the x-axis and 'lifeExp' on the
# y-axis.

#11@

# __

#@11


# 12. Add a smoothed line layer to the plot you did above using ----------------
# geom_smooth().

#12@

# __

#@12


# 13. Remove the standard error ribbon using geom_smooth(se = FALSE). ----------

#13@

# __

#@13


# 14. Visualize the OLS fit by using geom_smooth(method = "lm"). ---------------
#    "lm" stands for "linear model".

#14@

# __

#@14

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# The visualization we made in 14) needs some work. The first issue is that a
# linear specification does not seem to fit very well. Let's try applying a log
# transformation to gdpPercap.

# 15. Instead of plotting 'gdpPercap' on the x-axis, plot the log of -----------
# 'gdpPercap' using log(). You should find that a linear model seems to fit this
# transformation much better.

#15@

# ggplot(data = gapminder, aes(x = __, y = lifeExp)) +
#   geom_point() +
#   geom_smooth(method = "lm")

#@15


# Notice that the units on the x-axis of the previous plot are in log terms,
# which is hard to interpret. I prefer this method: Do a log transformation of
# the x-axis using 'scale_x_log10()', and use 'labels = scales::comma' to
# suppress scientific notation on the labels for the x-axis.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  scale_x_log10(labels = scales::comma) +
  geom_point() +
  geom_smooth(method = "lm")

# 16. The second issue is that there's over-plotting near the center. I'd ------
# like a way to visualize how dense the points are getting. For this, we can
# replace 'geom_point()' with 'geom_hex()'.

#16@

# ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
#   scale_x_log10(labels = scales::comma) +
#   __ +
#   geom_smooth(method = "lm")

#@16

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 17. Draw a line plot using 'geom_line'. Compare US 'gdpPercap' over time -----
# to two other countries of your choice.

#17@

# gapminder %>%
#   filter(country %in% c("United States", __, __)) %>%
#   ggplot(aes(x = year, y = gdpPercap, color = country)) +
#   geom_line()

#@17

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 18. Draw a boxplot with geom_boxplot() that compares the gdpPercap (on -------
# the y-axis) of different continents (on the x-axis, also using color).
# Experiment with applying a log transformation to gdpPercap (now on the y-axis).

#18@

# ggplot(
#   data = gapminder,
#   aes(x = continent, y = gdpPercap, color = continent)
#   ) +
#   __

#@18

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 19. Change the plot from 10) to be a violin plot using 'geom_violin'. --------
# Also include 'fill'. Make sure you use 'scale_y_log10()' to transform the
# y-axis into log terms.

#19@

# ggplot(
#   data = gapminder,
#   aes(x = __, y = __, color = __, fill = __)
#   ) +
#   scale__ +
#   __

#@19

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Finally, check out how simple it is to change your 'facet_wrap' to a slick
# animation with 'gganimate'! The 'facet_wrap' version:

ggplot(
  data = gapminder,
  aes(x = log(gdpPercap), y = lifeExp)
) +
  geom_point(aes(color = continent)) +
  geom_density2d(color = "grey", alpha = .5) +
  facet_wrap(~ year)

# The animated version (this may take a second to render, also some of you may
# have trouble installing gganimate. If that's you, don't stress over this,
# leave the code below commented out.)

# install.packages("gganimate", dependencies = T)
#
ggplot(
  data = gapminder,
  aes(x = log(gdpPercap), y = lifeExp)
  ) +
  geom_point(aes(color = continent)) +
  geom_density2d(color = "grey", alpha = .5) +
  gganimate::transition_time(year) +
  labs(title = "Year: {frame_time}")

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.

# To keep learning about ggplot, this is an excellent manual:
#                   https://ggplot2-book.org/introduction.html
