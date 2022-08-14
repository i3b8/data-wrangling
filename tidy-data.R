library(tidyverse)
library(dslabs)
## gapminder in dslabs 
data("gapminder")
tidy_data <- gapminder %>%filter(country %in%c("South Korea",
                                               "Germany"))%>%
  select(country,year,fertility)
head(tidy_data)

tidy_data %>% ggplot(aes(year,fertility,color=country))+
  geom_point()

## here is the original data 
path <- system.file("extdata",package="dslabs")
filename <- file.path(path,"fertility-two-countries-example.csv")
wide_data <- read_csv(filename)


## Reshpae the data : pivot longer 
wide_data %>% select(country,'1960':'1965')
## move columns 61 ... to a single column 
wide_data %>% pivot_longer('1960':'2015')
## or ##
wide_data%>% pivot_longer(-country)
## give meaningful names for columns 
new_tidy_data <- wide_data %>% pivot_longer(-country,names_to = "year", values_to = "fertility")
## transform to integers 
new_tidy_data <- wide_data %>% pivot_longer(-country,names_to = "year", values_to = "fertility",
                                            names_transform = list(year=as.numeric))
class(new_tidy_data$year)
head(new_tidy_data)
## plotting ##
new_tidy_data %>% ggplot(aes(year,fertility,color=country))+
  geom_point()


##Reshaping data: pivot wider
