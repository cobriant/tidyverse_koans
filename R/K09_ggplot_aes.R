# Intro to the Tidyverse by Colleen O'Briant

# In order to progress, all you need to do is fill in the blanks: __.
# Then run the code to make sure you're getting the desired result.
# Use hotkeys for this: highlight the code you want to run, or put
# your cursor at the end of the line. Then hit command + enter on a
# mac, or ctrl + enter on windows.

#-------------------------------------------------------------------------

# 'ggplot()' aesthetic mappings ('aes')

#   Aesthetic mappings take variables in your data and map them to
#   visual elements in your plot.

#-------------------------------------------------------------------------

# Run this code to get started and to view the data:

library(tidyverse)
library(gapminder)
view(gapminder)

#-------------------------------------------------------------------------

# x = __, y = __

# When you declare which variable should be represented on which axis,
#    you're using an *aesthetic mapping* (taking variables in your data
#    and mapping them to visual elements in your plot). That's why 
#    'x = ' and 'y = ' are wrapped in 'aes()' in a ggplot.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Each point in the scatterplot above represents a certain country in a 
#    certain year. We can easily create different plots for each 'continent'
#    using 'facet_wrap'. The tilde '~' can be read as "by". So by adding
#    a facet layer, we "facet by continent". Make sure to take a look at the plot.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  facet_wrap(~ continent)

# 1. Change the plot above to facet by 'year' instead of faceting by 'continent'.

__

#-------------------------------------------------------------------------

# 2. An alternative to faceting is to use color as the plot aesthetic to 
#    differentiate between continents. So all the points in Africa will be red, 
#    Europe will be blue, etc. This is an 'aes'thetic mapping because we're taking 
#    a variable 'continent' and mapping it to the visual element of 'color'.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = __)) +
  geom_point()

#-------------------------------------------------------------------------

# 3. 'color' is an aesthetic mapping which changes the color of the *outline* of
#    the geometry. If instead you want to change the color of the *fill* of the
#    geometry, use 'fill' instead of 'color'.

#   To see both the 'color' and the 'fill' of a point, I'll use 'shape = 21': 
#   points with outlines.
#   Use 'color' to represent 'continent', and use 'fill' to represent 'year'.

ggplot(data = gapminder, 
       aes(x = gdpPercap, y = lifeExp, color = __, fill = __)) +
  geom_point(shape = 21)

#-------------------------------------------------------------------------

# 4. A third aesthetic mapping is 'shape'. We actually just used 'shape' in 
# the previous question, outside of the 'aes' call in 'geom_point'. That
# set the shape of the points to a fixed value (shape = 21: points with
# outlines).

# Observe what happens when you map 'shape' to 'continent' *inside* of 
# an 'aes()' call.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(shape = __))

#-------------------------------------------------------------------------

# In the last example, we specified an 'aes' in the 'ggplot()' call *and*
#   in the 'geom_point()' call. 
#   Something that's important to understand is that layers like 'geom_point'
#   which are added on to a ggplot call will inherit the data and the aesthetic
#   mappings from that initial ggplot call.
#   That's why all of these plots do the same thing:

# You can put all information in the 'ggplot()' call:

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, shape = continent)) +
  geom_point()

# You can put some information in the 'ggplot()' call and some in the 
# 'geom_point()' call:

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(shape = continent))

# You can put all information in the 'geom_point()' call:

ggplot() +
  geom_point(data = gapminder, aes(x = gdpPercap, y = lifeExp, shape = continent))

# But warning: if you have multiple 'geom's and put all information in one of them,
# the other 'geom' won't inherit that information.
# In this example, the 'geom_smooth()' doesn't get drawn because it doesn't inherit
# any of the information it needs from 'ggplot()'.

ggplot() +
  geom_point(data = gapminder, aes(x = gdpPercap, y = lifeExp, shape = continent)) +
  geom_smooth()

# Instead, give 'geom_smooth()' the information it needs either directly,
#   or by putting the information in the ggplot() call.
#   These two draw the same plot, but the second is better because it avoids
#   unnecessary repetition.

ggplot() +
  geom_point(data = gapminder, aes(x = gdpPercap, y = lifeExp, shape = continent)) +
  geom_smooth(data = gapminder, aes(x = gdpPercap, y = lifeExp))

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(shape = continent)) +
  geom_smooth()

#-------------------------------------------------------------------------

# 5. So far we have 3 aesthetic mappings other than x and y axis: 
#    they are 'color', 'fill', and 'shape'.
#    The last 'aes' we'll talk about is 'size', which adjusts point size.
#    Add 2 'aes' to this plot: map 'continent' to 'color', and map 'pop' to 'size'.
#    How many legends are there now?

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(__)

# There are __ legends.

#-------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
#   Make sure to return to this topic to meditate on it later.

# If you're ready, you can move on to the next exercise, 
#   Exercise 10: ggplot 'geom's.
