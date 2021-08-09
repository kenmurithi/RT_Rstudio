## main script

## getting the session info
sessionInfo()

## Data structures

# 1. creating a dataframe
cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))
cats
typeof(cats["coat"])
typeof(cats$coat)

## 2.Exploring the data

names(cats) # getting column names
names(cats)[2] <- "weight_kg" # renaming the column names
names(cats)
cats
cats$coat # getting specifically the coat column details

## 3. Other operations on columns

cats$weight + 2
paste("my cat is",cats$coat)

## 4.Coercion and further data exploration

a = as.numeric(cats$coat)
b = as.numeric(cats$weight)
a+b
a
b
typeof(cats$weight)
class(cats$weight)
typeof(1L)
c=1.2
d=2
typeof(c)
typeof(d)
class(c)
class(d)

## 5.factors

coats <- c('tabby', 'tortoiseshell', 'tortoiseshell', 'black', 'tabby')
coats
str(coats) # structure of coats and we get its a character
CATegories <- factor(coats) # creating the factors
is.factor(CATegories)
class(CATegories)
levels(CATegories)

## Challenge 2
## Is there a factor in our cats data.frame?

cats
str(cats)
is.factor(cats$coat)
cats$coat_factor <- factor(cats$coat, levels = c("calico","black","tabby"),labels = c(1,2,3))
cats
is.factor(cats$coat_factor) # its a factor

## 6.lists

list_example <- list(1, "a", TRUE, 1+4i)
list_example
another_list <- list(title = "Numbers", numbers = 1:10, data = TRUE )
another_list
## challenge 3
cats
cats[1] # has indexes
cats[[1]] # no indexes
typeof(cats[[1]]) 
cats["coat"]
cats[1,1] # calcio
cats[, 1] # all rows but column one

## matrices
# skipped this

# 7.exploring data frame

age <- c(2, 3, 5)
age
cats

cats = cbind(cats,age)
cats
newRow <- list("tortoiseshell", 3.3, TRUE, 9)
cats <- rbind(cats, newRow)

str(cats)
cats
human_age = cats$age*7
human_age
str(human_age)
as.factor(human_age)
as.numeric(human_age)

cats
cats = cats[-3,]
cats


df <- data.frame(id = c("a", "b", "c"),
                 x = 1:3,
                 y = c(TRUE, TRUE, FALSE),
                 stringsAsFactors = FALSE)
df

inf = data.frame(first_name = c("ken"),
                 last_name = c("Mugambi"),
                 lucky_number = c(13),
                 stringsAsFactors = FALSE)
inf

r = list("roger", "mugambi", 10)
inf = rbind(inf,r)

inf

getwd()

# realistic example
gapminder <- read.csv("./data/gapminder_data.csv", stringsAsFactors = TRUE)

head(gapminder)
tail(gapminder)
tail(gapminder, n = 15)

gapminder[sample(nrow(gapminder), 5), ]

## 8.Subsetting
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)
# values in x that are greater than 4 and less than 7

x1 = x>4 & x <7
x[x1]

# Vector subsetting

x <- 1:3
x
names(x) <- c('a', 'a', 'a')
x
x['a']  # only returns first value
names(x) == "a"
x[names(x) == 'a']  # returns all three values
x[names(x)!=c("a","c")]

seAsia <- c("Myanmar","Thailand","Cambodia","Vietnam","Laos")
gapminder <- read.csv("data/gapminder_data.csv", header=TRUE)
names(gapminder)
countries <- gapminder$country
countries %in% seAsia

## matrix subsetting


## dataframe

gap_head <- head(gapminder)
gap_head
gap_head[1]
gap_head["country"]
gap_head$country
gap_head[["country"]]

## conditionals
x <- 8

if (x >= 10) {
  print("x is greater than or equal to 10")
} else {
  print("x is less than 10")
}
# ifelse function 
##ifelse(condition is true, perform action, perform alternative action) 
gapminder[(gapminder$year == 2002),]
if (2002 %in% gapminder$year ){
  print("yes, present")
}else{
  print("absent")
}
ifelse(2002 %in% gapminder$year, "present", "absent")

## dplyr session

data <- data.frame(x1 = 1:6,   ## creating data
                   x2 = c(1,2,2,3,1,2),
                   x3 = c("F","B","C","E","A","D"))
data ## print data
install.packages("dplyr") ## installing the package
library(dplyr)
help("dplyr-package")

## functions
arrange(data,x3) # using the arrange function
filter(data,x2 == 2 | x1  == 2) # filter function
mutate(data,x4 = x1 + x2) # adds new variables that are functions of existing variables
pull(data,x2) # return to a vector form
rename(data,new_data = x3)
select(data,c(x2,x3))## select the variables by names

## tidyr

# principles of tidy data
# 1. Every column is a variable
# 2. Every row is an observation
# 3. every cell is a single value
