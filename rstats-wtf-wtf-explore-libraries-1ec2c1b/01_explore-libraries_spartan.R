# A first exploration of installed packages ------------------------------------
installed.packages()

# In which libraries does R search for packages? -------------------------------
.libPaths()
.Library

# Create a tibble of all installed packages ------------------------------------
library(dplyr)
inst <- installed.packages() |> 
  as_tibble()


# How many packages are installed? ---------------------------------------------
nrow(inst)

# Explore the packages - count some things. ------------------------------------
# For example, tabulate by LibPath, Priority, or both.
# What proportion need compilation?
# What version of R they were built on?
inst |> 
  group_by(NeedsCompilation) |> 
  tally()

inst |> 
  group_by(Priority) |> 
  tally()

inst |> 
  group_by(LibPath) |> 
  tally()

inst |> 
  group_by(Priority,LibPath) |> 
  tally()

# Reflect on the above and make a few notes to yourself ------------------------
# What did you learn about your R package installation?
# What are you curious to know more about?

## I'm working with renv, and packages are in "unfamiliar" places, where renv is making them go. 
## This is what I am expected though, having made that choice. I'm mostly
## curious about why some are still in the cache alone and not in the main library.

# If you have time to do more. -------------------------------------------------

# Is every installed package either base or recommended?
# Explore package naming conventions (all lower case, contains '.', etc)
# Use `fields` argument to installed.packages() to get more info.
#   -- What proportion of packages have a URL that point to github?
inst |> 
  group_by(Depends) |> 
  tally()

inst |> 
  mutate(
    dots = grepl("\\.", Package)
  ) |> 
  group_by(dots) |> 
  tally()
