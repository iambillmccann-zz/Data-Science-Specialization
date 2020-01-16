library(shiny)
library(ggplot2)

shinyServer(
    function(input, output) {
        
       output$thePlot <- renderPlot({
           
           selectedData = data.frame(mpg = mtcars$mpg, 
                                     var = factor(mtcars[[input$xcol]]),
                                     cyl = mtcars$cyl,
                                     am  = mtcars$am)
           
           # set the variable that will change color (from the radio button)
           if (input$colorVar == "cyl")
               p = ggplot(selectedData, aes(y = mpg, x = var, colour = cyl))
           else
               p = ggplot(selectedData, aes(y = mpg, x = var, colour = factor(am)))

           p = p + xlab(input$xcol)
           p = p + ylab("Miles per Gallon")
           p = p + geom_point(colour="grey50", size = 5) 
           p = p + geom_point(size = 4)
           p = p + geom_smooth(method=lm, aes(group = 1))
           print(p)
        })
    }
)
