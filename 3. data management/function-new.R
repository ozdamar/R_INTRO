https://campus.datacamp.com/courses/r-for-sas-spss-and-stata-users-r-tutorial/chapter-15-writing-functions?ex=9


myFun <- function(x) { other functions }

mymean <- function(x) {
  mean(x, na.rm = TRUE)
}

# Apply mymean on `pretest`
mymean(pretest)

Only the last object that you created will be returned by a function call.
So when you would like to return multiple objects, you have to create 
a vector that contains these objects. In this vector, you can specify
a name for each result.

mystats <- function(x) {
  mymean <- mean(x, na.rm = TRUE)
  mysd <- sd(x, na.rm = TRUE)
  mymedian <- median(x, na.rm = TRUE)
  mymax <- max(x, na.rm = TRUE)
  mymin <- min(x, na.rm = TRUE)
  c(mean = mymean, sd = mysd, median = mymedian, max = mymax, min = mymin)
}

# Apply mystats on pretest
mystats(pretest)


by() allows you to apply a particular function by group.
First, you define the variable you want to apply the function to,
next the grouping variable, and finally the function you want to apply. 
For example, to apply myfunction on mydataframe that is subsetted by the 
values of myfactor: by(mydataframe, myfactor, myfunction)

by(pretest, gender, mystats)

Instead of defining and naming a new function, you can also pass the values of the new function directly into another function. For example, to apply a function that calculates the sum and the maximum on a data frame mydataframe grouped by myfactor:
  
  by(mydataframe, myfactor, function(x) {c(sum(x), max(x))})
Notice however, that this is harder to debug.


by(pretest, gender, function(x) {c(mean(x),min(x))})
