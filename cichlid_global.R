
library(leaflet) 
library(ggplot2) 
points <- cbind(-121.7547, 38.54) 
newdat <- function(){ 
  dat <- data.frame(animal_id=as.factor(rep(1:10, each=100)), 
                    measurement=rep(runif(10, 80,130), each=100)
                                                                                                            +rnorm(1000,0,5))
return(dat) 
  } 
dat1 <- newdat()