####################################################
##                                                ##
##                                                ##
##                    2018                        ##
##                                                ##
##  E. Ozge Ozdamar - ozge.ozdamar@msgsu.edu.tr   ##
####################################################
##                                                ##
##                   reporting                    ##
##                                                ##
####################################################


#               references
#---------------------------------------------------
# https://hughjonesd.github.io/reporting-data-with-huxtable-4.3.0.html#dealing-with-masses-of-data

#               libraries
#---------------------------------------------------
rm(list=ls())
.packages = c("htmlwidgets","pivottabler","rpivotTable","ReporteRs","sjPlot","sjmisc","huxtable")
.inst <- .packages %in% installed.packages()
if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])
lapply(.packages, require, character.only=TRUE)

#               functions
#---------------------------------------------------


#               data
#---------------------------------------------------
head(mtcars)


#--------------------------#
#    create pivot table    #
#--------------------------#

# library(htmlwidgets)
# library(rpivotTable)

rpivotTable(mtcars, rows="gear", col="cyl", aggregatorName="Average", 
            vals="mpg", rendererName="Treemap")

rpivotTable(mtcars,rows="gear", cols=c("cyl","carb"),width="100%", height="400px")

#------------------------------#
#    write tables to MsWord    #
#------------------------------#

# library(ReporteRs)
## ------------------------------------------------------------------------
doc <- docx()
data <- mtcars[1:5,1:4 ]

# Default table
doc <- addTitle(doc, "Default table")
doc <- addFlexTable( doc, FlexTable(data))
doc <- addParagraph(doc, c("", "")) # 2 line breaks

# Add  table theme : vanilla table
doc <- addTitle(doc, "Vanilla table")
doc <- addFlexTable( doc, vanilla.table(data),par.properties = parCenter())
# par.properties = parRight, parLeft, parJustify
writeDoc(doc, file = "T1.doc")

# striped tables
doc <- addTitle(doc, "striped tables")
Table <- vanilla.table(data)
Table <- setZebraStyle(Table, odd = '#eeeeee', even = 'white')
doc <- addFlexTable( doc, Table)
writeDoc(doc, file = "T1.doc")

# Change columns and rows background colors
doc <- addTitle(doc, "Change columns and rows background colors")
Table = FlexTable(data = data )
# i : row index; j : column index
Table = setRowsColors(Table, i=2:3, colors = 'lightblue')
Table = setColumnsColors(Table, j=3, colors = 'pink' )
doc <- addFlexTable(doc, Table)
writeDoc(doc, file = "T1.doc")


# Change the background colors of column 2 according to mpg
doc <- addTitle(doc, "Change the background color of cells")
Table <- FlexTable(data)
Table <- setFlexTableBackgroundColors(Table, j = 2,
                                         colors = ifelse(data$mpg < 20, '#DDDDDD', 'orange'))
doc <- addFlexTable( doc, Table)
writeDoc(doc, file = "T1.doc")

# Format the text of some cells (column 3:4)
doc <- addTitle(doc, "Format cell text values")
Table = FlexTable(data)
Table[, 3:4] = textProperties(color = 'blue')
doc <- addFlexTable( doc, Table)
writeDoc(doc, file = "T1.doc")

# Insert a content into a table
doc <- addTitle(doc, "Insert a content")
Table = FlexTable(data, header.columns= FALSE )
# Add first header row
Table <- addHeaderRow(Table, 
                      value = c('A', 'B', 'C'), 
                      text.properties = textBold(color="orange"), 
                      colspan = c( 2, 1, 1))
# Add second header row
Table = addHeaderRow(Table, value = names(data),
                        text.properties = textBold())

# Add footer row
Table <- addFooterRow(Table, 
                         value = 'mtcars data',
                         colspan = 4, 
                         text.properties = textBoldItalic(color ="blue"))
# Add symbol
Table[data$cyl==4, 'disp',
         text.properties = textBold(vertical.align = 'superscript',
                                    color = "red")] = '(1)'
doc <- addFlexTable( doc, Table)
writeDoc(doc, file = "T1.doc")

data(mtcars)
cormatrix = cor(mtcars)
col =c("#B2182B", "#D6604D", "#F4A582", "#FDDBC7",
       "#D1E5F0", "#92C5DE", "#4393C3", "#2166AC")
mycut = cut(cormatrix,
            breaks = c(-1,-0.75,-0.5,-0.25,0,0.25,0.5,0.75,1),
            include.lowest = TRUE, label = FALSE )
color_palettes = col[mycut]
corrFT = FlexTable( round(cormatrix, 2), add.rownames = TRUE )
corrFT = setFlexTableBackgroundColors(corrFT,
                                      j = seq_len(ncol(cormatrix)) + 1,
                                      colors = color_palettes )
corrFT = setFlexTableBorders( corrFT
                              , inner.vertical = borderProperties( style = "dashed", color = "white" )
                              , inner.horizontal = borderProperties( style = "dashed", color = "white"  )
                              , outer.vertical = borderProperties( width = 2, color = "white"  )
                              , outer.horizontal = borderProperties( width = 2, color = "white"  )
)
doc <- addFlexTable( doc, corrFT)
writeDoc(doc, file = "T1.docx")

## ------------------------------------------------------------------------
# library(sjPlot)
# library(sjmisc)

data(iris)

# descriptive table
tab_df(iris, file = "T2.1.doc")


# contingency table

iris$LongPetal <- ifelse(iris$Petal.Length > 4.5, 1, 0)
sjt.xtab(iris$Species, iris$LongPetal, file = "T2.2.doc")

# correlation matrix
sjt.corr(iris[,c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")],
         file = "T2.3.doc")


#------------------------------#
#    flexdashboard             #
#------------------------------#

library(flexdashboard)
# File > New > ..

# adjust column widths

Column {data-width=650}
Column {data-width=250}

# change row orientation

#output: 
#  flexdashboard::flex_dashboard:
#    orientation: rows

# tabset
Column {.tabset}
# add more pplots

# add pages
page1
=====================================

page2
=====================================

  
library(tabulizer)
library(dplyr)
location <- "https://www.edd.ca.gov/jobs_and_training/warn/WARN-Report-for-7-1-2017-to-06-30-2018.pdf"
out <- extract_tables(location)
final <- do.call(rbind, out[-length(out)])




