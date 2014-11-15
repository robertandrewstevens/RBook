# http://www.highstat.com/book3.htm
# A Beginner's Guide to R (2009). Zuur, Ieno and Meesters. Springer

# Chapter 3:  Accessing Variables and Managing Subsets of Data

# 3.1 Accessing Variables from a Data Frame

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Squid <- read.table(file = "squid.txt", header = TRUE)

names(Squid)

# 3.1.1 The str Function

str(Squid)

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Squid2 <- read.table(file = "squidGSI.txt", dec = ",", header = TRUE)

str(Squid2)

GSI

# 3.1.2 The Data Argument in a Function

M1 <- lm(GSI ~ factor(Location) + factor(Year), data = Squid)

mean(GSI, data = Squid)

boxplot(GSI ~ factor(Location), data = Squid)

boxplot(GSI, data = Squid)

# 3.1.3 The $ Sign

Squid$GSI

Squid$GSI

Squid[ , 6]

mean(Squid$GSI)

# 3.1.4 The attach Function

attach(Squid)
GSI

boxplot(GSI)
mean(GSI)

detach(Squid)

# 3.2 Accessing Subsets of Data

Squid$Sex

unique(Squid$Sex)

Sel <- Squid$Sex == 1
SquidM <- Squid[Sel, ]
SquidM

SquidM <- Squid[Squid$Sex == 1, ]
SquidM

SquidF <- Squid[Squid$Sex == 2, ]
SquidF

Squid123 <- Squid[Squid$Location == 1 | Squid$Location == 2 | Squid$Location == 3, ] 
Squid123 <- Squid[Squid$Location != 4, ]
Squid123 <- Squid[Squid$Location < 4, ]
Squid123 <- Squid[Squid$Location <= 3, ]
Squid123 <- Squid[Squid$Location >= 1 & Squid$Location <= 3, ]

SquidM.1 <- Squid[Squid$Sex == 1 & Squid$Location == 1, ]
SquidM.1

SquidM.12 <- Squid[Squid$Sex == 1 & (Squid$Location == 1 | Squid$Location == 2), ]

SquidM <- Squid[Squid$Sex == 1, ]
SquidM1 <- SquidM[Squid$Location == 1, ]
SquidM1

Squid[Squid$Location == 1 & Squid$Year == 4 & Squid$Month == 1, ]

# 3.2.1 Sorting the Data

Ord1 <- order(Squid$Month)
Squid[Ord1, ]

Squid$GSI[Ord1]

# 3.3 Combining Two Datasets with a Common Identifier

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Sq1 <- read.table(file = "squid1.txt", header = TRUE)
Sq2 <- read.table(file = "squid2.txt", header = TRUE)
SquidMerged <- merge(Sq1, Sq2, by = "Sample")
SquidMerged

SquidMerged <- merge(Sq1, Sq2, by = "Sample", all = TRUE)
SquidMerged

# 3.4 Exporting Data

SquidM <- Squid[Squid$Sex == 1, ]
write.table(SquidM, file = "MaleSquid.txt", sep = " ", quote = FALSE, append = FALSE, na = "NA")

write.table(SquidM, file = "MaleSquid.txt", sep = ",", quote = TRUE, append = FALSE, na = "NA")

# 3.5 Recoding Categorical Variables

str(Squid)

Squid$fLocation <- factor(Squid$Location)
Squid$fSex <- factor(Squid$Sex)

Squid$fSex

Squid$fSex <- factor(Squid$Sex, levels = c(1, 2), labels = c("M", "F"))
Squid$fSex

boxplot(GSI ~ fSex, data = Squid)
M1 <- lm(GSI ~ fSex + fLocation, data = Squid)

summary(M1)
M2 <- lm(GSI ~ factor(Sex) + factor(Location), data = Squid)
summary(M2)

Squid$fLocation

Squid$fLocation <- factor(Squid$Location, levels = c(2, 3, 1, 4))
Squid$fLocation

boxplot(GSI ~ fLocation, data = Squid)

quidM <- Squid[Squid$Sex == 1, ]

quidM <- Squid[Squid$fSex == "1", ]

Squid$fSex <- factor(Squid$Sex, labels = c("M", "F"))
Squid$fLocation <- factor(Squid$Location)
str(Squid)

# 3.6 Which R Functions Did We Learn?

# 3.7 Exercises
