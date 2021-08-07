## main script

## getting the session info
sessionInfo()

## Data structures

# 1. creating a dataframe
cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))
cats
## 2.Expoling the data
names(cats) # getting column names
cats$coat # getting specifically the coat column details
## 3. Other operations on columns
cats$weight + 2
paste("my cat is",cats$coat)
