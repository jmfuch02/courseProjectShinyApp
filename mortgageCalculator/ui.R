library(shiny)

shinyUI(fluidPage(
    
    # Application Title
    titlePanel("Mortgage Calculator"),
    
    # Sidebar
    sidebarLayout(
        sidebarPanel(
            numericInput("currentAmount",
                         "Loan amount",
                         value = 100000, min = 0),
            sliderInput("currentYears",
                        "Length of loan in years",
                        min = 5, max = 30,
                        value = 30, step = 5),
            numericInput("currentPercent",
                         "Interest rate of loan",
                         value = 3.5, min = 0, step = 0.125)
        ),
        
        # Show plot
        mainPanel(
            tabsetPanel(
                tabPanel("Chart", htmlOutput("mortgagePlot")),
                tabPanel("Documentation", includeMarkdown("mortgageAppDoc.md"))
            )
        )
    )
))