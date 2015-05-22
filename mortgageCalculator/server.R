library(shiny)
library(googleVis)

source("mortgage.R")
# From http://faculty.ucr.edu/~tgirke/Documents/R_BioCond/My_R_Scripts/mortgage.R

# Define server logic
shinyServer(function(input, output) {
    
    # Expression that generates plot
    output$mortgagePlot <- renderGvis({
        
        # Evaluate the mortgage values reactively
        mortgage(P = input$currentAmount,
                 I = input$currentPercent,
                 L = input$currentYears,
                 plotData = F)
        
        month <- as.numeric(1:nrow(aDFmonth))
        amortization <- aDFmonth$Amortization
        dfAmortization <- data.frame(cbind(month, amortization))
        
        # Draw the plot
        gvisLineChart(dfAmortization,
                      options = list(
                          height = 800,
                          title = "Prinicpal Remaining on the Loan Each Month",
                          hAxis = "{title: 'Month'}",
                          vAxis = "{title: 'Principal (in USD)'}",
                          legend = "{position: 'none'}"
                          )
                      )
    })
})