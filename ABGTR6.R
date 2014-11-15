# http://www.highstat.com/book3.htm
# A Beginner's Guide to R (2009). Zuur, Ieno and Meesters. Springer

# Chapter 6:  Loops and Functions

# 6.1 Introduction to Loops

# 6.2 Loops

# 6.2.1 Be the Architect of Your Code

# 6.2.2 Step 1: Importing the Data

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Owls <- read.table(file = "Owls.txt", header = TRUE)
names(Owls)
str(Owls)

# 6.2.3 Steps 2 and 3: Making the Scatterplot and Adding Labels

unique(Owls$Nest)

Owls.ATV <- Owls[Owls$Nest == "AutavauxTV", ]
plot(x = Owls.ATV$ArrivalTime, y = Owls.ATV$NegPerChick,
     xlab = "Arrival Time", ylab = "Negotiation behaviour",
     main = "AutavauxTV")

# 6.2.4 Step 4: Designing General Code

Owls.Bot <- Owls[Owls$Nest == "Bochet", ]
plot(x = Owls.Bot$ArrivalTime, y = Owls.Bot$NegPerChick,
     xlab = "Arrival Time", ylab = "Negotiation behaviour", 
     main = "Bochet")

Owls.i <- Owls[Owls$Nest == "Bochet", ]
plot(x = Owls.i$ArrivalTime, y = Owls.i$NegPerChick, 
     xlab = "Arrival Time", ylab = "Negotiation behaviour", 
     main = "Bochet")

Nest.i <- "Bochet"
Owls.i <- Owls[Owls$Nest == Nest.i, ]
plot(x = Owls.i$ArrivalTime, y = Owls.i$NegPerChick,
     xlab = "Arrival Time", ylab = "Negotiation behaviour",
     main = Nest.i)

# 6.2.5 Step 5: Saving the Graph

paste(Nest.i, ".jpg", sep = "")

# setwd("C:/AllGraphs/") on PC
setwd("~/GitHub/RBook/") # on Mac
Nest.i <- "Bochet"
Owls.i <- Owls[Owls$Nest == Nest.i, ]
YourFileName <- paste(Nest.i, ".jpg", sep="")
jpeg(file = YourFileName)
plot(x = Owls.i$ArrivalTime, y = Owls.i$NegPerChick,
     xlab = "Arrival Time", ylab = "Negotiation behaviour", 
     main = Nest.i)
dev.off()

# 6.2.6 Step 6: Constructing the Loop

AllNests <- unique(Owls$Nest)
for (i in 1:27) {
  Nest.i <- AllNests[i]
  Owls.i <- Owls[Owls$Nest == Nest.i, ]
  YourFileName <- paste(Nest.i, ".jpg", sep = "") 
  jpeg(file = YourFileName)
  plot(x = Owls.i$ArrivalTime, y = Owls.i$NegPerChick,
       xlab = "Arrival Time", ylab = "Negotiation behaviour", 
       main = Nest.i)
  dev.off()
}

# 6.3 Functions

# 6.3.1 Zeros and NAs

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Veg <- read.table(file = "Vegetation2.txt", header = TRUE)
names(Veg)

NAPerVariable <- function(X1) { 
  D1 <- is.na(X1)
  colSums(D1)
}

NAPerVariable(Veg[, 5:24])

# 6.3.2 Technical Information

H <- NAPerVariable(Veg[ , 4 : 24])

# 6.3.3 A Second Example: Zeros and NAs

#setwd("C:/RBook/") # on PC
setwd("~/GitHub/RBook/") # on Mac
Parasite <- read.table(file = "CodParasite.txt", header = TRUE)
names(Parasite)
                         
NAPerVariable(Parasite)                  

ZerosPerVariable <- function(X1) { 
  D1 = (X1 == 0)
  colSums(D1)
}

ZerosPerVariable(Parasite)

ZerosPerVariable <- function(X1) { 
  D1 = (X1 == 0)
  colSums(D1, na.rm = TRUE) 
}

ZerosPerVariable(Parasite)

# 6.3.4 A Function with Multiple Arguments

VariableInfo <- function(X1, Choice1) {
  if (Choice1 == "Zeros") { D1 = (X1 == 0) } 
  if (Choice1 == "NAs")   { D1 <- is.na(X1)} 
  colSums(D1, na.rm = TRUE)
}

VariableInfo(Parasite, "Zeros")

VariableInfo(Parasite, "NAs")

Results <- VariableInfo(Parasite, "Zeros")

VariableInfo(Parasite, "zeroos")

VariableInfo(Parasite)

# 6.3.5 Foolproof Functions

