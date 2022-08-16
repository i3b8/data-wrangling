library(tidyverse)
library(dslabs)
co2
head(co2)
co2_wide <- data.frame(matrix(co2, ncol = 12, byrow = TRUE)) %>% 
  setNames(1:12) %>%
  mutate(year = as.character(1959:1997))

co2_tidy <- pivot_longer(co2_wide, -year, names_to = "month", values_to = "co2")

co2_tidy

co2_tidy %>% ggplot(aes(as.numeric(month), co2, color = year)) + geom_line()

library(dslabs)
data(admissions)
dat <- admissions %>% select(-applicants)
dat


dat_tidy <- pivot_wider(dat, names_from = major, values_from = admitted)

dat_tidy <- pivot_wider(dat, names_from = admitted, values_from = major)
dat_tidy
dat_tidy <- pivot_wider(dat, names_from = gender, values_from = admitted)
dat_tidy

tmp <- gather(admissions, key, value, admitted:applicants)
tmp
#tmp2 <- pivot_wider(tmp, names_from = column_name, values_from = c(key, gender))
#tmp2 <- pivot_longer(tmp, names_to = "column_name", values_to = c("gender", "key"))
#tmp2 <- unite(tmp, column_name, c(gender, key))
#tmp2 <- pivot_wider(tmp, names_from = column_name, values_from = key, gender)
tmp2 <- unite(tmp, column_name, c(key, gender))
tmp2
