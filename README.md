# Tidyverse Koans

Koans are a great way to learn to program because:

  - You're learning by doing
  - You work in the development environment you'll use (R scripts in RStudio), not in a separate online environment like with Datacamp or LearnR
  - Feedback is immediate (Ctrl/Cmd Shift T to test your answers)
  - The koans are self-paced
  - You're free to experiment in the console
  
These koans are inspired by the spirit of the ruby/lisp/python/et al. koans, but they are tailored in every way for programming novices learning the tidyverse ecosystem. 

My advice for students is that koans are not worksheets to be completed for speed. Studying koans is a slow, meditative journey toward tidyverse enlightenment. Guess, skim, or rush, and you miss things. I'd recommend only doing 2-3 koans maximum in a single sitting.

## Contents

[What are students saying?](https://github.com/cobriant/tidyverse_koans#what-are-students-saying)

[Can I use or adapt these koans for my course or lab?](https://github.com/cobriant/tidyverse_koans#can-I-use-or-adapt-these-koans-for-my-course-or-lab)

[Getting Started](https://github.com/cobriant/tidyverse_koans#getting-started)

[Outline](https://github.com/cobriant/tidyverse_koans#outline)

# What are students saying?

These koans work. Not to brag, but from my midterm evals:

> This is very clearly the best taught economics course I have taken at UO. Your lectures are concise and understandable. You are incredibly intelligent, but I really appreciate how you explain the math and concepts in an approachable way. The most impressive aspect of the class, though, are the koans and your approach to coding. I feel like I have learned more R in the past three weeks than I did in all of 320. Thank you.

# Can I use or adapt these koans for my course or lab?

Absolutely, I would love that! I'd only ask for some sort of acknowledgment in your course materials.

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

Tools > Modify keyboard shortcuts > Run a test file > Cmd Shift T (Ctrl Shift T on windows)

#### 4. Open the first koan `R/K01_vector.R` and get to work!

# Outline

- [K01_vector.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K01_vector.R)
  - Students should think about data in R being held in vectors. (did you know that even a single number like `4` is a vector in R, of length 1?)
  - That gets them familiar with the concept of functions being vectorized (many functions work on vectors of any length).
  - This is a powerful first building block for the tidyverse's functional, declarative approach.
  - It's a cardinal sin to let students believe they need to do something as complicated as looping or mapping over a vector when the function they're applying is already vectorized.
  
- [K02_tibble.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K02_tibble.R)
  - The tidyverse's spreadsheet.
  - Data is still being held in vectors (column vectors specifically).
  - The **tidied data format**: columns are variables and rows are observations.
  
- [K03_pipe.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K03_pipe.R)
  - The most commonly used function in the tidyverse.

- [K04_dplyr1.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K04_dplyr1.R)
  - The first 3 `dplyr` functions to learn are filter(), select(), and mutate().
  - Tidyverse literature talks about using `dplyr` to "manipulate" data. I don't like that. I think it's a lot more useful for students to think about using `dplyr` for writing *queries* on their data, like with SQL.
  - You can use these 7 `dplyr` functions to answer just about any question you have about your dataset.
 
- [K05_dplyr2.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K05_dplyr2.R)
  - The next two `dplyr` functions are summarize() and group_by().

- [K06_dplyr3.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K06_dplyr3.R)
  - The final two `dplyr` functions are arrange() and slice().

- [K07_left_join.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K07_left_join.R)
  - One more function from `dplyr`: use `left_join` to combine two tibbles when you have a variable that acts as a key to match them.
  - This koan sets students up to solve [the dplyr murder mystery I adapted from here](https://github.com/speegled/dplyrmurdermystery/). This project has historically been a favorite: to quote my teaching evaluations, "The assignments have been manageable by breaking concepts into steps that are simpler. The murder mystery proj was even enjoyable."

- [K08_qplot_to_ggplot.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K08_qplot_to_ggplot.R)
  - Koans 8-11 shift the focus from `dplyr` to `ggplot2`. 
  - In this koan, I've given students some exposure to `qplot` in their homework, and I introduce some `ggplot2` syntax by drawing comparisons between `qplot` and `ggplot2`.
  
- [K09_ggplot_aes.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K09_ggplot_aes.R)
  - `aes()`: what's it for?

- [K10_ggplot_geom.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K10_ggplot_geom.R)
  - histograms, density plots, vertical and horizontal lines and annotations, scatterplots, boxplots, and animations!

- [K11_lm.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K11_lm.R)
  - This koan is a refresher and a reminder for students about running regressions in R, especially using `lm()` to get an R-squared, the fitted values and residuals, doing log or squared transformations of variables inside the `lm()` call, interactions, etc.

- [K12_stats.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K12_stats.R)
  - Exploring the normal distribution, Student's t distribution, and F distribution in R.
  - Randomly generate numbers from each of these distributions.
  - Visualize a hypothesis test from each of these distributions using `ggplot`.

- [K13_functions.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K13_functions.R)
  - Learn to write your own functions.

- [K14_functions_dplyr.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K14_functions_dplyr.R)
  - It's fun and valuable to be able to write your own functions on top of tidyverse code that use env-variables just like in `dplyr` or `ggplot2`.
  - The error is cryptic (`object not found`), but the solution is simple (`{{ vars }}`).
  - `dplyr` vignettes call this "indirection" [here](https://cran.r-project.org/web/packages/dplyr/vignettes/programming.html).

- [K15_map.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K15_map.R)
  - What to do when the functions you want to apply aren't vectorized in the way you want.
  - `map(.x, .f)` is declarative. The imperative analog is a `for` loop. I don't think it's useful to teach students both `map` and `for` loops when they're learning the tidyverse. The first reason is that we want to stay as declarative as possible for consistency. The second reason is that this concept can be difficult, so being given two ways to solve the problem can be really confusing. I'd much rather have students gain confidence with one way first.

- [K16_more_map.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K16_more_map.R)
  - Use `map(.x, .f)` to do monte carlo simulations with elegance.

- [K17_lag.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K17_lag.R)
  - By this time in class, we've transitioned to time series models, where lags are important to be able to compute.

- [K18_first_differences.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K18_first_differences.R)
  - Use lags to "first difference" variables in your data and visualize the results in a ggplot with two sets of vertical axis labels.

- [K19_reduce.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K19_reduce.R)
  - Reduce is an important and powerful functional programming concept.
  - I like to go over the [pictures in Adv-R](https://adv-r.hadley.nz/functionals.html#reduce) in lecture before students attempt these last two koans. This concept isn't difficult, but does require a little focused attention.

- [K20_accumulate.R](https://github.com/cobriant/tidyverse_koans/blob/main/R/K20_accumulate.R)
  - I provide an example of how to use `reduce` (and its extension `accumulate`) to generate a random walk and then an autocorrelated series.
