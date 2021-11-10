MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv")

sizeratio <- ((MyDF$Prey.mass)/(MyDF$Predator.mass))
MyDF$sizeratio <- sizeratio

insectivorous <- subset(MyDF, Type.of.feeding.interaction == "insectivorous")
piscivorous <- subset(MyDF, Type.of.feeding.interaction == "piscivorous")
planktivorous <- subset(MyDF, Type.of.feeding.interaction == "planktivorous")
predacious <- subset(MyDF, Type.of.feeding.interaction == "predacious")
pred.pisci <- subset(MyDF, Type.of.feeding.interaction == "predacious/piscivorous")

MyDF$Prey.mass[which(MyDF$Prey.mass.unit=="mg")] <- MyDF$Prey.mass[which(MyDF$Prey.mass.unit=="mg")]/1000

pdf("../results/Pred_Subplots.pdf", # Open blank pdf page using a relative path
    11.7, 8.3) # These numbers are page dimensions in inches
par(mfcol=c(5,1)) #initialize multi-paneled plot
par(mfg = c(1,1)) # specify which sub-plot to use first 
hist(log10(insectivorous$Predator.mass), 
    xlab = "log10(Predator Mass(g))", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Distribution of Insectivorous Predator Mass')
par(mfg = c(2,1))
hist(log10(piscivorous$Predator.mass),
    xlab = "log10(Predator Mass(g)", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Distribution of Piscivorous Predator Mass')
par(mfg = c(3,1))
hist(log10(planktivorous$Predator.mass),
    xlab = "log10(Predator Mass(g))", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Distribution of Planktivorous Predator Mass')
par(mfg = c(4,1))
hist(log10(predacious$Predator.mass),
    xlab = "log10(Predator Mass(g))", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Distribution of Predacious Predator Mass')
par(mfg = c(5,1))
hist(log10(pred.pisci$Predator.mass),
    xlab = "log10(Predator Mass(g))", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Distribution of Predacious/Piscivorous Predator Mass')
graphics.off(); #you can also use dev.off() 

pdf("../results/Prey_Subplots.pdf", # Open blank pdf page using a relative path
    11.7, 8.3) # These numbers are page dimensions in inches
par(mfcol=c(5,1)) #initialize multi-paneled plot
par(mfg = c(1,1)) # specify which sub-plot to use first 
hist(log10(insectivorous$Prey.mass), 
    xlab = "log10(Prey Mass(g))", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Distribution of Insectivorous Prey Mass')
par(mfg = c(2,1))
hist(log10(piscivorous$Prey.mass),
    xlab = "log10(Prey Mass(g)", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Distribution of Piscivorous Prey Mass')
par(mfg = c(3,1))
hist(log10(planktivorous$Prey.mass),
    xlab = "log10(Prey Mass(g))", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Distribution of Planktivorous Prey Mass')
par(mfg = c(4,1))
hist(log10(predacious$Prey.mass),
    xlab = "log10(Prey Mass(g))", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Distribution of Predacious Prey Mass')
par(mfg = c(5,1))
hist(log10(pred.pisci$Prey.mass),
    xlab = "log10(Prey Mass(g))", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Distribution of Predacious/Piscivorous Prey Mass')
graphics.off(); #you can also use dev.off() 

pdf("../results/SizeRatio_Subplots.pdf", # Open blank pdf page using a relative path
    11.7, 8.3) # These numbers are page dimensions in inches
par(mfcol=c(5,1)) #initialize multi-paneled plot
par(mfg = c(1,1)) # specify which sub-plot to use first 
hist(log10(insectivorous$sizeratio), 
    xlab = "log10(Prey Mass/Predator Mass(g))", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Size Ratio of Prey Mass Over Predator Mass by Feeding Interaction Type')
par(mfg = c(2,1))
hist(log10(piscivorous$sizeratio),
    xlab = "log10(Prey Mass/Predator Mass(g)", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Size Ratio of Prey Mass Over Predator Mass by Feeding Interaction Type')
par(mfg = c(3,1))
hist(log10(planktivorous$sizeratio),
    xlab = "log10(Prey Mass/Predator Mass(g)", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Size Ratio of Prey Mass Over Predator Mass by Feeding Interaction Type')
par(mfg = c(4,1))
hist(log10(predacious$sizeratio),
    xlab = "log10(Prey Mass/Predator Mass(g)", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Size Ratio of Prey Mass Over Predator Mass by Feeding Interaction Type')
par(mfg = c(5,1))
hist(log10(pred.pisci$sizeratio),
    xlab = "log10(Prey Mass/Predator Mass(g)", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Size Ratio of Prey Mass Over Predator Mass by Feeding Interaction Type')
graphics.off(); #you can also use dev.off() 

pred.mean <- tapply(log10(MyDF$Prey.mass), MyDF$Type.of.feeding.interaction, mean)
prey.mean <- tapply(log10(MyDF$Predator.mass), MyDF$Type.of.feeding.interaction, mean)
ratio.mean <- tapply(log10(MyDF$sizeratio), MyDF$Type.of.feeding.interaction, mean)
pred.median <- tapply(log10(MyDF$Prey.mass), MyDF$Type.of.feeding.interaction, median)
prey.median <- tapply(log10(MyDF$Predator.mass), MyDF$Type.of.feeding.interaction, median)
ratio.median <- tapply(log10(MyDF$sizeratio), MyDF$Type.of.feeding.interaction, median)

mean.med <- data.frame(pred.mean,prey.mean,ratio.mean,pred.median,prey.median,ratio.median)
names(mean.med) = c("(log) mean predator mass(g)", "(log) mean prey mass(g)", "(log) mean predator-prey size-ratio", "(log) median predator mass(g)", "(log) median prey mass(g)", "(log) median predator-prey size-ratio")

write.csv(mean.med, "../results/PP_Results.csv")