# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(UsingR)
data(father.son)

shinyServer(function(input,output){
  
  modfit1 <- lm(formula = fheight ~ sheight, data = father.son)
  modfit2 <- lm(formula = sheight ~ fheight, data = father.son)
  
  
  output$o1 <- renderPrint({
    if(input$r1 == "son")
      paste(round(as.numeric(predict(modfit1, data.frame("sheight" = input$n1))),2), " inches")
    else
      paste(round(as.numeric(predict(modfit2, data.frame("fheight" = input$n1))),2), "inches")
  })
  
  output$graph <- renderPlot({
    if(input$r1 == "son"){
      plot(father.son$sheight, father.son$fheight, main = "Father Vs Son Height",
           xlab = "Son's Height", ylab = "Father's Height", type = "n")
      points(father.son$sheight, father.son$fheight, col = "lightblue")
      abline(modfit1, col = "black")
      
      points(input$n1,as.numeric(predict(modfit1, data.frame("sheight" = input$n1))),
             col = "red", cex = 2, pch = 3)
      
    }
    else{
      plot(father.son$fheight, father.son$sheight, main = "Son Vs Father Height",
           ylab = "Son's Height", xlab = "Father's Height", type = "n" )
      points(father.son$fheight, father.son$sheight, col = "lightgreen")
      abline(modfit2, col = "black")
      
      points(input$n1, as.numeric(predict(modfit2, data.frame("fheight" = input$n1))),
             col = "red", cex = 2, pch =3)
    } 
  })
  
})