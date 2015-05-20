library(shiny)
library(googleVis)

source("mortgage.R")
# From http://faculty.ucr.edu/~tgirke/Documents/R_BioCond/My_R_Scripts/mortgage.R


# Define server logic
shinyServer(function(input, output) {
    
    # Expression that generates plot
    output$distPlot <- renderGvis({
        
        # Evaluate the mortgage values reactively
        mortgage(P = input$currentAmount,
                 I = input$currentPercent,
                 L = input$currentYears,
                 plotData = F)
        month <- row.names(aDFmonth)
        principal <- aDFmonth$Amortization
        
        # Draw the plot
        gvisLineChart(aDFmonth, options = list(height = 600, width = 600))
        
        # TODO:
        # Add a first column containing months
        # Get rid of "new mortgage" section and just print output
    })
})