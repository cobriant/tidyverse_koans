# tidyverse koans

Koans are a great way to learn to program because:

  - You're learning by doing (I can't overemphasize the importance of this one)
  - You work in the development environment you'll use (R scripts in RStudio), not in a separate online environment like with Datacamp or LearnR
  - Feedback is immediate (Ctrl/Cmd Shift T to test your answers)
  - The koans are self-paced
  - You're free to experiment in the console
  
These koans are inspired by the spirit of the ruby/lisp/python/et al. koans, but they are tailored in every way for programming novices learning the tidyverse ecosystem. 

My advice for students is that koans are not worksheets to be completed for speed. Studying koans is a slow, meditative journey toward tidyverse enlightenment. Guess, skim, or rush, and you miss things. I'd recommend only doing 2-3 koans maximum in a single sitting.

# Getting started

#### 1. Clone this package (download the code) and open it in RStudio

#### 2. You'll need tidyverse, devtools, gapminder, and qelp

`install.packages("tidyverse", dependencies = TRUE)`

`library(tidyverse)`

`install.packages("devtools")`

`library(devtools)`

`install.packages("gapminder")`

`install_github("cobriant/qelp")`

#### 3. Modify a keybinding for easy testing

Macs:
Tools > Modify keyboard shortcuts > Run a test file > Cmd Shift T (Ctrl Shift T on windows)

#### 4. Open the first koan `R/K01_vector.R` and get to work!


# Outline

- 1: vectors
  - Students should think about data in R being held in vectors. (did you know that even a single number like 4 is a vector in R, of length 1?)
  - That gets them familiar with the concept of functions being vectorized (many functions work on vectors of any length).
  - This is a powerful first building block for the tidyverse's functional, declarative approach.
  - It's a cardinal sin to let students believe they need to do something as complicated as looping or mapping over a vector when the function they're applying is already vectorized.
  
- 2: tibbles
  - The tidyverse's spreadsheet.
  - Data is still being held in vectors (column vectors specifically).
  - The **tidied data format**: columns are variables and rows are observations.
  
- 3: piping: %>%
  - The most commonly used function in the tidyverse.

- 4: filter, select, mutate
  - The first 3 dplyr functions to learn.
  - Tidyverse literature talks about using dplyr to "manipulate" data. I don't love that. I think it's a lot more useful for students to think about using dplyr for writing *queries* on their data, like with SQL.
  - You can use these 7 dplyr functions to answer just about any question you have about your dataset.
 
- 5: summarize and group_by
  - The next two dplyr functions

- 6: arrange and slice
  - The final two dplyr functions

- 7: left_join
  - One more function from dplyr: use left_join to combine two tibbles when you have a variable that acts as a key to match them.
  - This koan sets students up to solve [the dplyr murder mystery I adapted from here](https://github.com/speegled/dplyrmurdermystery/). This project has historically been a favorite: to quote my teaching evaluations, "The assignments have been manageable by breaking concepts into steps that are simpler. The murder mystery proj was even enjoyable."

- 8: qplot to ggplot
  - Koans 8-11 shift the focus from dplyr to ggplot2. 
  - In this koan, I've given students some exposure to qplot in their homework, and I introduce some ggplot2 syntax by drawing comparisons between qplot and ggplot2.
  
- 9: ggplot aesthetic mappings
  - aes(): what's it for?

- 10: ggplot geoms
  - histograms, density plots, vertical and horizontal lines and annotations, scatterplots, boxplots, and animations!

- 11: lm
  - This koan is a refresher and a reminder for students about running regressions in R, especially using lm() to get an R-squared, the fitted values and residuals, doing log or squared transformations of variables inside the lm() call, interactions, etc.

- 12: stats in R
  - Exploring the normal distribution, Student's t distribution, and F distribution in R.
  - Randomly generate numbers from each of these distributions.
  - Visualize a hypothesis test from each of these distributions using ggplot2.

- 13: custom functions
  - Learn to write your own functions in R.

- 14: custom functions that use dplyr
  - It's fun and valuable to be able to write your own functions on top of tidyverse code that use env-variables just like in dplyr or ggplot2.
  - The error is cryptic (object not found), but the solution is simple ({{ vars }}).
  - dplyr vignettes call this "indirection" [here](https://cran.r-project.org/web/packages/dplyr/vignettes/programming.html).

- 15: map
  - What to do when the functions you want to apply aren't vectorized in the way you want.
  - map(.x, .f) is declarative. The imperative analog is a for loop.

- 16: map_*
  - Use map(.x, .f) to do monte carlo simulations with elegance.

- 17: lag
  - By this time in class, we've transitioned to time series models, where lags are important to be able to compute.

- 18: first differences
  - Use lags to first difference variables in your data and visualize the results in a ggplot with two sets of vertical axis labels.

- 19: reduce
  - Reduce is an important and powerful functional programming concept.
  - I like to go over the [pictures in Adv-R](https://adv-r.hadley.nz/functionals.html#reduce) in lecture before students attempt these last two koans. This concept isn't difficult, but does require a little focused attention.

- 20: accumulate
  - I provide an example of how to use reduce (and its extension accumulate) to generate a random walk and then an autocorrelated series.
