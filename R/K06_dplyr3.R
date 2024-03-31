#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                           Koan #6: arrange and slice
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# To complete this assignment, edit this R script inside the brackets for
# question 1, for example: between #1@ and @#1. Un-comment the line to make it
# live code instead of a comment (Ctrl Shift C on Windows; Cmd Shift C on Macs),
# save your progress (Ctrl/Cmd S), execute the code in the console (put your
# cursor in the piece of code and hit Ctrl/Cmd Return), and test your answer by
# running the test file (Ctrl/Cmd Shift T). When you've passed all tests, compile
# ("knit") the script to html (Ctrl/Cmd Shift K) and turn the html file in on
# Canvas.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In this koan, you'll learn the final two dplyr verbs: arrange() and slice().

# Run this code to get started.

library(tidyverse)
library(gapminder)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                             ----- arrange() -----

# arrange() rearranges the rows of your tibble by the variable you specify.

gapminder %>%
  arrange(pop)

# The code above rearranges 'gapminder' to put the observations with the
# lowest population first, so that the variable 'pop' is ascending.

# If instead you wanted 'pop' to be descending (the observations with the
# largest populations first), you can use 'desc()':

gapminder %>%
  arrange(desc(pop))

# 1. Take all the observations in Asia and sort them from the lowest -----------
# life expectancies to the highest.

#1@

# __

#@1

# 2. Take all the observations in Asia and sort them from the highest ----------
# life expectancies to the lowest.

#2@

# __

#@2

# Read the qelp docs on arrange():

?qelp::arrange

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              ----- slice() -----

# slice() lets you select rows by their integer locations. So if you
# want to select the second row of 'gapminder':

gapminder %>%
  slice(2)

# If you want to select the second, third, and fourth rows:

gapminder %>%
  slice(c(2, 3, 4))

# Or equivalently:

gapminder %>%
  slice(2:4)

# 3. Select row 853 to row 864. ------------------------------------------------

#3@

# __

#@3

# Two related functions are slice_head() and slice_tail().

# slice_head() takes the first 'n' rows of a tibble:

gapminder %>%
  slice_head(n = 2)

# slice_tail() takes the last 'n' rows of a tibble:

gapminder %>%
  slice_tail(n = 2)

# 4. Take all the observations in Asia and return the five with the ------------
# highest life expectancies (hint: use arrange()).

#4@

# __

#@4

# 5. Which (one) country has the highest life expectancy in each continent?-----
# (hint: use arrange() and also group_by()).

#5@

# __

#@5

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.

# If you're ready, you can move on to koan 7: left_join.
