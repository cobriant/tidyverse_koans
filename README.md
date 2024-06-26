# Tidyverse Koans: A Gentle Introduction to R for Economists (and other applied researchers)

Hi! I'm an economist working on my PhD at the University of Oregon. I wrote these koans for other budding applied researchers in the hopes of showing people that:

  1) Even if you've been discouraged before, building great data analytics skills is not something that's beyond you! 💪
  2) The tidyverse is a joy. Beginners must be encouraged to appreciate elegant solutions and aesthetic code. That way, they start caring about things other than solving the problem as fast as possible. 💖
  5) You can use the tidyverse for a shockingly wide variety of tasks. 💯

You don't need to know how to program to do these koans. They get gradually harder as you go along, and are meant to be a way to learn about all the data analytics skills that an economist might need. By the end, you'll be able to query data, visualize it, model it, and even run simulations to get insights about the properties of your estimators. Basically, you'll be able to use these koans as a jumping-off point for getting your own novel research ideas up and running.

# 🤔💭 More philosophy

## Koans > Programming books

There are lots of great books about the tidyverse (R4DS and Advanced R come to mind for sure). But if you want to learn the tidyverse quickly and effectively, these koans are the best place to start. Koans are fill-in-the-blank exercises that are great for minimizing frustration, practicing correct syntax, and seeing the wide range of problems that can be solved using the tidyverse. They're done locally in RStudio, so that when inspiration strikes, you can just open a new R script and get going. I've conducted about 100 user interviews for these koans, and my students have found them to be highly effective and relatively painless.

## Koans > in-browser resources like datacamp or learnr

