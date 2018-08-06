library(ggplot2)
summary(diamonds)
?diamonds

ggplot(data = diamonds, aes(x = carat, y = price , color = color))+geom_point()+geom_smooth(method = loess)

#integrate all smoothing lines into 1
# meaning color aes should not inherit to geom_smooth() geom => specify color in required layer and not in parent ggplot()
ggplot(data = diamonds, aes(x= carat, y = price))+geom_point(aes(color = color))+geom_smooth()

#Manipulating shape of the points
ggplot(data = diamonds, aes(x= carat, y = price))+geom_point(aes(color = cut, shape = cut))+geom_smooth()


#Adding labels 
gg<-ggplot(data=diamonds, aes(x= carat, y = price))+geom_point(aes(color = cut))+labs(title = "Scatter Plot Price ~ Carat by Cut", x = "Carat", y="Price")
print(gg)

#Changing the theme, size of text labels etc
gg1 <-gg + theme(
          plot.title = element_text(size=25, face="bold"), 
          axis.text.x=element_text(size=15), 
          axis.text.y=element_text(size=15),
          axis.title.x=element_text(size=25),
          axis.title.y=element_text(size=25)
          ) + 
    scale_color_discrete(name="Cut of diamonds") # changes the legend title if the legend is based on color attribute
print(gg1)

#Facets

gg1+facet_grid(color~cut)
gg1+facet_wrap(color~cut)


#Time series Plot using ggplot
install.packages("ggfortify")
library(ggfortify)

#Convert Airpassengers to a matrix for manipulation if rquired

ap.df <-matrix(data = c(AirPassengers), nrow = 12, ncol = 12)
row.names(ap.df)<-seq(from = 1949, to= 1960, by=1 )
colnames(ap.df)<-seq(from = 1 , to = 12, by =1)

ggplot2::autoplot(AirPassengers , ts.colour = "red")+labs(title="AirPassengers")

#Plot multiple timeseries on same ggplot

data(economics, package="ggplot2")

eco<-data.frame(economics)
summary(eco)
?economics

ggplot(eco )+geom_line(aes(x= date, y = pce ,color = "pce")) + geom_line(aes(x = date, y =unemploy, color = "umemploy" ))+scale_color_discrete(name = "Legend" )+ labs(title="Economics") 
