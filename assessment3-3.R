day <-c("Monday","Tuesday")
staff <-c("Mandy, Chris and Laura","Steve, Ruth and Frank")
schedule <-data.frame(day,staff)
schedule
library(tidyverse)

#str_split(schedule$staff, ",|and") no 
#str_split(schedule$staff, ", | and ") yes
#str_split(schedule$staff, ",\\s|\\sand\\s") yes
#str_split(schedule$staff, "\\s?(,|and)\\s?") yes 

# turn into tidy : day staff 
#tidy <- schedule %>% 
#  mutate(staff = str_split(staff, ", | and ")) %>% 
#  unnest()
#tidy <- separate(schedule, staff, into = c("s1","s2","s3"), sep = “,”) %>% 
 # gather(key = s, value = staff, s1:s3)

#tidy <- schedule %>% 
 # mutate(staff = str_split(staff, ", | and ", simplify = TRUE)) %>% 
  #unnest(cols=c(day,staff))  no 

tidy <- schedule %>% 
  mutate(staff = str_split(staff, ", | and ")) %>% 
  unnest(cols=c(day,staff))
data("gapminder")
dat <- gapminder %>% filter(region == "Middle Africa") %>% 
  mutate(recode(country, 
                "Central African Republic" = "CAR", 
                "Congo, Dem. Rep." = "DRC",
                "Equatorial Guinea" = "Eq. Guinea"))



dat <- gapminder %>% filter(region == "Middle Africa") %>% 
  mutate(country = recode(country, 
                          "Central African Republic" = "CAR", 
                          "Congo, Dem. Rep." = "DRC",
                          "Equatorial Guinea" = "Eq. Guinea"))




dat <- gapminder %>% filter(region == "Middle Africa") %>% 
  mutate(country_short = recode(country, 
                                "Central African Republic" = "CAR", 
                                "Congo, Dem. Rep." = "DRC",
                                "Equatorial Guinea" = "Eq. Guinea"))






dat


str_detect(19.5,"[1-9]*\\.5")


library(rvest)
library(tidyverse)
library(stringr)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
tab <- read_html(url) %>% html_nodes("table")
polls <- tab[[6]] %>% html_table(fill = TRUE)

polls
colnames(polls) <- c("dates", "remain", "leave", "undecided", "lead", "samplesize", "pollster", "poll_type", "notes")

polls <- polls %>%filter(str_detect(remain, "[1-9]*\\%[1-9]*"))


#as.numeric(str_remove(polls$remain, "%"))
#as.numeric(polls$remain)/100
#parse_number(polls$remain)
#str_remove(polls$remain, "%")/100
as.numeric(str_replace(polls$remain, "%", ""))/100
parse_number(polls$remain)/100

str_replace(polls$undecided,"N/A","0")




temp <- str_extract_all(polls$dates,"\\d+\\s[a-zA-Z]{3,5}")
end_date <- sapply(temp, function(x) x[length(x)]) # take last element (handles polls that cross month boundaries)

temp
