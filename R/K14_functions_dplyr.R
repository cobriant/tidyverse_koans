#-------------------------------------------------------------------------
#            Intro to the Tidyverse by Colleen O'Briant
#               Koan #14: Functions that use dplyr
#-------------------------------------------------------------------------

# In order to progress:
# 1. Read all instructions carefully.
# 2. When you come to an exercise, fill in the blank and remove the hashtag
#    (Ctrl/Cmd Shift C) to execute the code in the console (Ctrl/Cmd Return).
#    If the piece of code spans multiple lines, highlight the whole chunk
#    or simply put your cursor at the end of the last line.
# 3. Test that your answers are correct (Ctrl/Cmd Shift T)

#-------------------------------------------------------------------------

# Writing custom functions with dplyr

#  If you want to write a custom function that uses one of the 7 dplyr
#  verbs (filter, select, mutate, summarize, group_by, arrange, and slice),
#  you many run into trouble because of something in R called nonstandard
#  evaluation, or lazy eval. Nonstandard evaluation is something that usually
#  makes our lives easier, but sometimes causes problems. This is one of
#  those times where it causes problems. So I won't try to explain lazy
#  eval in R here, but I'll give you some hints for avoiding errors when
#  you're writing custom functions that use dplyr.

#-------------------------------------------------------------------------

# Consider a grouped summary of 'gapminder' that answers the query,
# "What's the median life expectancy for each year in the data?"

gapminder %>%
  group_by(year) %>%
  summarize(lifeExp_med = median(lifeExp))

# Suppose I wanted to write a function that produces a grouped summary
# like the one above, but for any tibble, grouping variable, and
# summary variable? I would perhaps write this, but I'd be frustrated
# when I test it because it gives me an error, saying that the
# grouping_var is not found:

grouped_summary <- function(data, grouping_var, summarize_var){
  data %>%
    group_by(grouping_var) %>%
    summarize(
      min  =  min(summarize_var),
      mean = mean(summarize_var),
      max  =  max(summarize_var)
      )
}

grouped_summary(data = gapminder, grouping_var = year, summarize_var = lifeExp)

# Our function finds the 'gapminder' dataset, but it can't find 'year'
# or 'lifeExp', because it doesn't know that those are variables *in*
# 'gapminder'. The quick fix is to add a set of double braces {{ var }} in
# the function body:

grouped_summary2 <- function(data, grouping_var, summarize_var){
  data %>%
    group_by({{ grouping_var }}) %>%
    summarize(min  =  min({{ summarize_var }}),
              mean = mean({{ summarize_var }}),
              max  =  max({{ summarize_var }}))
}

# Now I don't get that error:

grouped_summary2(data = gapminder, grouping_var = year, summarize_var = lifeExp)

grouped_summary2(data = gapminder, grouping_var = continent, summarize_var = gdpPercap)

#----------------------------------------------------------------

# 1. You try: write a function 'arrange_filter' that arranges
# a tibble by a certain variable and also filters by a logical condition.
# Make sure to use the double brace syntax {{ var }} in the body
# of the function.

#1@

# arrange_filter <- function(data, arrange_var, condition){
#   __
# }

#@1


# Test that your function works:

# arrange_filter(gapminder, gdpPercap, continent == "Europe")

#----------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.
