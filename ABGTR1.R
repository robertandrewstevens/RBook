# http://www.highstat.com/book3.htm
# A Beginner's Guide to R (2009). Zuur, Ieno and Meesters. Springer

# Chapter 1:  Introduction

# 1.1 What Is R?

# 1.2 Downloading and Installing R

# 1.3 An Initial Impression

2 + 2

log(2)

log10(2)

2 + 2w

# 1.4 Script Code

# 1.4.1 The Art of Programming

# setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook") # on Mac
ISIT <- read.table("ISIT.txt", header = TRUE)
library(lattice)
xyplot(Sources ~ SampleDepth | factor(Station),
       data = ISIT,
       xlab = "Sample Depth",
       ylab = "Sources",
       strip = function(bg = "white", ...) 
         strip.default(bg = "white", ...), 
       panel = function(x, y) { 
         panel.grid(h = -1, v = 2)
         I1 <- order(x)
         llines(x[I1], y[I1], col = 1)
       }
)

# 1.4.2 Documenting Script Code

# setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook") # on Mac
ISIT <- read.table("ISIT.txt", header = TRUE)
# Start the actual plotting
# Plot Sources as a function of SampleDepth, and use a 
# panel for each station.
# Use the colour black (col = 1), and specify x and y 
# labels (xlab and ylab). Use white background in the 
# boxes that contain the labels for station
xyplot(Sources ~ SampleDepth | factor(Station),
       data = ISIT,
       xlab = "Sample Depth",
       ylab = "Sources",
       strip = function(bg = "white", ...) 
         strip.default(bg = "white", ...), 
       panel = function(x, y) {
         # Add grid lines
         # Avoid spaghetti plots
         # plot the data as lines (in the colour black)
         panel.grid(h = -1, v = 2)
         I1 <- order(x)
         llines(x[I1], y[I1], col = 1)
       }
)

# setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook") # on Mac
ISIT <- read.table("ISIT.txt", header = TRUE)
library(lattice) # Load the lattice package

# Start the actual plotting
# Plot Sources as a function of SampleDepth, and use a 
# panel for each station.
# Use the colour black (col = 1), and specify x and y 
# labels (xlab and ylab). Use white background in the 
# boxes that contain the labels for station
xyplot(Sources ~ SampleDepth | factor(Station),
       data = ISIT,
       xlab = "Sample Depth",
       ylab = "Sources",
       strip = function(bg = "white", ...) 
         strip.default(bg = "white", ...), 
       panel = function(x, y) {
         # Add grid lines
         # Avoid spaghetti plots
         # plot the data as lines (in the colour black)
         panel.grid(h = -1, v = 2)
         I1 <- order(x)
         llines(x[I1], y[I1], col = 1)
       }
)

# 1.5 Graphing Facilities in R

# 1.6 Editors

# 1.7 Help Files and Newsgroups

?boxplot

help(boxplot)

boxplot(count ~ spray, data = InsectSprays, col = "lightgray")

?InsectSprays

# 1.8 Packages

# 1.8.1 Packages Included with the Base Installation

library(MASS)

# 1.8.2 Packages Not Included with the Base Installation

# 1.8.2.1 Loading the Package

# 1.8.2.2 How Good Is a Package?

# 1.9 General Issues in R

# 1.9.1 Quitting R and Setting the Working Directory

q()

q(save = "no")

#setwd(file = "C:\\AnyDirectory\\") # on PC
#setwd(file = "C:/AnyDirectory/") # on PC
setwd("~/GitHub/") # on Mac

rm(list = ls(all = TRUE))

# 1.10 A History and a Literature Overview

# 1.10.1 A Short Historical Overview of R

# 1.10.2 Books on R and Books Using R

# 1.10.2.1 The Use R! Series

# 1.11 Using This Book

# 1.11.1 If You Are an Instructor

# 1.11.2 If You Are an Interested Reader with Limited R Experience

# 1.11.3 If You Are an R Expert

# 1.11.4 If You Are Afraid of R

# 1.12 Citing R and Citing Packages

citation()

citation("lattice")

# 1.13 Which R Functions Did We Learn?
