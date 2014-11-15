# http://www.highstat.com/book3.htm
# A Beginner's Guide to R (2009). Zuur, Ieno and Meesters. Springer

# Chapter 4:  Simple Functions

# 4.1 The tapply Function

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Veg <- read.table(file="Vegetation2.txt", header= TRUE)
names(Veg)
str(Veg)

# 4.1.1 Calculating the Mean Per Transect

m  <- mean(Veg$R)
m1 <- mean(Veg$R[Veg$Transect == 1])
m2 <- mean(Veg$R[Veg$Transect == 2])
m3 <- mean(Veg$R[Veg$Transect == 3])
m4 <- mean(Veg$R[Veg$Transect == 4])
m5 <- mean(Veg$R[Veg$Transect == 5])
m6 <- mean(Veg$R[Veg$Transect == 6])
m7 <- mean(Veg$R[Veg$Transect == 7])
m8 <- mean(Veg$R[Veg$Transect == 8])
c(m, m1, m2, m3, m4, m5, m6, m7, m8)

# 4.1.2 Calculating the Mean Per Transect More Efficiently

tapply(Veg$R, Veg$Transect, mean)

tapply(X = Veg$R, INDEX = Veg$Transect, FUN = mean)

Me <- tapply(Veg$R, Veg$Transect, mean)
Sd <- tapply(Veg$R, Veg$Transect, sd)
Le <- tapply(Veg$R, Veg$Transect, length)
cbind(Me, Sd, Le)

# 4.2 The sapply and lapply Functions

sapply(Veg[, 5:9], FUN = mean)

lapply(Veg[, 5:9], FUN = mean)

sapply(cbind(Veg$R, Veg$ROCK, Veg$LITTER, Veg$ML, Veg$BARESOIL), FUN = mean)

sapply(data.frame(cbind(Veg$R, Veg$ROCK, Veg$LITTER, Veg$ML, Veg$BARESOIL)), FUN = mean)

# 4.3 The summary Function

Z <- cbind(Veg$R, Veg$ROCK, Veg$LITTER)
colnames(Z) <- c("R", "ROCK", "LITTER")
summary(Z)

summary(Veg[ , c("R","ROCK","LITTER")])
summary(Veg[ , c(5, 6, 7)])

# 4.4 The table Function

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Deer <- read.table(file = "Deer.txt", header = TRUE)
names (Deer)
str(Deer)

table(Deer$Farm)

table(Deer$Sex, Deer$Year)

# 4.5 Which R Functions Did We Learn?

# 4.6 Exercises
