library(shiny)

shinyUI(fluidPage(
    
    # Application Title
    titlePanel("Mortgage Refinance Calculator"),
    
    # Sidebar
    sidebarLayout(
        sidebarPanel(
            numericInput("currentAmount",
                         "Current loan amount",
                         value = 100000, min = 0),
            sliderInput("currentYears",
                        "Length of current loan in years",
                        min = 5, max = 30,
                        value = 30, step = 5),
            numericInput("currentPercent",
                         "Interest rate of current loan",
                         value = 3.5, min = 0, step = 0.125),
            sliderInput("yearsLeft",
                        "Years left on current loan",
                        min = 0, max = 30,
                        value = 30, step = 1),
            numericInput("newAmount",
                         "New loan amount",
                         value = 100000, min = 0),
            sliderInput("newLength",
                        "Length of new loan in years",
                        min = 5, max = 30,
                        value = 30, step = 5),
            numericInput("newPercent",
                         "Interest rate of new loan",
                         value = 3.5, min = 0, step = 0.125)
                        
        ),
        
        # Show plot
        mainPanel(
            plotOutput("distPlot")
        )
    )
))