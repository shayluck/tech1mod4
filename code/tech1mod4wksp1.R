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

#display different aesthetics in diff layers
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()


#specify diff data for diff layer 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

###.................#####
#transformation and stats

#plotting diamond stats
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)
demo

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")

#generate proportion of total dataset, rather than count
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

#change aesthetics like color or fill
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

#To alter transparency (alpha)
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")

#To color the bar outlines with no fill color
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")

#position = "fill" works like stacking, but makes each set of stacked bars the same height.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

#position=dodge puts overlapping object next to eachother