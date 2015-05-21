source("mortgageCalculator/mortgage.R")

mortgage(P = 100000, I = 3.5, L = 30, plotData = F)

month <- as.numeric(1:nrow(aDFmonth))
amortization <- aDFmonth$Amortization
dfAmortization <- data.frame(cbind(month, amortization))
