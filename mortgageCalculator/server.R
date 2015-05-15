library(shiny)

source("mortgage.R")
# From http://faculty.ucr.edu/~tgirke/Documents/R_BioCond/My_R_Scripts/mortgage.R


# Define server logic
shinyServer(function(input, output) {
    
    # Expression that generates plot
    output$distPlot <- renderPlot({
        
        mortgage(P=input$currentAmount, I=input$currentPercent, L=input$currentYears)
        month <- row.names(aDFmonth)
        principal <- aDFmonth$Amortization
        
        # Draw the plot
        plot(month, principal)
    })
})