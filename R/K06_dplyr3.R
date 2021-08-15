# Intro to the Tidyverse by Colleen O'Briant

# In order to progress, all you need to do is fill in the blanks: __.
# Then run the code to make sure you're getting the desired result.
# Use hotkeys for this: highlight the code you want to run, or put
# your cursor at the end of the line. Then hit command + enter on a
# mac, or ctrl + enter on windows.

#-------------------------------------------------------------------------

# In this exercise, we'll learn the final two dplyr verbs: 'arrange' and 
# 'slice'.

# Run this code to get started. 

library(tidyverse)
library(gapminder)

#--- 1. arrange() --------------------------------------------------------

# 'arrange()' rearranges the rows of your tibble by the variable you specify. 

gapminder %>%
  arrange(pop)

# The code above rearranges 'gapminder' to put the observations with the
# lowest population first, so that the variable 'pop' is ascending.

# If instead you wanted 'pop' to be descending (the observations with the
# largest populations first), you can use 'desc()':

gapminder %>%
  arrange(desc(pop))

# 1.1 Take all the observations in Asia and sort them from the highest
# life expectancies to the lowest.

__

# Read the qelp docs on 'arrange()':

?qelp::arrange

#--- 2. slice() --------------------------------------------------------

# 'slice()' lets you select rows by their integer locations. So if you
# want to select the second row of 'gapminder':

gapminder %>%
  slice(2)

# If you want to select the second, third, and fourth rows:

gapminder %>%
  slice(2:4)

# Two related functions are 'slice_head()' and 'slice_tail()'.

# 'slice_head()' takes the first 'n' rows of a tibble:

gapminder %>%
  slice_head(n = 2)

# 'slice_tail()' takes the last 'n' rows of a tibble:

gapminder %>%
  slice_tail(n = 2)

# 2.1 Take all the observations in Asia and return the five with the 
# highest life expectancies.

__


# This type of task is so common, 'slice_min()' and 'slice_max()'
# were created to make it even easier:

gapminder %>%
  filter(continent == "Asia") %>%
  slice_max(lifeExp, n = 5)

# 2.2 'slice_max' and 'slice_min' also work on grouped tibbles. To see this,
# take 'gapminder', group by 'continent', and use 'slice_max' to find
# the observation with the highest life expectancy *for each continent*.

__


#-------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.

# If you're ready, you can move on to a quick tutorial on joins before
# Exercise 7: a dplyr murder mystery!
