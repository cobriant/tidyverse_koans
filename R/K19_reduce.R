function() {
  #:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  #                   Intro to the Tidyverse by Colleen O'Briant
  #                               Koan #19: reduce()
  #:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  # To complete this assignment, edit this R script inside the brackets for
  # question 1, for example: between #1@ and @#1. Un-comment the line to make it
  # live code instead of a comment (Ctrl Shift C on Windows; Cmd Shift C on Macs),
  # save your progress (Ctrl/Cmd S), execute the code in the console (put your
  # cursor in the piece of code and hit Ctrl/Cmd Return), and test your answer by
  # running the test file (Ctrl/Cmd Shift T). When you've passed all tests, compile
  # ("knit") the script to html (Ctrl/Cmd Shift K) and turn the html file in on
  # Canvas.

  #:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  # We've already learned the first function from the purrr family: map(). Now
  # we'll learn the next two: in this koan, we'll focus on reduce(), and in koan
  # 20, we'll learn accumulate().

  # map(.x, .f) applies a function `.f` to every element of `.x` and creates a
  # list of outputs the same length as `.x`.

  # Similarly, reduce(.x, .f) applies a 2-argument function `.f` to every
  # element of `.x` *sequentially* to get you *one* final output. That is, it
  # uses `.f` to reduce `.x`.

  # In this koan, we'll see how max() reduces a vector down to a single output,
  # and also that min() and sum() do the same thing.

  library(tidyverse)

  # The first example of how reduce() can be used is the function max(). max()
  # takes a vector of numbers and returns the number which is the largest.

  # 1. Fill in the blank below so that the statement returns TRUE: -------------

  #1@

  # max(c(5, 3, __, 2)) == 9

  #@1

  # What if you had to write the function `max` from scratch? You would probably
  # need to use `>`, keeping track of the maximum you've seen so far. So an
  # algorithm to sequentially apply `>` to find the maximum of c(4, 2, 6, 8)
  # would be this:

  # Compare the first two numbers in `.x`:
  4 > 2
  # Since this returns TRUE, save 4 as the largest number seen thus far.

  # Compare 4 with the next number in `.x`:
  4 > 6
  # Since this returns FALSE, save 6 as the largest number seen thus far.

  # Compare 6 with the next number in `.x`:
  6 > 8
  # Since this returns FALSE, save 8 as the largest number seen thus far.
  # Return 8 since we've made it through `.x`.

  # I'll write a 2-argument function that takes two numbers, compares them, and
  # returns the larger one. I'll call this function "larger", and I'll use
  # if_else() to do it:

  ?qelp::if_else

  larger <- function(x, y) {
    if_else(x > y, x, y)
  }

  # 2. Test that the function works by filling in the blank below with any -----
  # number to make the statement return TRUE:

  #2@

  # larger(5, __) == 5

  #@2

  # `larger` is a good start, but I want `max` to work on a vector of any size,
  # not just 2. Something I could do is to apply `larger` until `.x` is through,
  # sequentially:

  larger(4, 2) %>%
    larger(6) %>%
    larger(8)

  # Using `reduce()` does the same thing as what I've written above to
  # sequentially apply `.f` until `.x` is through:

  reduce(c(4, 2, 6, 8), larger)

  # So I can write a function my_max() that takes any vector of any length and
  # finds what the maximum is by sequentially applying `larger`:

  my_max <- function(x) {
    reduce(x, larger)
  }

  # Check that the function works:

  my_max(c(4, 2, 6, 8))

  # Instead of creating the functions `larger` and `my_max`, if you just wanted
  # to find the maximum of a vector using reduce(), you can use the formula
  # syntax just like with map(). Since .f is a 2-argument function for reduce(),
  # you'll refer to `.x` AND `.y`. .x is the value passed from previous
  # evaluations of .f, and .y refers to the new element of the vector.

  reduce(c(4, 2, 6, 8), ~ if_else(.x > .y, .x, .y))

  # This is a great visualization of what `reduce()` does from Hadley Wickham's
  # book *Advanced R*:
  #' https://d33wubrfki0l68.cloudfront.net/9c239e1227c69b7a2c9c2df234c21f3e1c74dd57/eec0e/diagrams/functionals/reduce.png

  # Also read the qelp docs for reduce:
  ?qelp::reduce

  #:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  # 3. Your turn: create a function my_min() that finds the minimum of a -------
  # vector of numbers, using `<`, if_else(), and reduce().

  #3@

  # my_min <- function(x) {
  #   __
  # }

  #@3

  # Check that my_min works:

  # my_min(c(4, 2, 6, 8))

  #:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  # So we've learned that you can think of max() as a reduced `>` and min() as a
  # reduced `<`. You can also think of sum() as a reduced `+`.

  # sum() takes a vector and sequentially applies `+` until .x is through:
  sum(1:10)

  # a + b is actually just syntactic sugar for this: `+`(a, b): you're applying
  # the 2-argument function `+` to a and b. So sum(1:10) does this:

  `+`(1, 2) %>%
    `+`(3) %>%
    `+`(4) %>%
    `+`(5) %>%
    `+`(6) %>%
    `+`(7) %>%
    `+`(8) %>%
    `+`(9) %>%
    `+`(10)

  # 4. Use `+` and `reduce` to write a function that finds the sum of any ------
  # vector.

  #4@

  # my_sum <- function(x) {
  #   __
  # }

  #@4

  # my_sum(1:1000) == sum(1:1000)

  #:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  # Great work! You're one step closer to tidyverse enlightenment. Make sure to
  # return to this topic to meditate on it later.
}
