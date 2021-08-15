# Intro to the Tidyverse by Colleen O'Briant

# In order to progress, all you need to do is fill in the blanks: __.
# Then run the code to make sure you're getting the desired result.
# Use hotkeys for this: highlight the code you want to run, or put
# your cursor at the end of the line. Then hit command + enter on a
# mac, or ctrl + enter on windows.

#-------------------------------------------------------------------------

# Exercise 10: ggplot 'geom's

#   In this chapter, we'll practice using some of the most commonly used 
#   'geom's, one by one. Keep in mind that you can use multiple 'geoms' at 
#   a time by layering them on top of each other.

#-------------------------------------------------------------------------

# Run this code to get started and to view the data:

library(tidyverse)
library(gapminder)
view(gapminder)

#-------------------------------------------------------------------------

# My favorite 'geom's for looking at the distribution of one variable:

#  'geom_histogram()',
#  'geom_freqpoly()',
#  'geom_area()',
#  'geom_density()'

#-------------------------------------------------------------------------

# 1. 'geom_histogram()'

# 1.1 Draw a histogram using 'geom_histogram()'.

ggplot(
  data = gapminder, 
  aes(x = lifeExp, color = continent, fill = continent)
  ) +
  __

# 1.2 Experiment with different 'binwidth's for your histogram.

ggplot(
  data = gapminder, 
  aes(x = lifeExp, color = continent, fill = continent)
  ) +
  __(binwidth = __)

#-------------------------------------------------------------------------

# 2. 'geom_freqpoly()'
#   'geom_freqpoly()' is just like a histogram, but it uses lines 
#   instead of bars to communicate the number of observations in each
#   bin. Again, experiment with binwidth.

ggplot(
  data = gapminder, aes(x = lifeExp, color = continent)
  ) +
  __(binwidth = __)

#-------------------------------------------------------------------------

# 3. 'geom_area()'
#   You can make a filled frequency polygon using an area plot:
#   'geom_area()'. 

# 3.1 In the blank, experiment with setting 'color' versus 'fill' as 
#   'continent'.

ggplot(
  data = gapminder, 
  aes(x = lifeExp, __ = continent)
  ) +
  geom_area(stat = "bin")

# 3.2 Notice that the continents are stacked up on top of each other in
# the previous plot. To change that behavior, set 'position = "identity"'

ggplot(
  data = gapminder, 
  aes(x = lifeExp, fill = continent)
  ) +
  geom_area(stat = "bin", position = __)

# 3.3 The issue now is that there's overplotting. Data for the Americas
# is totally hidden behind the other continents! One way to fix this is
# to adjust the transparency of points through 'alpha'. Setting 'alpha = .5'
# reduces the 'geom' transparency to 50%. Experiment with different alphas.

ggplot(
  data = gapminder, 
  aes(x = lifeExp, fill = continent)
  ) +
  geom_area(stat = "bin", position = "identity", alpha = __)

#-------------------------------------------------------------------------

# 4. 'geom_density()': 

#   An alternative to bin visualizations is density visualizations. 
#   They smooth out the distributions and account for factors like the fact 
#   that there aren't very many observations from Oceania. The downside 
#   is what's measured on the y-axis is less intuitive than the 'count' 
#   we've seen in the other 'geom's.

# 4.1 Experiment with setting 'color' and 'fill' to 'continent'.

ggplot(data = gapminder, aes(x = lifeExp, __)) +
  __()

# 4.2 Also experiment with different 'alpha's.

ggplot(data = gapminder, aes(x = lifeExp, __)) +
  __(alpha = __)

#-------------------------------------------------------------------------

# 5. Graphical primitives:

# 'geom_vline()' adds a vertical line
# 'geom_hline()' adds a horizontal line
# 'geom_segment()' adds a line segment
# 'geom_rect()' adds a rectangle
# 'annotate()' adds annotations to your plot

# 5.1 Add a vertical line to this plot.
#     Hint: for a vertical line, you'll need to specify an x-intercept
#     (and for a horizontal line, you'd need to specify a y-intercept).
#     Do this with 'xintercept = 70'.

ggplot(
  data = gapminder, 
  aes(x = lifeExp, color = continent, fill = continent)
  ) +
  geom_density(alpha = .3) +
  __

# 5.2 Include the vertical line you did above, and also note how the 
# annotation ('annotate()') labels the line.