With koans, you're working in the development environment you'll use for your own projects (scripts inside RStudio). With [datacamp](https://dnlmc.medium.com/dont-use-datacamp-ef04adcf1b7f#:~:text=After%20the%20webinar%2C%20some%20instructors,'%E2%80%9D) or learnr, you're not. Transitioning from the browser to using scripts can be difficult for learners, so it's better to teach them to write code in a script from the outset.

## To summarize, koans are great because they:

Koans are a great way to learn a new programming language or framework because they assume no previous experience and build slowly to expose learners to the entire ecosystem. They also have fast feedback cycles, so learners can experiment and learn at their own pace. Plus, they're free!
  
These koans are inspired by the spirit of the ruby/lisp/python/et al. koans, but they are tailored in every way for programming novices learning the tidyverse ecosystem. 

# 👌 Can I use or adapt these koans for my course or lab?

Absolutely, I would love that! I'd only ask for some sort of acknowledgment in your course materials.

# 🏁 Getting started

## 1. Install R and RStudio

## 2. Install a few more packages

In RStudio, run these lines of code:

```r
# the tidyverse
install.packages("tidyverse", dependencies = TRUE)
library(tidyverse)

# gapminder
install.packages("gapminder")
library(gapminder)

# install some packages for special plots
install.packages("gganimate", dependencies = TRUE)
install.packages("hexbin")

# another package I developed called qelp (quick help) for beginner-friendly help docs
install.packages("Rcpp", dependencies = TRUE)
install.packages("devtools", dependencies = TRUE)
library(devtools)
install_github("cobriant/qelp")

# Run this:
?qelp::install.packages

# If everything went right, the help docs I wrote on the function `install.packages` 
# should pop up in the lower right hand pane.
```

## 3. Install the koans

On this github page, click on the green button that says "`Code`" and then hit "`Download ZIP`".

Find the file (probably in your downloads folder) and open it to unzip it. Navigate to the new folder named "`tidyverse_koans-master`" and double click on the R project "`tidyversekoans.Rproj`". RStudio should open. If it doesn't, open RStudio and go to `File > Open Project` and then find `tidyversekoans.Rproj`.

In RStudio, go to the lower righthand panel and hit the folder "`R`". This takes you to the list of 20 koans. Open the first koan: `K01_vector.R`. Before you start, modify a keybinding:

Macs: `Tools > Modify keyboard shortcuts > Run a test file > Cmd Shift T`

Windows: `Tools > Modify keyboard shortcuts > Run a test file > Ctrl Shift T`

Now hit `Cmd/Ctrl Shift T`. You've just tested the first koan. You should see:

`[ FAIL 0 | WARN 0 | SKIP 10 | PASS 0 ]`

What does this mean? If there are errors in your R script, the test will not complete. Since it completed, you know there are no errors. Since `FAIL` is 0, you also haven't failed any of the questions yet. But `PASS` is also 0, so you haven't passed the questions either. Since they're blank right now, the test will skip them. That's why `SKIP` is 10.

Go ahead and start working on the koans and learning about the tidyverse! When you're finished with a koan and the tests pass, it can be nice to be able to see your work in a compiled html document (Ctrl/Cmd Shift K or File > Compile Report).

One last thing: whenever you want to work on the koans, make sure you open RStudio by opening the "`tidyverse_koans-master`" project, not just the individual koan file. If you open the koans in a session that's not associated with the "`tidyverse_koans-master`" project, the tests will fail to run. You can always see which project your current session is being associated with by looking at the upper right hand corner of RStudio: if you're in the "`tidyverse_koans-master`" project, you'll see "`tidyverse_koans-master`" up there. That's good. If you're in no project at all, you'll see "Project: (None)" up there. That's not good, especially if you want the tests to run. If you see "Project: (None)", just click that text and you'll be able to switch over to the "`tidyverse_koans-master`" project.

# 👩‍🏫 Outline for instructors

|   |   |   |
|-----|-----|-----|
| [K01_vector.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K01_vector.R) | Data in R is held in vectors. Did you know that even a single number like `4` is a vector in R, of length 1? Starting with vectors gets learners familiar with the concept of functions being vectorized (many functions work on vectors of any length). This is a powerful first building block for the tidyverse's functional, declarative approach. It's a cardinal sin to let learners believe they need to do something as complicated as looping or mapping over a vector when the function they're applying is already vectorized. | |
| [K02_tibble.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K02_tibble.R) | The next building block to learn about are tibbles: the tidyverse's spreadsheet. Data is still being held in vectors (column vectors specifically). The **tidied data format** is where columns are variables and rows are observations. | <img src="https://github.com/tidyverse/tibble/raw/main/man/figures/logo.png" align="right" /> |
| [K03_pipe.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K03_pipe.R) | The most commonly used function in the tidyverse. Use it to chain together a sequence of operations. | <img src="https://github.com/tidyverse/magrittr/raw/main/man/figures/logo.png" align="right" /> |
| [K04_dplyr1.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K04_dplyr1.R) | The first 3 dplyr functions to learn are filter(), select(), and mutate(). Tidyverse literature talks about using dplyr to "manipulate" data. I don't like that. I think it's a lot more useful for learners to think about using dplyr for writing *queries* on their data, like with SQL. That way, they remember that if they have a question about their data, they should reach for dplyr.| <img src="https://github.com/tidyverse/dplyr/raw/main/man/figures/logo.png" align="right" /> |
| [K05_dplyr2.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K05_dplyr2.R) | The next two dplyr functions are summarize() and group_by().| <img src="https://github.com/tidyverse/dplyr/raw/main/man/figures/logo.png" align="right" /> |
| [K06_dplyr3.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K06_dplyr3.R) | The final two dplyr functions are arrange() and slice().| <img src="https://github.com/tidyverse/dplyr/raw/main/man/figures/logo.png" align="right" /> |
| [K07_left_join.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K07_left_join.R) | One more function from dplyr: use left_join() to combine two tibbles when you have a variable that acts as a key to match them. This koan sets learners up to solve [the dplyr murder mystery I adapted from here](https://github.com/speegled/dplyrmurdermystery/). This project has historically been a favorite: to quote my teaching evaluations, "The murder mystery proj was even enjoyable."| <img src="https://github.com/tidyverse/dplyr/raw/main/man/figures/logo.png" align="right" /> |
| [K08_qplot_to_ggplot.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K08_qplot_to_ggplot.R) | Koans 8-11 shift the focus from dplyr to ggplot2. In this koan, I've given learners some exposure to `qplot` in their homework, and I introduce some ggplot2 syntax by drawing comparisons between qplot and ggplot2.| <img src="https://github.com/tidyverse/ggplot2/raw/main/man/figures/logo.png" align="right" /> |
| [K09_ggplot_aes.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K09_ggplot_aes.R) | aes(): aesthetic mappings between variables in the data and visual properties in the plot like axis, color, and size.| <img src="https://github.com/tidyverse/ggplot2/raw/main/man/figures/logo.png" align="right" /> |
| [K10_ggplot_geom.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K10_ggplot_geom.R) | Histograms, density plots, vertical and horizontal lines and annotations, scatterplots, boxplots, and animations! | <img src="https://github.com/tidyverse/ggplot2/raw/main/man/figures/logo.png" align="right" /> |
| [K11_lm.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K11_lm.R) | This koan is a refresher and a reminder for learners about running regressions in R, especially using lm() to get an R-squared, the fitted values and residuals, doing log or squared transformations of variables inside the lm() call, interactions, etc.| |
| [K12_stats.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K12_stats.R) | Exploring the normal distribution, Student's t distribution, and F distribution in R. Randomly generate numbers from each of these distributions. Visualize a hypothesis test from each of these distributions using ggplot.| |
| [K13_functions.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K13_functions.R) | Learn to write your own functions to make your code more readable and organized.| |
| [K14_functions_dplyr.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K14_functions_dplyr.R) | It's fun and valuable to be able to write your own functions on top of tidyverse code that use env-variables just like in dplyr or ggplot2. The error is cryptic (`object not found`), but the solution is simple (`{{ vars }}`). dplyr vignettes call this ["indirection"](https://cran.r-project.org/web/packages/dplyr/vignettes/programming.html). | |
| [K15_map.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K15_map.R) |  Map: what to do when the functions you want to apply aren't vectorized in the way you want: `map(.x, .f)` applies the function `.f` to each element of `.x`. `map(.x, .f)` is declarative. The imperative analog is a for loop. I don't think it's useful to teach students both map and for loops when they're learning the tidyverse. The first reason is that we want to stay as declarative as possible for consistency. The second reason is that this concept can be difficult, so being given two ways to solve the problem can be really confusing. I'd much rather have learners gain confidence with one way first. | <img src="https://github.com/tidyverse/purrr/raw/main/man/figures/logo.png" align="right" /> |
| [K16_more_map.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K16_more_map.R) | Use `map(.x, .f)` to do monte carlo simulations with elegance.| <img src="https://github.com/tidyverse/purrr/raw/main/man/figures/logo.png" align="right" /> |
| [K17_lag.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K17_lag.R) | By this time in my class, we've transitioned to time series models, where lags are important to be able to compute. A lag is just a previous observation for a variable.| |
| [K18_first_differences.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K18_first_differences.R) | Use lags to "first difference" variables in your data and visualize the results in a ggplot with two sets of vertical axis labels.| |
| [K19_reduce.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K19_reduce.R) | Reduce is a powerful functional programming concept. I like to go over the [pictures in Adv-R](https://adv-r.hadley.nz/functionals.html#reduce) in lecture before learners attempt these last two koans. This concept isn't difficult, but does require a little focused attention.| <img src="https://github.com/tidyverse/purrr/raw/main/man/figures/logo.png" align="right" /> |
| [K20_accumulate.R](https://github.com/cobriant/tidyverse_koans/blob/master/R/K20_accumulate.R) | I provide an example of how to use reduce() (and its relative accumulate()) to generate a random walk and then an autocorrelated series.| <img src="https://github.com/tidyverse/purrr/raw/main/man/figures/logo.png" align="right" /> |
