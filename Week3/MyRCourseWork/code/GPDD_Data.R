require(maps)
world.data <- load("../data/GPDDFiltered.RData")
map(database = "world")
  points(gpdd$long, gpdd$lat, pch=20, cex=0.5, col="red")

# as we are plotting such a large area from a certain persepctive it creates distortion of the map. Some areas may look larger than others and not be an accurate representation of the real data. Additionally, due to how large of an area we are plotting, the data points superimposed onto the map can only show us the generic regions of the data points.