library(shiny)


shinyUI(pageWithSidebar(
    headerPanel("Analysis of gas mileage."),
    sidebarPanel(
        h3("Motor Trend data from 1974"),
        selectInput('xcol', 'X Variable', names(mtcars)),
        radioButtons("colorVar", "color",
                   c("Cylinders" = "cyl",
                     "Transmission" = "am")),
        helpText("this is help",
                 "help me, help me.")
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("Plot", plotOutput('thePlot')),
            tabPanel("Documentation", HTML("<h3>Using this Application</h3>",
                                           "This is a simple application that provides analysis ",
                                           "on the Motor Trend car data from 1974. You can use ",
                                           "this application to show how various attributes of ",
                                           "cars may affect gas mileage. <b>Note:</b> These are",
                                           "simple scatter plots of car properties against miles ",
                                           "per gallon, no confounding variable are taken into ",
                                           "consideration<br><br>",
                                           "<b>Step 1.</b> Choose the X Variable from the drop ",
                                           "down list by clicking the down arrow then clicking ",
                                           "the variable to plot on the x axis.<br><br>",
                                           "<b>Step 2.</b> Select a variable to use to color the ",
                                           "points.<br><br>",
                                           "<b>Output.</b> The resulting output is a x-y plot ",
                                           "where the x-axis is the variable you have selected ",
                                           "and the y-axis is Miles per Gallon. The points are ",
                                           "colored to represent with the transmission or the ",
                                           "number of cylinders. <b>Note:</b> the legend for ",
                                           "transmission will show zero or one; zero is manual ",
                                           "and one is automatic. ",
                                           "The plot redraws dynamically with each selection."))
        )
    )
    
))
