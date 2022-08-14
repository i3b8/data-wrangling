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

