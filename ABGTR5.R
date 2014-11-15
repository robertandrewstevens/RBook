# http://www.highstat.com/book3.htm
# A Beginner's Guide to R (2009). Zuur, Ieno and Meesters. Springer

# Chapter 5:  An Introduction to Basic Plotting Tools

# 5.1 The plot Function

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Veg <- read.table(file = "Vegetation2.txt", header = TRUE)
plot(Veg$BARESOIL, Veg$R)

plot(Veg$R, Veg$BARESOIL)

plot(x = Veg$BARESOIL, y = Veg$R)

plot(BARESOIL, R, data = Veg)

plot(R ~ BARESOIL, data = Veg)

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot", 
     xlim = c(0, 45), ylim = c(4, 19))

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot", 
     xlim = c(min(Veg$BARESOIL), max(Veg$BARESOIL)))

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot", 
     xlim = c(min(Veg$BARESOIL, na.rm = TRUE),
              max(Veg$BARESOIL, na.rm = TRUE)))

# 5.2 Symbols, Colours, and Sizes

# 5.2.1 Changing Plotting Characters

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot", 
     xlim = c(0, 45), ylim = c(4, 19), 
     pch = 16)

Veg$Transect

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot", 
     xlim = c(0, 45), ylim = c(4, 19), 
     pch = Veg$Transect)

Veg$fTransect <- factor(Veg$Transect)
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot", 
     xlim = c(0, 45), ylim = c(4, 19),
     pch = Veg$fTransect)

# 5.2.1.1 Use of a Vector for pch

Veg$Time2 <- Veg$Time
Veg$Time2[Veg$Time <= 1974] <-  1 
Veg$Time2[Veg$Time >  1974] <- 16
Veg$Time2

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot", 
     xlim = c(0, 45), ylim = c(4, 19),
     pch = Veg$Time2)

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot", 
     xlim = c(0, 45), ylim = c(4, 19),
     pch = Veg$Time)

warnings()

# 5.2.2 Changing the Colour of Plotting Symbols

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot", 
     xlim = c(0, 45), ylim = c(4, 19),
     col = 2)

x <- 1:8
plot(x, col = x)

# 5.2.2.1 Use of a Vector for col

Veg$Time2 <- Veg$Time
Veg$Time2[Veg$Time <= 1974] <- 15
Veg$Time2[Veg$Time >  1974] <- 16
Veg$Col2 <- Veg$Time
Veg$Col2[Veg$Time <= 1974] <- 1
Veg$Col2[Veg$Time >  1974] <- 2
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot", 
     xlim = c(0, 45), ylim = c(4, 19),
     pch = Veg$Time2, col = Veg$Col2)

# 5.2.3 Altering the Size of Plotting Symbols

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19),
     pch = 16, cex = 1.5)

# 5.2.3.1 Use of a Vector for cex

Veg$Cex2 <- Veg$Time
Veg$Cex2[Veg$Time == 2002] <- 2
Veg$Cex2[Veg$Time != 2002] <- 1

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19),
     pch = 16, cex = Veg$Cex2)

# 5.3 Adding a Smoothing Line

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot", 
     xlim = c(0, 45), ylim = c(4, 19))
M.Loess <- loess(R ~ BARESOIL, data = Veg)
Fit <- fitted(M.Loess)
lines(Veg$BARESOIL, Fit)

M.Loess <- loess(R ~ BARESOIL, data = Veg)

M.Loess

lines(Veg$BARESOIL, Fit)

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness", 
     main = "Scatter plot", 
     xlim = c(0, 45), ylim = c(4, 19))
M.Loess <- loess(R ~ BARESOIL, data = Veg)
Fit <- fitted(M.Loess)
Ord1 <- order(Veg$BARESOIL)
lines(Veg$BARESOIL[Ord1], Fit[Ord1], lwd = 3, lty = 2)

# 5.4 Which R Functions Did We Learn?

# 5.5 Exercises
