#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                             Koan #20: accumulate()
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

library(tidyverse)

# The last function we'll learn from the purrr family is accumulate().
# accumulate() works just like reduce() to sequentially apply a 2-argument
# function to `.x`, but the difference is that accumulate() outputs the
# intermediate results so that the output is the same length as `.x`, just like
# map(). The last element of the accumulate() output will be the same as the
# reduce() output.

# This function shows you the computations from the max() algorithm we discussed
# in the previous koan. Run this code to see the result:

accumulate(c(1, 3, 9, 2), ~ if_else(.x > .y, .x, .y))

# The first element of the accumulate() output from above is a 1.
# `.f` hasn't been applied yet. In order to make the output the same length as
# the input, accumulate() just outputs the first element of `.x` as-is.

# The second element of the accumulate output is 3. That's because the maximum
# of 1 and 3 is 3.

# The third element of the accumulate output is 9. That's because the maximum of
# 3 and 9 is 9.

# The fourth element of the accumulate output is 9. That's because the maximum
# of 9 and 2 is 9.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Now consider the minimum function:

accumulate(1:10, ~ if_else(.x < .y, .x, .y))

# 1. Fill in the blanks so that this statement returns TRUEs: ------------------

#1@

# accumulate(c(__, 11, __, __), ~ if_else(.x < .y, .x, .y)) == c(7, 7, __, 2)

#@1

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Consider the sum() function:

accumulate(1:10, `+`)

# 2. Fill in the blank so that this statement returns TRUEs: -------------------

#2@

# accumulate(c(__, __, __, __), ~ .x + .y) == c(3, 10, 0, 2)

#@2

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#' In order to generate data that follows a random walk:
#' $y_t = y_{t-1} + u_t$,
#' you can use an accumulated sum of $u_t$:

accumulate(c(0, -1, 1, 2, -1), ~ .x + .y)

# This is what's happening to get the output from the above code:
c(
  0,
  0 + -1,
  0 + -1 + 1,
  0 + -1 + 1 + 2,
  0 + -1 + 1 + 2 + -1
)

# You can also generate u_t from the normal distribution:

accumulate(rnorm(n = 10), ~ .x + .y)

# Let's visualize the random walk! Run the code below a couple of times to see
# that random walks aren't more likely to trend upward or downward. Time series
# like stocks or housing prices (whenever the data generating process includes a
# lot of speculation) are modeled well with random walks. That's because the
# best guess anyone can make about the value of the stock next period is its
# value this period.

tibble(
  t = 1:100,
  y = accumulate(rnorm(n = 100), ~ .x + .y)
) %>%
  ggplot(aes(x = t, y = y)) +
  geom_line()

# 3. Take the first difference of this random walk: ----------------------------

#3@

# tibble(
#   u = c(1, 0, 0, 1, -1, -2, 1, 0),
#   y = accumulate(u, ~ .x + .y)
# ) %>%
#   mutate(y_diff = __)

#@3

# Notice that the first difference will recover the vector u (without the first
# term). This happens because:

#' $y_t = y_{t-1} + u_t$
#' $y_t - y_{t-1} = u_t$

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#' You can also simulate other autocorrelated time series using accumulate():
#' Instead of a random walk: $y_t = y_{t-1} + u_t$,
#' Suppose we want to simulate: $y_t = \beta_0 + \beta_1 y_{t-1} + u_t$.

#' 4. Generate an autocorrelated time series: ----------------------------------
#' $y = .5 + .5*y_{t-1} + u_t$, u_t ~ iid N(0, $\sigma^2$)

#4@

# accumulate(c(1, 0, __, -1), ~ .5 + .5*.x + .y) == c(1, 1, 3, __)

#@4

# Visualize the autocorrelated time series.

tibble(
  t = 1:100,
  y = accumulate(rnorm(n = 100), ~ .5 + .5*.x + .y)
) %>%
  ggplot(aes(x = t, y = y)) +
  geom_line()

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Wow! You've finished all 20 tidyverse koans, what a wonderful accomplishment.
# You've worked hard and learned so much.

# You may not feel like you've achieved tidyverse enlightenment yet, but as you
# keep practicing, you may find yourself surprised to learn just how powerful
# these concepts truly are. And you may discover you are a much more powerful
# programmer than you ever thought you could be!
