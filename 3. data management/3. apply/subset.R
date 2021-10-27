####################################################
##                                                ##
##              INTRODUCTION TO R                 ##
##                    2018                        ##
##                                                ##
##  E. Ozge Ozdamar - ozge.ozdamar@msgsu.edu.tr   ##
####################################################
##                                                ##
##             template                           ##
##                                                ##
####################################################

#               references
#---------------------------------------------------

#               libraries
#---------------------------------------------------
.packages = c("janitor","epiDisplay","summarytools","gmodels","questionr")
.inst <- .packages %in% installed.packages()
if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])
lapply(.packages, require, character.only=TRUE)

#               functions
#---------------------------------------------------

# stats::dist()

#               data
#---------------------------------------------------



#-------------#
#   subset    #
#-------------#

# Return subsets of vectors, matrices or data frames which meet conditions.

# subset(x, subset, select, drop = FALSE, ...)

x <- c(9, 3, NA, 6, 9, NA)
subset(x, x > 5)
x[x > 5]

# matrice
mat1 <- matrix(1:20, nrow=4, byrow=TRUE)
colnames(mat1) <- c("A", "B", "C", "D", "E")
mat1

# subset matrix by row and column
subset(mat1, select=c("C", "D", "E"))

# 
head(mtcars)
subset(mtcars,select = mpg)
subset(mtcars,mpg > 20, )
subset(mtcars,mpg > 20 & carb == 2, )
subset(mtcars,mpg > 20, select = c(drat,wt,qsec))
subset(mtcars,mpg > 20, select = -c(drat,wt,qsec))
subset(mtcars,cyl == 4, select = c(disp,drat:gear))

subset(mtcars,select = mpg>=20 | mpg<10)
subset(mtcars,select = mpg)

# Basics of the with() function
#==============================================================
mat1
mat1DF <- as.data.frame(mat1)
head(mat1DF)

with(mat1DF, E - A) 

# Adding the results as a new column to mat1DF directly
mat1DF$EminusA <- with(mat1DF, E - A) 
# or
EminusA <- with(mat1DF, E - A)
mat1DF <- cbind(mat1DF, EminusA)
# or
mat1DF <- cbind(mat1DF, EminusA=with(mat1DF, E - A))


# Basics of the which() function
#==============================================================

# Simple example working with a logical vector we create
# you can use T and F instead of TRUE and FALSE
logicalVector <- c(TRUE, T, FALSE, F, F, F, T) 

trueIndices <- which(logicalVector)
logicalVector[trueIndices]
trueIndices

# For the FALSE entries
logicalVector[-trueIndices]

# You can also use 1 and 0 for TRUE and FALSE
logicalVector2 <- as.logical(c(1, 0, 1, 1, 1, 0, 0)) 
which(logicalVector2)

# You get the FALSE entries with the NOT operator !
which(!logicalVector2)
logicalVector2[which(!logicalVector2)]

# Example working with boolean operators
x <- c(1:5, 10:15, 67, 893, 7927)
x > 100

# Now to return the indices for the elements of x > 100
which(x > 100)
# to see the values
x[which(x > 100)]

# Practical example looking at the actin levels by sample group
ACTIN_ug <- c(1280, 787, 768, 1208, 909, 564, 1255, 223, 564)

# Sample groups are spleen (SPN) and bone marrow (BM)
sampleTissue <- c("SPN", "BM", "BM", "SPN", "SPN", "BM", "SPN", "BM", "BM")
sampleNumber <- rep(c("M2179", "M6765", "M5526"), each=3)

# Create a data frame with the entries we have created
ACTINdf <- data.frame(ACTIN_ug, sampleTissue, sampleNumber, stringsAsFactors=FALSE)

# Function to test if sample matches a given tissue and sample number 
testTissueSample <- function(x, tissue, sampleNb){
  if(x[1]==tissue && x[2]==sampleNb) return(TRUE) else return(FALSE)
}

# We are interested in column 2 and 3 that contains the tissue and sample number info
head(ACTINdf[, 2:3])

# Apply the function we have created by row on the ACTINdf[, 2:3] data frame
M6765spn <- apply(ACTINdf[, 2:3], 1, testTissueSample, tissue="SPN", sampleNb="M6765")
M6765spn

# Now let's return the indice where it found tissue="SPN" and sampleNb="M6765"
which(M6765spn)

