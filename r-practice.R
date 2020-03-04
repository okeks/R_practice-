boo <- c(5,T,"Boy")
class(boo)
list1 <- list(5,T,"boy","broom")
class(list1)
d <- data.frame(numbers=c(1,2,3), letters=c("d",3,"boo"),bools=c(T,F,"One"))
d
nvec <- c(one = 1,two=2,three=3)
nvec
names(d)
myvec <- c("F",1,2,4,"g")
my_d <- data.frame(name= c('Jack','John','Jill'),year=c(1993,1986,1998),instruments=c('piano','sax','trumpet'),stringsAsFactors = F)
my_d
my_d[2,3]
str(my_d)
myvec[1:4]
myvec[-(1:4)]
myvec[c(3,4,5)]
lst <- list(c(1,2,3),TRUE,c(4,5,5))
sum(lst[[1]])
lst[c(2,3)]
library(ggplot2)
head(diamonds)
diamonds[1:6,]
nrow(diamonds)
c(1,2,3) %in% c(2,3,4)
w <- c(-1,0,1)
x <- c(5,15)
y <- "Feburary"
z <- c("Monday","Tuesday","Friday")

w > 0
10 < x & x < 20
y == "Feburary"
dow <- c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
z %in% dow
hub <- c("Tolu","Shamoo","Princewill")
bob <- c("Princewill")
bob %in% hub 
all(z %in% dow)
x_zeros <- diamonds$x == 0 
length(x_zeros == TRUE)
diamonds[x_zeros,]
greater_than_ten <- diamonds$x > 10
big_ones <- diamonds[greater_than_ten,]
big_ones
cost <- diamonds$price > 18000
costly <- diamonds[cost,]
costly
#MISSING VALUES 
m <- c(1,2,3,4,NA)
is.na(m)
b <- c(4,9,7,7,8,NA)
sum(b, na.rm = T)
diamonds
library(ggplot2)
data("diamonds")
diamonds$x[diamonds$x == 0] <- NA
summary(diamonds$x)
x_zero
summary(diamonds$x)
diamonds[x_zeros,]
data(mpg)
?mpg
View(mpg)
qplot(displ,hwy,data = mpg, color = class)
qplot(displ,hwy,data = mpg, color = class) + facet_grid(. ~ cyl)
qplot(displ,hwy,data = mpg, color = class) + facet_grid(drv ~ .)
qplot(displ,hwy,data = mpg, color = class) + facet_grid(drv ~ cyl)
qplot(displ,hwy,data = mpg, color = class) + facet_wrap(~ class)
qplot(displ,hwy,data = mpg, geom= c("smooth","point"))
qplot(reorder(class,hwy,FUN = median),hwy,data = mpg, geom= "boxplot")
?reorder
qplot(class,hwy,data = mpg, geom="bar")
head(diamonds)
qplot(x,z,data=diamonds)
d_zeros <- diamonds$x[diamonds$x == 0]
d_zeros
max(diamonds$x,na.rm =T)
qplot(x,data=diamonds)
qplot(cut,data=diamonds)
qplot(color,data=diamonds,geom = "bar") + geom_bar(aes(fill=cut)
                                                   ,position = position_dodge())


g <- ggplot(mpg, aes(class,fill=factor(cyl)))+ geom_bar(position = position_dodge())
g
g + geom_bar(aes(weight = displ))
j <- ggplot(diamonds, aes(color,fill=cut))+ geom_bar(position = position_fill())
j
qplot(cty,hwy,data=mpg,geom = "jitter") # youcan use the position jitter or using geom to attach to it
p <- ggplot(mpg, aes(cty,hwy)) 
p + geom_point(position = position_jitter())

#HISTOGRAM 
qplot(carat,data = diamonds, binwidth=0.1)

#bin2d
qplot(carat,price,data = diamonds, geom = "bin2d")
qplot(carat,price,data = diamonds, geom = "hex")
qplot(carat,price,data = diamonds, geom = c("point","density2d"))
qplot(carat,price,data = diamonds, geom = "smooth",color=cut, se=F)
qplot(carat,price,data = diamonds, color = I("Green"))
getwd()
ggsave("big_data_visual.pdf")
ggsave("big_data_visual.png")
texas <- read.csv("data/texas.csv")
head(texas)
qplot(long,lat,data=texas)
#makng it like a map we are use to, we use polygon 
qplot(long,lat,data=texas,geom="polygon",group=group)
qplot(long,lat,data=texas,geom="polygon",group=group,fill=bin)

?qplot
library(maps)
counties <- map_data("county")
head(counties)
qplot(long,lat,data=counties,geom="polygon",group=group,fill=group)
help(package = "maps")
map('world2', xlim = c(100, 300))
# recreating the texas map with bin filling 
tx <- qplot(long,lat,data=texas,geom="polygon",group=group,fill=pop)
tx
ggsave("texas_map.pdf")










