#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                       Koan #9: ggplot aesthetic mappings
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

# In this koan, you'll learn about ggplot aesthetic mappings ('aes').

#   Aesthetic mappings do just one simple thing: they take variables (columns)
#   in your data and map them to visual elements in your plot.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Run this code to get started:

library(tidyverse)
library(gapminder)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                            ----- x and y axis -----

# When you declare which variable should be represented on which axis, you're
# using an *aesthetic mapping* (taking variables in your data and mapping them
# to visual elements in your plot). That's why 'x = ' and 'y = ' are wrapped in
# 'aes()' in a ggplot.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Each point in the scatterplot above represents an observation (row): a certain
# country in a certain year. We can easily create different plots for each
# 'continent' using facet_wrap(). The tilde '~' can be read as "by". So by
# adding a facet layer, we "facet *by* continent". Make sure to take a look at
# the plot.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  facet_wrap(~ continent)

# 1. Change the plot above to facet by 'year' instead of faceting by -----------
# 'continent'.

#1@

# __

#@1

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                               ----- color -----

# An alternative to faceting is to use color as the plot aesthetic to
# differentiate between continents. So all the points in Africa will be red,
# Europe will be blue, etc. This is an 'aes'thetic mapping because we're taking
# a variable 'continent' and mapping it to the visual element 'color'.

# 2. Draw a scatterplot comparing gdpPercap and lifeExp, where different -------
# continents are drawn with different colors.

#2@

# ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = __)) +
#   geom_point()

#@2

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                                ----- fill -----
#
# 'color' is an aesthetic mapping which changes the color of the *outline* of
# the geometry. If instead you want to change the color of the *fill* of the
# geometry, use 'fill' instead of 'color'.

# To see both the 'color' and the 'fill' of a point, I'll use 'shape = 21':
# points with outlines.

# 3. Use 'color' to represent 'continent', and use 'fill' to represent ---------
# 'year'.

#3@

# ggplot(
#   data = gapminder,
#   aes(x = gdpPercap, y = lifeExp, color = __, fill = __)
#   ) +
#   geom_point(shape = 21)

#@3

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                               ----- shape -----
#
# A third aesthetic mapping is 'shape'. We actually just used 'shape' in
# the previous question, outside of the 'aes' call in 'geom_point'. That
# set the shape of the points to a fixed value (shape = 21: points with
# outlines).

# 4. Try mapping 'shape' to 'continent' *inside* of an aes() call. -------------

#4@

# ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
#   geom_point(aes(shape = __))

#@4

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In question 4, we specified an 'aes' in the 'ggplot()' call *and* in the
# 'geom_point()' call. Something that's important to understand is that layers
# like 'geom_point' which are added on to a ggplot call will inherit the data
# and the aesthetic mappings from that initial ggplot call by default. That's
# why all of these plots do the same thing:

# You can put all information in the ggplot() call:

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, shape = continent)) +
  geom_point()

# You can put some information in the ggplot() call and some in the geom_point()
# call:

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(shape = continent))

# You can put all information in the geom_point() call:

ggplot() +
  geom_point(data = gapminder, aes(x = gdpPercap, y = lifeExp, shape = continent))

# But warning: if you have multiple geom's and put all information in one of
# them, the other geom won't inherit that information.
# In this example, the geom_smooth() layer isn't drawn because it doesn't
# inherit any of the information it needs from ggplot().

ggplot() +
  geom_point(data = gapminder, aes(x = gdpPercap, y = lifeExp, shape = continent)) +
  geom_smooth()

# Instead, give geom_smooth() the information it needs either directly, or by
# putting the information in the ggplot() call. These two draw the same plot,
# but the second is better because it avoids unnecessary repetition in code,
# which makes it less clear and readable.

ggplot() +
  geom_point(data = gapminder, aes(x = gdpPercap, y = lifeExp, shape = continent)) +
  geom_smooth(data = gapminder, aes(x = gdpPercap, y = lifeExp))

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(shape = continent)) +
  geom_smooth()

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                                ----- size -----
#
# 5. So far we have 3 aesthetic mappings other than x and y axis: --------------
# They are 'color', 'fill', and 'shape'. The last 'aes' we'll talk about is
# 'size', which adjusts point size. Add 2 'aes' to this plot: map 'continent' to
# 'color', and map 'pop' to 'size'. How many legends are there now?

#5@

# ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
#   geom_point(__)

#@5

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment.
#   Make sure to return to this topic to meditate on it later.

# If you're ready, you can move on to koan 10: ggplot geoms.