# We can check the results, as follows:
ACTINdf[which(M6765spn), ] # since which(M6765spn) also corresponds to the row numbers in ACTINdf with tissue="SPN" and sampleNb="M6765"

#==============================================================
# Basics of the grep() function
#==============================================================

x <- c("zapple", "mapple", "apple", "apple2")

grep("apple", x)
grep("apple2", x)

# using regular expressions with fixed=FALSE
# ^ means "starts with"
grep("^apple", x, fixed=FALSE)

# $ means "ends with"
grep("apple$", x, fixed=FALSE)

# To search for for an exact match with apple
# \b used to define the boundary, 
# you must use the escape character with fixed=TRUE, hence \\b
grep("\\bapple\\b", x, fixed=FALSE)

# Using grep, we could have found the entries tissue="SPN" and sampleNb="M6765", as follows: 
ACTINsamps <- paste(sampleTissue, sampleNumber, sep="_")

grep("SPN_M6765", ACTINsamps)
# or on the safer side
grep("\\bSPN_M6765\\b", ACTINsamps) # fixed=FALSE by default


# setwd("~/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 2/Video 2.3")
#==============================================================
# Basics of the sort() function
#==============================================================

Sort (or order) a vector or factor (partially) into ascending or descending order. For 
ordering along more than one variable, e.g., for sorting data frames, see order.

# To sort by ascending order
# by default the sort() function decreasing argument is set to FALSE
x <- c(1897, 12, 23, 7, 9, 210, 2)
sort(x)

# To sort by descending order
sort(x, decreasing=TRUE)

# You can also sort character vectors
fruits <- c("apple", "pear", "banana", "grapes")
sort(fruits)

sort(fruits, decreasing=TRUE)

# For our detailed example let's load the gene expression data from video 2.1
# example2_1exprsdata.txt

exprs <- read.delim("example2_1exprsdata.txt", row.names=1)
head(exprs)

# Let's create a vector containing all the genes and expression values for the MLL1 sample
MLL1_exprs <- exprs$MLL_1

# To add the gene names to the expression values
names(MLL1_exprs) <- rownames(exprs)
head(exprs)
head(MLL1_exprs)

# Sort the MLL1_exprs from highest to lowest expression value
MLL1hiLow <- sort(MLL1_exprs, decreasing=TRUE)

# For the top 10 genes by expression
MLL1top10 <- MLL1hiLow[1:10]
MLL1top10

# To get the indices for the sorted elements of the MLL1_exprs
MLL1hiLow <- sort(MLL1_exprs, decreasing=TRUE, index.return=TRUE)
# notice the sort function returns a list with the sorted vector stored in $x
# and the index positions stored in $xi 
MLL1hiLow 

# Instead of using the sort function to retrieve the indices we could use the order() function
# By ascending order
order(MLL1_exprs)
# By descending order
order(MLL1_exprs, decreasing=TRUE)
# which is the same as 
MLL1hiLow$ix

# We use the order() to sort a data frame 
exprsMLL1ord <- exprs[order(exprs$MLL_1, decreasing=TRUE), ]
head(exprsMLL1ord, 10) # to print the first 10 rows

# To simplify our code we could use the with() function
exprsMLL1ord1 <- with(exprs, exprs[order(MLL_1, decreasing=TRUE), ])
head(exprsMLL1ord1, 10)

# Since we know the indices from MLL1$ix we could have also written
exprsMLL1ord2 <- exprs[MLL1hiLow$ix, ]
head(exprsMLL1ord2, 10)

# You can also order your data frame by multiple variables.
# To order the exprs data frame by MLL_1 followed by MLL_2 values
# instead of using the decreasing argument you can use minus "-" sign 
inds <- with(exprs, order(-MLL_1, -MLL_2))
exprsMLL1_2ord <- exprs[inds, ]
head(exprsMLL1_2ord, 20)

# to order exprs with MLL_1 ascending then MLL_2 descending
inds <- with(exprs, order(MLL_1, -MLL_2))
exprsMLL1_2ord <- exprs[inds, ]
head(exprsMLL1_2ord, 20)

# might be easier to see names with names and ages
# eg. sort by oldest to youngest then by name in alphabetical order
lab_members <- data.frame(First_name=c("Mathew", "Carol", "John"), Age=c(27, 56, 18), stringsAsFactors=FALSE)
with(lab_members, lab_members[order( -Age, First_name), ])






