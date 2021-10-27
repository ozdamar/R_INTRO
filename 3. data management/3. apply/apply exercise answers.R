A = matrix(data = c(6,34,923,5,0, 112:116, 5,9,34,76,2, 545:549),5,4)
           
# Q1: Get the mean of each row
apply(A, MARGIN = 1, FUN = mean)

# Q2: Get the mean of each column
apply(A, MARGIN = 2, FUN = mean)

# Q3: Sort the columns in ascending order
apply(A, MARGIN = 2, FUN = sort)

# Q4: Use ‘apply’ to perform a modular division by 10 on each value of A. 
# The new matrix contains the rest of the modular division.
apply(A, c(1,2), function(x) x%%10)

# Q5: Use three ‘apply’ family functions to get the minimum values of each 
# column of the ‘mtcars’ dataset (hint: ‘lapply’, ‘sapply’, ‘mapply’).
# Store each output in a separate object (‘l’, ‘s’, ‘m’) and get the outputs.
l<- lapply(mtcars, FUN = min)
s<- sapply(mtcars, FUN = min)
m<- mapply(mtcars, FUN = min)

# Q6: Put the three outputs ‘l’, ‘s’, ‘m’ in the list ‘listobjects’
listobjects = list(l, s, m)

# Q7: Use a suitable ‘apply’ function to get the class of each of the
# three list elements in ‘listobjects’
sapply(FUN = class, X = listobjects)

# Q8: Use ‘mapply’ to get a list of 10 elements. The list is an alteration of ‘A’
# and ‘F’. The lengths of those 10 alternating elements decreases step by 
# step from 10 to 1. expected result:
# $A
# [1] "A" "A" "A" "A" "A" "A" "A" "A" "A" "A"
# $F
# [1] "F" "F" "F" "F" "F" "F" "F" "F" "F"
# $<NA>
# [1] "A" "A" "A" "A" "A" "A" "A" "A"
# $<NA>
# [1] "F" "F" "F" "F" "F" "F" "F"
# $<NA>
# [1] "A" "A" "A" "A" "A" "A"
# $<NA>
# [1] "F" "F" "F" "F" "F"
# $<NA>
# [1] "A" "A" "A" "A"
# $<NA>
# [1] "F" "F" "F"
# $<NA>
# [1] "A" "A"
# $<NA>
# [1] "F"

mapply(rep, c("A", "F"), 10:1)

# Q9: Tweak the function that you get proper element numbers (1 : 10) for the
# 10 list elements. Hint: argument USE.NAMES. expected result:
# [[1]]
# [1] "A" "A" "A" "A" "A" "A" "A" "A" "A" "A"
# [[2]]
# [1] "F" "F" "F" "F" "F" "F" "F" "F" "F"
# [[3]]
# [1] "A" "A" "A" "A" "A" "A" "A" "A"
# [[4]]
# [1] "F" "F" "F" "F" "F" "F" "F"
# [[5]]
# [1] "A" "A" "A" "A" "A" "A"
# [[6]]
# [1] "F" "F" "F" "F" "F"
# [[7]]
# [1] "A" "A" "A" "A"
# [[8]]
# [1] "F" "F" "F"
# [[9]]
# [1] "A" "A"
# [[10]]
# [1] "F"
mapply(rep, c("A", "F"), 10:1, USE.NAMES = F)
#proper element numbers

# Q10: Use an appropriate apply function to get the sum of males vs females
# aboard for data("Titanic")
apply(Titanic, 2, sum)

# Q11: Get a table with the sum of survivors vs sex.
apply(Titanic, c(2,4), sum)

# Q12: Get a table with the sum of passengers by sex vs age.
apply(Titanic, c(3,2), sum)

#  Create ‘listobj’ 
first <- matrix(38:66, 3)
second <- matrix(56:91, 3)
third <- matrix(82:145, 3)
fourth <- matrix(46:93, 5)
listobj <- list(first, second, third, fourth)

# Q13: Extract the second column from the list of matrices (from each single matrix).
lapply(listobj,"[", , 2)

# Q14: Extract the third row from the list of matrices.
lapply(listobj,"[", 3 , )

# Q15: Get a boxplot for each numerical column of the ‘iris’ dataset (four boxplots).

# Q16: use vioplot::vioplot() for violin plot for each numeric column, 
# remove any numbers from the x axis, use color = salmon
library(vioplot)
apply(iris[,1:4], 2, vioplot, col = "salmon", names = "")

# Q17: Find out which column of iris is not numeric.
which(sapply(iris, class) != "numeric")

# Q18: Identify the levels of the non-numeric column (hint: ‘levels’ function).
levels(iris$Species)

# Q19: Try the function “unique” instead, compare the output.
unique(iris$Species)
# "levels" gets you character outputs which are easier to work with,
# "unique" gets you the original factors

# Load the library ‘ggplot2’, and dataset ‘diamonds’.
# Q18: Which columns are not numeric in class?.
which(sapply(diamonds, class) != "numeric")

# Q20: For observations 10000 to 11000, get the mean of columns 8, 9, 10.
apply(diamonds[10000:11000, 8:10], 1, mean)

# Q21: Get Q19 answer with rounding to one digit.
round(apply(diamonds[10000:11000, 8:10], 1, mean),1)

# Q22: Sort the rounded results in ascending order.
sort(round(apply(diamonds[10000:11000, 8:10], 1, mean),1))

# Q23: Use ‘aggregate’ on ‘mtcars’. Calculate the median for each column 
# sorted by the number of carburetors. Use the standard ‘x’, ‘by’ and ‘FUN’ arguments.
aggregate(x = mtcars, by = list(mtcars$carb), FUN = median)

# Q24: Calculate again the median based on ‘carb’, but this time use the 
# ‘formula-dot’ (.~ ) notation.
aggregate(. ~ carb, data = mtcars, median)
