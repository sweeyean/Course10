# ui.R
library(shiny)

shinyUI(fluidPage(theme = "bootstrap.css",

  titlePanel(h1("Next Word Prediction", align="center"),
             windowTitle = "Next Word Prediction - coursera capstone Final project"),
  h4("(Happy Trying!!!)", align="center"),

  hr(),

  fluidRow(
          column(12,           
            h2("Please write words/phrases and Press the 'PREDICT' button:"),
            textInput("phrase", label = "", value = "", width = 1000)
            )
    ),

            fluidRow(
                column(6,
                       actionButton("goButton", "PREDICT"),
                           h4(textOutput("stats"))
                           #h2(textOutput("nextword"))
                    ),                    
                column(6,
                     br(),
                     h4("The next word predicted is..."),
                     h2(textOutput("nextword"))
                        )
                  ),
  hr(),

  fluidRow(
    column(5, offset=1,

           wellPanel(
             h4("Instructions"),

             p("To predict the next word, you must fill up the text box. Press the 'PREDICT' button to see the result "),
             
             helpText("Language used is ",em("English (US)"), ".")
           )

    )
  )
)
)
