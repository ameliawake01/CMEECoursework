require(ggplot2)
require(plyr)
MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv")

insectivorous <- subset(MyDF, Type.of.feeding.interaction == "insectivorous")
piscivorous <- subset(MyDF, Type.of.feeding.interaction == "piscivorous")
planktivorous <- subset(MyDF, Type.of.feeding.interaction == "planktivorous")
predacious <- subset(MyDF, Type.of.feeding.interaction == "predacious")
pred.pisci <- subset(MyDF, Type.of.feeding.interaction == "predacious/piscivorous")

#attempt number one using qplot SORRY SAMRAAT
#pdf("../results/PP_Regress_Plots.pdf", # Open blank pdf page using a relative path
#    11.7, 8.3) # These numbers are page dimensions in inches
#par(mfcol=c(5,1))
#par(mfg = c(1,1))
#qplot(log(Prey.mass), log(Predator.mass), data = insectivorous,
#      colour = Predator.lifestage, shape=I(3), asp = 1)
#par(mfg = c(2,1))
#qplot(log(Prey.mass), log(Predator.mass), data = piscivorous,
#      colour = Predator.lifestage, shape=I(3), asp = 1)
#par(mfg = c(3,1))
#qplot(log(Prey.mass), log(Predator.mass), data = planktivorous,
#      colour = Predator.lifestage, shape=I(3), asp = 1)
#par(mfg = c(4,1))
#qplot(log(Prey.mass), log(Predator.mass), data = predacious,
#      colour = Predator.lifestage, shape=I(3), asp = 1)
#par(mfg = c(5,1))
#qplot(log(Prey.mass), log(Predator.mass), data = pred.pisci,
#      colour = Predator.lifestage, shape=I(3), asp = 1)
#graphics.off();

#attempt number two using ggplot
pdf("../results/PP_Regress_Plots.pdf")
ggplot(MyDF, aes(x = (Prey.mass), y = (Predator.mass), colour = Predator.lifestage)) +
  geom_point(shape=I(3)) +
  facet_wrap(Type.of.feeding.interaction ~., ncol=1, strip.position=c("right")) +
  geom_smooth(method = "lm", fullrange = TRUE) +
  theme(legend.position = "bottom",
        aspect.ratio = 0.5,
        legend.key.size = unit(0.5, 'cm'),
        legend.title = element_text(size=8, face="bold"),
        legend.text = element_text(size=8),
        strip.text=element_text(size=6)) +
  labs(x = "Prey Mass(g)", y = "Predator Mass(g)") +
  scale_x_log10() + scale_y_log10() +
  guides(colour = guide_legend(nrow=1))
graphics.off()

# do the linear regression
model1 <- dlply(MyDF, .(Type.of.feeding.interaction, Predator.lifestage), function(x) lm(Predator.mass ~ Prey.mass, data=MyDF))

#generate dataframe using function
mod1.output <- ldply(model1, function(x){
  intercept <- summary(x)$coefficients[1]
  slope <- summary(x)$coefficient[2]
  p.value <- summary(x)$coefficient[8]
  r.square <- summary(x)$r.squared
  data.frame(r.square, intercept, slope, p.value)})

#Na's!!!
F.statistic <- ldply(model1, function(x) summary(x)$fstatistic[1])

#add to dataframe
final.mod1.output <- merge(mod1.output, F.statistic, by = c("Type.of.feeding.interaction", "Predator.lifestage"))
names(final.mod1.output)[7] <- "F.statistic"

#write csv
write.csv (final.mod1.output, "../results/PP_Regress_Output.csv", row.names=FALSE, quote=FALSE)