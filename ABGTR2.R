# http://www.highstat.com/book3.htm
# A Beginner's Guide to R (2009). Zuur, Ieno and Meesters. Springer

# Chapter 2:  Getting Data into R

# 2.1 First Steps in R

# 2.1.1 Typing in Small Datasets

a <- 59
b <- 55
c <- 53.5
d <- 55
e <- 52.5

a

Wing1 <- 59
Wing2 <- 55
Wing3 <- 53.5
Wing4 <- 55
Wing5 <- 52.5

sqrt(Wing1)
2*Wing1
Wing1 + Wing2
Wing1 + Wing2 + Wing3 + Wing4 + Wing5
(Wing1 + Wing2 + Wing3 + Wing4 + Wing5)/5

SQ.wing1 <- sqrt(Wing1)
Mul.W1 <- 2 * Wing1
Sum.12 <- Wing1 + Wing2
SUM12345 <- Wing1 + Wing2 + Wing3 + Wing4 + Wing5
Av <- (Wing1 + Wing2 + Wing3 + Wing4 + Wing5) / 5

SQ.wing1 <- sqrt(Wing1)

SQ.wing1

(SQ.wing1 <- sqrt(Wing1))

# 2.1.2 Concatenating Data with the c Function

Wingcrd <- c(59, 55, 53.5, 55, 52.5, 57.5, 53, 55)

Wingcrd

Wingcrd[1]

Wingcrd[1 : 5]

Wingcrd[-2]

sum(Wingcrd)

S.win <- sum(Wingcrd)
S.win

Tarsus <- c(22.3, 19.7, 20.8, 20.3, 20.8, 21.5, 20.6, 21.5)
Head <- c(31.2, 30.4, 30.6, 30.3, 30.3, 30.8, 32.5, NA)
Wt <- c(9.5, 13.8, 14.8, 15.2, 15.5, 15.6, 15.6, 15.7)

sum(Head)

sum(Head, na.rm = TRUE)

# 2.1.3 Combining Variables with the c, cbind, and rbind Functions

BirdData <- c(Wingcrd, Tarsus, Head, Wt)

BirdData

Id <- c(1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4)
Id

Id <- rep(c(1, 2, 3, 4), each = 8)
Id 

Id <- rep(1:4, each = 8)
Id

1:4

a <- seq(from = 1, to = 4, by = 1)
a

a <- seq(from = 1, to = 4, by = 1)
rep(a, each = 8)

VarNames <- c("Wingcrd", "Tarsus", "Head", "Wt")
VarNames

Id2 <- rep(VarNames, each = 8)
Id2

rep(VarNames, 8)

Z <- cbind(Wingcrd, Tarsus, Head, Wt)
Z

Z[ , 1]

Z[1:8, 1]

Z[2, ]

Z[2, 1:4]

Z[1, 1]
Z[, 2 : 3]
X <- Z[4, 4]
Y <- Z[ , 4]
W <- Z[ , -3]
D <- Z[ , c(1, 3, 4)]
E <- Z[ , c(-1, -3)]

dim(Z)

n <- dim(Z)
n

nrow <- dim(Z)[1]
nrow

Z2 <- rbind(Wingcrd, Tarsus, Head, Wt)
Z2

# 2.1.4 Combining Data with the vector Function*

W <- vector(length = 8)
W[1] <- 59
W[2] <- 55
W[3] <- 53.5
W[4] <- 55
W[5] <- 52.5
W[6] <- 57.5
W[7] <- 53
W[8] <- 55

W

# 2.1.5 Combining Data Using a Matrix*

Dmat <- matrix(nrow = 8, ncol = 4)
Dmat

Dmat[, 1] <- c(59, 55, 53.5, 55, 52.5, 57.5, 53, 55)
Dmat[, 2] <- c(22.3, 19.7, 20.8, 20.3, 20.8, 21.5, 20.6, 21.5)
Dmat[, 3] <- c(31.2, 30.4, 30.6, 30.3, 30.3, 30.8, 32.5, NA)
Dmat[, 4] <- c(9.5, 13.8, 14.8, 15.2, 15.5, 15.6, 15.6, 15.7)

Dmat

colnames(Dmat) <- c("Wingcrd", "Tarsus", "Head","Wt")
Dmat

Dmat[1, 1] <- 59.0
Dmat[1, 2] <- 22.3

Dmat2 <- as.matrix(cbind(Wingcrd, Tarsus, Head, Wt))

# 2.1.6 Combining Data with the data.frame Function

Dfrm <- data.frame(WC = Wingcrd, 
                   TS = Tarsus,
                   HD = Head,
                   W  = Wt)
Dfrm

Dfrm <- data.frame(WC  = Wingcrd, 
                   TS  = Tarsus,
                   HD  = Head,
                   W   = Wt,
                   Wsq = sqrt(Wt))

rm(Wt)

Wt

Dfrm$W

# 2.1.7 Combining Data Using the list Function*

x1 <- c(1, 2, 3)
x2 <- c("a", "b", "c", "d")
x3 <- 3
x4 <- matrix(nrow = 2, ncol = 2)
x4[, 1] <- c(1, 2)
x4[, 2] <- c( 3, 4)
Y <- list(x1 = x1, x2 = x2, x3 = x3, x4 = x4)

Y

M <- lm(WC ~ W, data = Dfrm)

names(M)

AllData <- list(BirdData = BirdData, Id = Id2, Z = Z, VarNames = VarNames)

AllData

# 2.2 Importing Data

# 2.2.1 Importing Excel Data

# 2.2.1.1 Prepare the Data in Excel

# 2.2.1.2 Export Data to a Tab-Delimited ascii File

# 2.2.1.3 Using the read.table Function

# Squid <- read.table(file = "C:\\RBook\\squid.txt", header = TRUE) # on PC
# Squid <- read.table(file = "C:/RBook/squid.txt", header = TRUE) # on PC
Squid <- read.table(file = "~/GitHub/RBook/squid.txt", header = TRUE) # on Mac

# Squid <- read.table(file = "C:/RBook/squid.txt", header = TRUE, dec = ".") # on PC
Squid <- read.table(file = "~/GitHub/RBook/squid.txt", header = TRUE, dec = ".") # on Mac

#setwd("C:\\RBook\\") # on PC
setwd("~/GitHub/RBook/") # on Mac
Squid <- read.table(file = "squid.txt", header = TRUE)

# 2.2.2 Accessing Data from Other Statistical Packages**

library(foreign)

?read.mtp

# 2.2.3 Accessing a Database***

library(RODBC)

#setwd("C:/RBook") # on PC
setwd("~/GitHub/RBook/") # on Mac
#channel1 <- odbcConnectAccess(file = "MyDb.mdb", uid = "", pwd = "") # on PC with MS Access driver
# Gives message "Error: could not find function "odbcConnectAccess"" on Mac
# Try http://hiltmon.com/blog/2013/09/18/setup-odbc-for-r-on-os-x/
# for PostgreSQL - check for similar for ".mdb" if available/possible:  "r odbcConnect mac"

# Channel1 <- odbcConnect("MyDb.mdb")

# MyData <- sqlFetch(channel1, "MyTable")

# 2.3 Which R Functions Did We Learn?

# 2.4 Exercises
