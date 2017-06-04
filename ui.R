# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(
  navbarPage("Height Prediction",
             tabPanel("App",
                      sidebarPanel(
                        radioButtons("r1", "Enter the height for : ",
                                     c("Father" = "father",
                                       "Son" = "son")),
                        numericInput("n1", "Height in inches:  min = 60, max = 75 ", value = 60, min = 60, max = 80)
                      ),
                      
                      mainPanel(
                        h3("Predicted Height is: "),
                        textOutput("o1"),
                        h3("Plot of father Vs son's height"),
                        plotOutput("graph")
                      )
             ),
             
             
             tabPanel("About",
                      mainPanel(
                        
                        h3("Guidelines for this Shiny App:"),
                        h3("Enter height ranging from 60 inches to 75 inches in the text box present in the left sidebar panel.
                           In the mainPanel you will get the predicted height of father or son."),
                        h3(""),
                        h3("For the prediction of height of father/son, 'father.son' dataset from the UsingR package is used."),
                        h3("This prediction is based on the linear model applied on the father.son dataset.")
                        
                        )
             )
             
  ))