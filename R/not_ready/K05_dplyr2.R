# Intro to the Tidyverse by Colleen O'Briant

# In order to progress, all you need to do is fill in the blanks: __.
# Then run the code to make sure you're getting the desired result.
# Use hotkeys for this: highlight the code you want to run, or put
# your cursor at the end of the line. Then hit command + enter on a
# mac, or ctrl + enter on windows.

#-------------------------------------------------------------------------

# The next two dplyr verbs: 'summarize' and 'group_by'

# Run this code to get started.

library(tidyverse)
library(gapminder)

#--- 1. summarize() ---------------------------------------------------

# 'summarize()' reduces a tibble down to a customized summary.

# For example, when you want to know the minimum value of a column,
# or the maximum, or the mean, or the median, you can use 'summarize()'.

gapminder %>%
  summarize(lifeExp_min = min(lifeExp), lifeExp_max = max(lifeExp))

# The output is a tibble with columns as summary statistics.

# Your turn: take 'gapminder', filter for only observations in Africa,
# and summarize to find the median life expectancy, population, and
# GDP per capita.

# __

# Read the qelp docs on 'summarize()':

?qelp::summarize

#--- 2. group_by() ---------------------------------------------------

# The fifth dplyr function we'll learn is 'group_by()'. It sorts your
# data into buckets (groups) by the variable you specify.

# For example, this code sorts gapminder into buckets by year:

gapminder %>%
  group_by(year)

# There's no obvious difference between a grouped tibble and an ungrouped
# tibble except that a grouped tibble has a special attribute called Groups:

# > gapminder %>%
#   +   group_by(year)

#  A tibble: 1,704 x 6
#  Groups:   year [12] <---- here's the attribute!
#    country     continent  year lifeExp      pop gdpPercap
#    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
#  1 Afghanistan Asia       1952    28.8  8425333      779.
#  2 Afghanistan Asia       1957    30.3  9240934      821.
#  3 Afghanistan Asia       1962    32.0 10267083      853.


# 'group_by()' isn't really useful on its own. To see how powerful
# it is, pair it with 'summarize()':

gapminder %>%
  group_by(year) %>%
  summarize(lifeExp_median = median(lifeExp))

# On its own, 'summarize()' outputs a tibble with *one row*. But in
# conjunction with 'group_by()', summarize() outputs a tibble with the
# same number of rows as there are buckets (groups).

# The code above outputs a summary that tells us what the median life
# expectancy is in our data *for each year*. It's as if R sorted our
# observations (rows) into buckets by the grouping variable and visited
# each bucket individually to calculate the summary statistic before
# reporting the results.

# Grouped summaries are profoundly useful. Working with data, you'll use
# them all the time.

# 2.1 Take 'gapminder', filter for only observations in Africa,
# and summarize to find the median life expectancy, population, and
# GDP per capita *for each country*.

# __


# 2.2 Summarize 'gapminder' to find the mean GDP per capita for each
# country, for each year (2 grouping variables).

# __


# Read the qelp docs on 'group_by()':

?qelp::group_by

#--- 3. count() ---------------------------------------------------------

# Oftentimes you'll need to answer questions like, "How many observations
# do I have in each continent?"

# You /could/ 'filter' for each continent and then use 'nrow':

gapminder %>%
  filter(continent == "Africa") %>%
  nrow()

gapminder %>%
  filter(continent == "Americas") %>%
  nrow()

gapminder %>%
  filter(continent == "Asia") %>%
  nrow()

# But this is not the best way: it's repetitive and wordy.

# Instead, 'group_by' continent and summarize with the function n(),
#  which counts the number of observations in a context dependent way:

gapminder %>%
  group_by(continent) %>%
  summarize(n_observations = n())

# Grouping by a variable and counting n() is such a common task,
# there's an even simpler way to do it: 'count()' is equivalent
# to group_by + summarize + n:

gapminder %>%
  count(continent)

# 3.1: How many observations are there from each country?

# __

#-------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.

# If you're ready, you can move on to the next exercise, Exercise 6:
# arrange and slice.