ggplot(
  data = gapminder, 
  aes(x = lifeExp, color = continent, fill = continent)
  ) +
  geom_density(alpha = .3) +
  __ +
  annotate(
    "text", x = 70, y = .075, label = "70 years", angle = 90
    )

#-------------------------------------------------------------------------

# My favorite 'geom's for plots comparing a variable on the x-axis to a
# variable on the y-axis:

  # 'geom_point()'
  # 'geom_smooth()'
  # 'geom_line()'
  # 'geom_hex()'
  # 'geom_boxplot()'
  # 'geom_violin()'

#-------------------------------------------------------------------------

# 6. 'geom_point()'

# We've already talked about basic scatterplots. Try to recall how to draw
# a 'ggplot' that plots 'gdpPercap' on the x-axis and 'lifeExp' on the y-axis.

__

# 7. 'geom_smooth()'

# 7.1 Add a smoothed line layer to the plot you did above using 
# 'geom_smooth()'.

__

# 7.2 Remove the standard error ribbon using 'geom_smooth(se = FALSE)'

__

# 7.3 Visualize the OLS fit by using 'geom_smooth(method = "lm")'
# "lm" stands for "linear model".

__

#-------------------------------------------------------------------------

# 8. The visualization we made in 8) needs some work. The first issue is
# that there seems to be heteroskedasticity, so our fitted line is not a 
# good fit. A quick fix is to apply a log transformation to gdpPercap.

# 8.1 Instead of plotting 'gdpPercap' on the x-axis, plot the log of that 
# 'gdpPercap' using the 'log()' function.

ggplot(data = gapminder, aes(x = __, y = lifeExp)) +
  geom_point() +
  geom_smooth(method = "lm")

# Notice that the units on the x-axis of the previous plot are in log
#   terms, which is hard to interpret. I prefer this method:
#   Do a log transformation of the x-axis using 'scale_x_log10()',
#   and use 'labels = scales::comma' to suppress scientific notation on the
#   labels for the x-axis.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  scale_x_log10(labels = scales::comma) +
  geom_point() +
  geom_smooth(method = "lm")

# 8.2 The second issue is that there's overplotting near the center. I'd like
# a way to visualize how dense the points are getting. For this, we can
# replace 'geom_point()' with 'geom_hex()'.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  scale_x_log10(labels = scales::comma) +
  __ +
  geom_smooth(method = "lm")

#-------------------------------------------------------------------------

# 9. 'geom_line()'
# Draw a line plot using 'geom_line'. Compare US 'gdpPercap' over 
# time to two other countries of your choice.

gapminder %>%
  filter(country %in% c("United States", __, __)) %>%
  ggplot(aes(x = year, y = gdpPercap, color = country)) +
  geom_line()

#-------------------------------------------------------------------------

# 10. Draw a boxplot with 'geom_boxplot()' that compares the 
# gdpPercap (on the y-axis) of different continents (on the x-axis, 
# also using color). Experiment with applying a log transformation
# to gdpPercap (now on the y-axis).

ggplot(
  data = gapminder, 
  aes(x = gdoPercap, y = continent, color = continent)
  ) +
  __

#-------------------------------------------------------------------------

# 11. Change the plot from 10) to be a violin plot using 'geom_violin'.
# Also include 'fill'. Make sure you use 'scale_y_log10()' to transform the
# y-axis into log terms.

ggplot(
  data = gapminder, 
  aes(x = __, y = __, color = __, fill = __)
  ) +
  scale__ +
  __

#-------------------------------------------------------------------------

# Finally, check out how simple it is to change your 'facet_wrap' to 
# a slick animation with 'gganimate'!
# The 'facet_wrap' version:

ggplot(
  data = gapminder, 
  aes(x = log(gdpPercap), y = lifeExp)
  ) +
  geom_point(aes(color = continent)) +
  geom_density2d(color = "grey", alpha = .5) +
  facet_wrap(~ year)

# The animated version (this may take a second to render)

install.packages("gganimate")
library(gganimate)

ggplot(
  data = gapminder, 
  aes(x = log(gdpPercap), y = lifeExp)
  ) +
  geom_point(aes(color = continent)) +
  geom_density2d(color = "grey", alpha = .5) +
  gganimate::transition_time(year) +
  labs(title = "Year: {frame_time}")

#-------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
#   Make sure to return to this topic to meditate on it later.
#   To keep learning about ggplot, this is an excellent manual:
#      https://ggplot2-book.org/introduction.html