# 6.3.5.1 Default Values for Variables in Function Arguments

VariableInfo <- function(X1, Choice1 = "Zeros") { 
  if (Choice1 == "Zeros") { D1 = (X1 == 0) }
  if (Choice1 == "NAs")   { D1 <- is.na(X1)} 
  colSums(D1, na.rm = TRUE)
}

VariableInfo(Parasite)

VariableInfo(Parasite, "NAs")

# 6.3.5.2 Misspelling

VariableInfo <- function(X1, Choice1 = "Zeros") { 
  if (Choice1 == "Zeros") {D1 = (X1 == 0) }
  if (Choice1 == "NAs")   {D1 <- is.na(X1)}
  if (Choice1 != "Zeros" & Choice1 != "NAs") {
    print("You made a typo")
  } else {colSums(D1, na.rm = TRUE)}
}

VariableInfo(Parasite, "abracadabra")

Choice1 <- "Zeros"
X1 <- c(0, 1, 2, 3, NA)
ifelse(Choice1 == "Zeros", D1 <- (X1 == 0), D1 <- is.na(X1))

# 6.4 More on Functions and the if Statement

# 6.4.1 Playing the Architect Again

# 6.4.2 Step 1: Importing and Assessing the Data

#Benthic <- read.table("C:/RBook/RIKZ.txt", header = TRUE) # on PC
setwd("~/GitHub/RBook/") # on Mac
Benthic <- read.table("RIKZ.txt", header = TRUE) # on Mac
Species <- Benthic[ , 2:76]
n <- dim(Species)
n

# 6.4.3 Step 2: Total Abundance per Site

sum(Species[1, ], na.rm = TRUE)

sum(Species[2, ], na.rm = TRUE)

TA <- vector(length = n[1])
for (i in 1:n[1]){
  TA[i] <- sum(Species[i, ], na.rm = TRUE) 
}

TA

TA <- rowSums(Species, na.rm = TRUE)
TA

# 6.4.4 Step 3: Richness per Site

sum(Species[1, ] > 0, na.rm = TRUE)

sum(Species[2, ] > 0, na.rm = TRUE)

Richness <- vector(length = n[1])
for (i in 1:n[1]) {
  Richness[i] <- sum(Species[i, ] > 0, na.rm = TRUE)
}
Richness
  
Richness <- rowSums(Species > 0, na.rm = TRUE)
Richness

# 6.4.5 Step 4: Shannon Index per Site

RS <- rowSums(Species, na.rm = TRUE)
prop <- Species/RS
H <- -rowSums(prop * log10(prop), na.rm = TRUE)
H

library(vegan)
H <- diversity(Species)
H

# 6.4.6 Step 5: Combining Code

Choice <- "Richness"
if(Choice == "Richness") {
  Index <- rowSums(Species > 0, na.rm = TRUE)
} 
if(Choice == "Total Abundance") {
  Index <- rowSums(Species, na.rm = TRUE)
} 
if(Choice=="Shannon") {
  RS <- rowSums(Species, na.rm = TRUE)
  prop <- Species/RS
  Index <- -rowSums(prop*log10(prop), na.rm = TRUE)
}

# 6.4.7 Step 6: Putting the Code into a Function

Index.function <- function(Spec, Choice1) { 
  if(Choice1 == "Richness") {
    Index <- rowSums(Spec > 0, na.rm = TRUE)
  }
  if(Choice1 == "Total Abundance") {
    Index <- rowSums(Spec, na.rm = TRUE) 
  } 
  if(Choice1 == "Shannon") {
      RS <- rowSums(Spec, na.rm = TRUE)
      prop <- Spec/RS
      Index <- -rowSums(prop * log10(prop), na.rm = TRUE)
  }
  list(Index = Index, MyChoice = Choice1)
}

Index.function(Species, "Shannon")

Index.function(Species, "total abundance")

Index.function <- function(Spec, Choice1) {
  if(Choice1 == "Richness") {
    Index <- rowSums(Spec > 0, na.rm = TRUE)
  } else if(Choice1 == "Total Abundance") {
    Index <- rowSums(Spec, na.rm = TRUE)
  } else if(Choice1 == "Shannon") {
    RS <- rowSums(Spec, na.rm = TRUE)
    prop <- Spec/RS
    Index <- -rowSums(prop*log(prop),na.rm=TRUE)
  } else {
    print("Check your choice")
    Index <- NA 
  }
  list(Index = Index, MyChoice = Choice1)
}

Index.function(Species, "total abundance")

# 6.5 Which R Functions Did We Learn?

# 6.6 Exercises
