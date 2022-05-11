#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                                Koan #3: Piping
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

# Run this code to get started:

library(tidyverse)

US_data <- tibble(
  year      = c(1957, 1977, 1997, 2017),
  gdpPercap = c(14847, 24073, 35767, 60062),
  lifeExp   = c(69.5, 73.4, 76.8, 78.5)
)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Piping: %>%

# The pipe is *the most frequently used* function in the tidyverse. It lets
# us clearly express a sequence of functions without cluttering our programs
# with parentheses from function composition.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                       ----- What does the pipe do? -----

# Suppose you have a tibble named 'x', and you'd like to apply a function
# 'f' on it. So you run:

# f(x)
# (this won't actually run because 'x' and 'f' don't exist yet)

# But an alternative way to do that is:

# x %>% f()
# (again, this won't actually run)

# The pipe simply takes the data that comes before it, and inserts it
# into the function that comes after.

# The way you should read the pipe is with the word *then*.
# Read the above code as "Take x, *then* apply f."

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              ----- Examples -----

# You can apply a function directly, or you can pipe the data into a function.
# So two ways to do the same thing are:

names(US_data)

US_data %>% names()

# 1. Your turn: apply 'print' to US_data using a pipe. -------------------------

print(US_data)

#1@

# __ %>% __

#@1

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                  ----- Applying a sequence of functions -----
#
# You can start to see how the pipe comes in handy when you string 2 or
# more functions together.

# Suppose you have a tibble named 'x', and you'd like to apply a function
# 'f' on it. But you're not done: you want to take the data structure that's
# the result of 'f(x)' and apply another function 'g()' on that.

# So you run:

# g(f(x))

# An alternative way to do that is:

# x %>% f() %>% g()

# Or using multiple lines:

# x %>%
#   f() %>%
#   g()

# The code is evaluated from top to bottom, so that 'f(x)' is evaluated
# and then the result is piped into 'g()'. If you're using multiple lines,
# the pipe must go at the end of the line.

# With function composition, you have to read inside out: 'g(f(x))'.
# With pipes, you read left to right: 'x %>% f() %>% g()',
# or top to bottom when using multiple lines. Pipes oftentimes help us
# make our code more *clear and readable*, which is one of our biggest
# goals for writing good code.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Example: take 'US_data', get the variable names by applying the function
# 'names()' on it, AND THEN see those names in a new tab by applying the
# function 'view()' to the result of 'US_data %>% names()':

# US_data %>%
#   names() %>%
#   view()

# The alternative:

# view(names(US_data))

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# What would it look like to pipe a data structure into a sequence of 3,
# or even 4 functions?

# x %>%
#   f() %>%
#   g() %>%
#   h()

# x %>%
#   f() %>%
#   g() %>%
#   h() %>%
#   i()

# The alternative gets cluttered fast:

# h(g(f(x)))
#
# i(h(g(f(x))))

# You'll see plenty of examples of piping 2, 3, 4, or more functions in
# later sections, so keep an eye out for that!

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Finally, read the qelp docs on the pipe to find out even more:

?qelp::`%>%`

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.

# If you're ready, you can move on to the next koan: filter, select, and mutate.
