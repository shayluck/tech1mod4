#this is code

#hi

#Edit → Save → Stage → Commit → Pull → Push

install.packages("tidyverse")
library(tidyverse)

mpg
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot() 

#change point color by class
ggplot(data = mpg)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))

#change point size by class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
#> Warning: Using size for a discrete variable is not advised. 

#dont use ggplot for discrete data
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

#change points by shape
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#change appearance manually
#can change color name, size point, shape of point
# + has to go at end of line, not at beginning of next line


#show subset of data by plotting 1 variable
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
             
###....................###
#Fitting simple lines

#geom points to create graph of data points
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#display points as smooth line
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

#geom: plot uses this to represent data, can change function, line type

ggplot(data = mpg) + 
  #  geom_point(mapping = aes(x = displ, y = hwy)) # points horrible 
  geom_smooth(mapping = aes(x = displ, y = hwy)) # try smooth line

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))


#can be used to vary plots by discrete variable
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))


#change colors based on category of drv
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE,
  )

#two lines of code, one for points and one for line on same graph
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

