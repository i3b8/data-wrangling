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
