# Intro to the Tidyverse by Colleen O'Briant

# In order to progress, all you need to do is fill in the blanks: __.
# Then run the code to make sure you're getting the desired result.
# Use hotkeys for this: highlight the code you want to run, or put
# your cursor at the end of the line. Then hit command + enter on a
# mac, or ctrl + enter on windows.

#-------------------------------------------------------------------------

# Exercise 8: 'qplot()' to 'ggplot()'

  # The tidyverse ecosystem has 2 great ways to draw plots: they are
  # 'qplot' and 'ggplot'. You've already had some practice drawing qplots.

  # 'qplot' was designed to be a simplified version of 'ggplot', so you
  # already have a head start with learning 'ggplot'!

  # What's with the name?
  # The double g's in 'ggplot' stand for the "grammar of graphics". The
  # idea is that you shouldn't have to memorize tons of details about
  # how a plotting tool works in order to create the right visualization
  # for your data.
  # Instead, your plotting tool should work like a language in itself.
  # Once you understand how to speak the language, you can start building
  # your own visualizations to communicate your unique ideas very fast.

#-------------------------------------------------------------------------

# Run this code to get started and to take a look at the data:

library(tidyverse)
install.packages("gapminder")
library(gapminder)
US_data <- filter(gapminder, country == "United States")
view(US_data)

#-------------------------------------------------------------------------

# You've practiced building scatterplots with 'qplot' like this:

qplot(data = US_data, x = gdpPercap, y = lifeExp)

# 1. Replicate that scatterplot using 'ggplot()':

ggplot(data = __, aes(x = __, y = __)) +
  geom_point()

# Notice 'ggplot()' wraps x and y in 'aes'. We'll talk more about
# that in the next exercise, "ggplot aesthetic mappings".

#-------------------------------------------------------------------------

# You've also practiced adding main titles and axis labels to your qplot:

qplot(
  data = US_data, 
  x = gdpPercap, 
  y = lifeExp, 
  main = "As GDP per capita increases, so does life expectancy",
  xlab = "GDP per capita",
  ylab = "Life expectancy"
)

# 2. Add a main title and axis labels (labs) to your ggplot:

ggplot(data = __, aes(x = __, y = __)) +
  geom_point() +
  labs(x = __, y = __, title = __)

# Notice that with 'ggplot()', functions are added '+' to the main
# ggplot call. These are called layers. So a layer is added to draw
# the points of the scatterplot, and another layer is added to draw axis
# labels and a title.

#-------------------------------------------------------------------------

# You've also practiced using multiple geoms with a qplot: 

qplot(
  data = US_data, 
  x = gdpPercap, 
  y = lifeExp, 
  geom = c("point", "line", "smooth")
)

# 3. Use multiple geom's in a ggplot (if there's no blank '__', you don't
#    need to write anything!):

ggplot(data = __, aes(x = __, y = __)) +
  geom_point() +
  geom_line() +
  geom_smooth()

# Notice that with 'ggplot()', to add multiple geoms, you add '+' layers.

# ------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
#   Make sure to return to this topic to meditate on it later.

# If you're ready, you can move on to the next exercise, 
#   Exercise 9: ggplot aesthetic mappings.
