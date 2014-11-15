# http://www.highstat.com/book3.htm
# A Beginner's Guide to R (2009). Zuur, Ieno and Meesters. Springer

# Chapter 7:  Graphing Tools

# 7.1 The Pie Chart

# 7.1.1 Pie Chart Showing Avian Influenza Data

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
#BFCases <- read.table(file = "Birdflucases.txt", header = TRUE)
BFCases <- read.delim(file = "Birdflucases.txt", header = FALSE, skip = 1, sep = "\t")
BFNames <- as.matrix(read.delim(file = "Birdflucases.txt", header = FALSE, nrows = 1, sep = "\t"))
BFNames
BFNames <- sub("\xa0", "", BFNames) # header 8 = "Indonesia\xa0" - invalid character
names(BFCases) <- BFNames
names(BFCases)
str(BFCases)

Cases <- rowSums(BFCases[, 2:16])
names(Cases) <- BFCases[, 1]
Cases

par(mfrow = c(2, 2), mar = c(3, 3, 2, 1))
pie(Cases, main = "Ordinary pie chart") # A
pie(Cases, col = gray(seq(0.4, 1.0, length = 6)), clockwise = TRUE, main = "Grey colours") # B 
pie(Cases, col = rainbow(6), clockwise = TRUE, main = "Rainbow colours") # C
library(plotrix)
pie3D(Cases, labels = names(Cases), explode = 0.1, main = "3D pie chart", labelcex = 0.6)

# 7.1.2 The par Function

op <- par(mfrow = c(2, 2), mar = c(3, 3, 2, 1))
pie(Cases, main = "Ordinary pie chart")
pie(Cases, col = gray(seq(0.4, 1.0, length = 6)), clockwise = TRUE, main = "Grey colours")
pie(Cases, col = rainbow(6), clockwise = TRUE, main = "Rainbow colours")
pie3D(Cases, labels = names(Cases), explode = 0.1, main = "3D pie chart", labelcex = 0.6)
par(op)

# 7.2 The Bar Chart and Strip Chart

# 7.2.1 The Bar Chart Using the Avian Influenza Data

#BFDeaths <- read.table(file = "Birdfludeaths.txt", header = TRUE)
BFDeaths <- read.delim(file = "Birdfludeaths.txt", header = FALSE, skip = 1, sep = "\t")
BFNames <- as.matrix(read.delim(file = "Birdfludeaths.txt", header = FALSE, nrows = 1, sep = "\t"))
BFNames
BFNames <- sub("\xa0", "", BFNames) # header 8 = "Indonesia\xa0" - invalid character
names(BFDeaths) <- BFNames
names(BFDeaths)
str(BFDeaths)

Deaths <- rowSums(BFDeaths[, 2:16])
names(Deaths) <- BFDeaths[, 1]
Deaths

par(mfrow = c(2, 2), mar = c(3, 3, 2, 1))
barplot(Cases , main = "Bird flu cases") # A
Counts <- cbind(Cases, Deaths)
barplot(Counts) # B
barplot(t(Counts), col = gray(c(0.5, 1))) # C
barplot(t(Counts), beside = TRUE) # D

Counts

t(Counts)

# 7.2.2 A Bar Chart Showing Mean Values with Standard Deviations

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Benthic <- read.table(file = "RIKZ2.txt", header = TRUE)
Bent.M <- tapply(Benthic$Richness, INDEX = Benthic$Beach, FUN = mean)
Bent.sd <- tapply(Benthic$Richness, INDEX = Benthic$Beach, FUN = sd)
MSD <- cbind(Bent.M, Bent.sd)

MSD

barplot(Bent.M)

barplot(Bent.M, xlab = "Beach", ylim = c(0, 20), ylab = "Richness", col = rainbow(9))

bp <- barplot(Bent.M, xlab = "Beach", ylim = c(0,20), ylab = "Richness", col = rainbow(9))
arrows(bp, Bent.M, bp, Bent.M + Bent.sd, lwd = 1.5, angle = 90, length = 0.1)
box()

bp

# 7.2.3 The Strip Chart for the Benthic Data

Benth.le <- tapply(Benthic$Richness, INDEX = Benthic$Beach, FUN = length)
Bent.se <- Bent.sd/sqrt(Benth.le)

stripchart(Benthic$Richness ~ Benthic$Beach,
           vert = TRUE, pch = 1, method = "jitter",
           jit = 0.05, xlab = "Beach", ylab = "Richness")
points(1:9, Bent.M, pch = 16, cex = 1.5)
arrows(1:9, Bent.M, 1:9, Bent.M + Bent.se, lwd = 1.5, angle = 90, length = 0.1)
arrows(1:9, Bent.M, 1:9, Bent.M - Bent.se, lwd = 1.5, angle = 90, length = 0.1)

# 7.3 Boxplot

# 7.3.1 Boxplots Showing the Owl Data

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Owls <- read.table(file = "Owls.txt", header = TRUE)
par(mfrow = c(1, 1), mar = c(3, 3, 2, 1))
boxplot(Owls$NegPerChick, main = "Negotiation per chick")

