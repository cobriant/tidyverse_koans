# Intro to the Tidyverse by Colleen O'Briant

  # In order to progress, all you need to do is fill in the blanks: __.
  # Then run the code to make sure you're getting the desired result.
  # Use hotkeys for this: highlight the code you want to run, or put
  # your cursor at the end of the line. Then hit command + enter on a
  # mac, or ctrl + enter on windows.

#-------------------------------------------------------------------------

# Setting up your work space

  # You should install R, RStudio, the tidyverse, and qelp.
  # Go here for instructions:
  # https://cobriant.github.io/421_summer_2021/book/orgfiles/intro_4.html

  # Then open this document in RStudio and you can get started!

#-------------------------------------------------------------------------

# Vectors

  # In R, data is held in vectors.
  # One way to construct a vector is to use the function 'c()'.
  # 'c()' is short for "combine": you can combine elements into a vector.

#-------------------------------------------------------------------------

# First, read the qelp docs on 'c()':

?qelp::c

#-------------------------------------------------------------------------
  
# 1. Make the first element of this numeric vector '6'.
#1@

c(6, 4, 5, 2, 3)

#@1
#-------------------------------------------------------------------------

# 2. Make the third element of this character vector 'economics'. Note that
#    quotes shouldn't be used with numbers, but should be used with character
#    strings.
#2@

c("apple", "banana", "economics")

#@2
#-------------------------------------------------------------------------

# 3. You can do all kinds of calculations on vectors.
#    If you fill in the blank correctly, when you run these lines,
#    R will print 'TRUE'.

# Add two numeric vectors:
#3a@

c(6, 3, 2) + c(3, 2, 1) == c(9, 5, 3)

#@3a

# Find the minimum of a vector:
?qelp::min

#3b@

min(c(6, 3, 2)) == __

#@3b

# Find the sum of all elements of a vector:
?qelp::sum

#3c@

sum(c(6, 3, 2)) == __

#@3c

# Multiply a scalar and a vector:
#3d@

2 * c(6, 3, 2) == c(__, __, __)

#@3d

# Divide two vectors:
#3e@

c(6, 3, 2) / c(2, 3, 1) == c(__, __, __)

#@3e
#-------------------------------------------------------------------------

# 4. If you want to create a vector of consecutive numbers like 
#    'c(1, 2, 3)', the shorthand is '1:3'.

c(1, 2, 3) == 1:3

#4@

c(2, 3, 4) == __:__

#@4
#-------------------------------------------------------------------------

# To create a vector with elements that are repeated, use 'rep':
?qelp::rep

# This repeats 1 five times, 2 five times, and then 3 five times.
rep(1:3, each = 5)

#-------------------------------------------------------------------------

# 5. To create a vector that does random sampling, use 'sample':
?qelp::sample

# This randomly draws 0's or 1's to create a random vector of length 10.
sample(c(0, 1), size = 10, replace = TRUE)

# Create a random character vector that draws either "heads" or "tails".
#5@

sample(__, size = 5, replace = TRUE)

#@5
#-------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.

# If you're ready, you can move on to the next koan: Tibbles.
