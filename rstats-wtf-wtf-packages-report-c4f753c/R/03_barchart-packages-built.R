# Restart R here!
library(ggplot2)

# 1. Read data/add-on-packages-freqtable.csv into a data frame.-----------------
# hint: readr::read_csv() or read.csv()
# idea: try using here::here() to create the file path
pkgs_addon_freqtable <- readr::read_csv(here::here("data/add-on-packages-freqtable.csv"))

# 2. Make a barchart from the frequency table you read in. ---------------------
# if you use ggplot2, code like this will work:
ggplot(pkgs_addon_freqtable, aes(x = Built, y = n)) +
  geom_col()

# 3. Write this barchart to figs/built-barchart.png. ---------------------------
# f you use ggplot2, ggsave() will help.
# idea: try using here::here() to create the file path
ggsave(here::here("figs/built-barchart.png"))
# ----
# YES overwrite the file that is there now
# that is old output from Jenny
