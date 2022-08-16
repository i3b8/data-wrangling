filename <- "murders.csv"
dir <- system.file("extdata", package = "dslabs") 
fullpath <- file.path(dir, filename)
file.copy(fullpath, "murders.csv")

system.file("extdata",package="dslabs")

path <-system.file("extdata",package ="dslabs")
list.files(path)

filename <-"murders.csv"
fullpath <- file.path(path,filename)
fullpath
file.copy(fullpath,getwd())
file.exists((filename))

##The readr and readxl Packages 
library(tidyverse)
read_lines("murders.csv",n_max =3)
dat <- read_csv(filename)
dat <-read_csv(fullpath)

#Importing Data Using R-base Functions
filename <- "murders.csv"
dat2 <-read.csv(filename)
class(dat2)

#Downloading Files from the Internet

url <- "https://raw.githubusercontent.com/rafalab/dslabs/master/inst/extdata/murders.csv"
dat <- read_csv(url)
#local copy of the file 
download.file(url,"murders.csv")

##creating temporary names 
tmp_filename <-tempfile()
download.file(url,tmp_filename)
dat<-read_csv(tmp_filename)
file.remove(tmp_filename)



### Assessment ###
library(tidyverse)
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
download.file(url,"assessment")
read_lines("assessment",n_max =3)
## note it is not with header 
## to read and inspect data
dat <- read_csv("assessment",col_names = FALSE)


##Seperate 
# import data
path <- system.file("extdata", package = "dslabs")
fname <-  "life-expectancy-and-fertility-two-countries-example.csv"
filename <- file.path(path, fname)

raw_dat <- read_csv(filename)
select(raw_dat, 1:4)

# pivot all columns except country
dat <- raw_dat %>% pivot_longer(-country)
head(dat)
dat$name[1:5]

# separate on underscores
dat %>% separate(name, c("year", "name"), sep = "_")

# separate on underscores (the default), convert years to numeric
dat %>% separate(name, c("year", "name"), convert = TRUE)

# split on all underscores, pad empty cells with NA
dat %>% separate(name, c("year", "name_1", "name_2"), 
                 fill = "right", convert = TRUE)
# split on first underscore but keep life_expectancy merged
dat %>% separate(name, c("year", "name"), sep = "_", 
                 extra = "merge", convert = TRUE)
# separate then create a new column for each variable using pivot_wider
dat %>% separate(name, c("year", "name"), sep = "_", 
                 extra = "merge", convert = TRUE) %>%
  pivot_wider()

#Unite 