par(mfrow = c(2,2), mar = c(3, 3, 2, 1))
boxplot(NegPerChick ~ SexParent, data = Owls)
boxplot(NegPerChick ~ FoodTreatment, data = Owls)
boxplot(NegPerChick ~ SexParent * FoodTreatment, data = Owls)
boxplot(NegPerChick ~ SexParent * FoodTreatment,
        names = c("F/Dep", "M/Dep", "F/Sat", "M/Sat"),
        data = Owls)

par(mfrow = c(1, 1), mar = c(3, 3, 2, 1))
boxplot(NegPerChick ~ Nest, data = Owls)

par(mar = c(2, 2, 3, 3))
boxplot(NegPerChick ~ Nest, data = Owls, axes = FALSE, ylim = c (-3, 8.5))
axis(2, at = c(0, 2, 4, 6, 8))
text(x = 1:27, y = -2, labels = levels(Owls$Nest), cex = 0.75, srt = 65)

# 7.3.2 Boxplots Showing the Benthic Data

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Benthic <- read.table(file = "RIKZ2.txt", header = TRUE)
Bentic.n <- tapply(Benthic$Richness, Benthic$Beach, FUN = length)
Bentic.n

boxplot(Richness ~ Beach, data = Benthic,
        col = "grey", xlab = "Beach", ylab = "Richness")

BP.info <- boxplot(Richness ~ Beach, data = Benthic,
                   col = "grey", xlab = "Beach", ylab = "Richness")

BP.midp <- BP.info$stats[2, ] + (BP.info$stats[4, ] - BP.info$stats[2, ])/2

text(1:9, BP.midp, Bentic.n, col = "white", font = 2)

# 7.4 Cleveland Dotplots

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Deer <- read.table("Deer.txt", header = TRUE)

dotchart(Deer$LCT, xlab = "Length (cm)", ylab = "Observation number")

dotchart(Deer$LCT, groups = factor(Deer$Sex))

Isna <- is.na(Deer$Sex)
dotchart(Deer$LCT[!Isna], groups = factor(Deer$Sex[!Isna]),
         xlab = "Length (cm)", ylab = "Observation number grouped by sex")

# 7.4.1 Adding the Mean to a Cleveland Dotplot

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Benthic <- read.table(file = "RIKZ2.txt", header = TRUE)
Benthic$fBeach <- factor(Benthic$Beach)
par(mfrow = c(1, 2))
dotchart(Benthic$Richness, groups = Benthic$fBeach, xlab = "Richness", ylab = "Beach")
Bent.M<-tapply(Benthic$Richness, Benthic$Beach, FUN = mean)
dotchart(Benthic$Richness, groups = Benthic$fBeach, gdata = Bent.M, gpch = 19, 
         xlab = "Richness", ylab = "Beach")
legend("bottomright", c("values", "mean"), pch = c(1, 19), bg = "white")
par(mfrow = c(1, 1))

# 7.5 Revisiting the plot Function

# 7.5.1 The Generic plot Function

methods(plot)

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Benthic <- read.table(file = "RIKZ2.txt", header = TRUE)
Benthic$fBeach <- factor(Benthic$Beach)
plot(Benthic$Richness ~ Benthic$fBeach)

# 7.5.2 More Options for the plot Function

plot(x = Benthic$NAP, y = Benthic$Richness, 
     xlab = "Mean high tide (m)", ylab = "Species richness", main = "Benthic data")
M0 <- lm(Richness ~ NAP, data = Benthic)
abline(M0)

plot(x = Benthic$NAP, y = Benthic$Richness,  
     xlab = "Mean high tide (m)", ylab = "Species richness",
     xlim = c(-3, 3), ylim = c(0,20))

plot(x = Benthic$NAP, y = Benthic$Richness, 
     type = "n", axes = FALSE,
     xlab = "Mean high tide", ylab = "Species richness")
points(y = Benthic$Richness, x = Benthic$NAP)

plot(x = Benthic$NAP, y = Benthic$Richness, 
     type = "n", axes = FALSE, 
     xlab = "Mean high tide", ylab = "Species richness",
     xlim = c(-1.75,2), ylim = c(0,20))
points(x = Benthic$NAP, y = Benthic$Richness)
axis(2, at = c(0, 10, 20), tcl = 1)
axis(1, at = c(-1.75, 0,2), labels = c("Sea", "Water line", "Dunes"))

# 7.5.3 Adding Extra Points, Text, and Lines

# 7.5.4 Using type = "n"

# 7.5.5 Legends

legend("bottomright", c("values", "mean"), pch = c(1, 19), bg ="white")

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Birds <- read.table(file = "loyn.txt", header = TRUE)
Birds$LOGAREA <- log10(Birds$AREA)

# 7.5.6 Identifying Points

# 7.5.7 Changing Fonts and Font Size*

# 7.5.8 Adding Special Characters

# 7.5.9 Other Useful Functions

# 7.6 The Pairplot

# 7.6.1 Panel Functions

# 7.7 The Coplot

# 7.7.1 A Coplot with a Single Conditioning Variable

# 7.7.2 The Coplot with Two Conditioning Variables

# 7.7.3 Jazzing Up the Coplot*

# 7.8 Combining Types of Plots*

# 7.9 Which R Functions Did We Learn?

# 7.10 Exercises
