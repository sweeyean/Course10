# server.R

#clear the environments before starting
rm(list=ls())

load("data/capstone_word_prediction.RData", envir=.GlobalEnv)

source("nextword.R")

nextw <- function(phrase ) {

    return(Backward_offset(phrase, removeProfanity==TRUE))
}

shinyServer(function(input, output) {

    phraseGo <- eventReactive(input$goButton, {
      input$phrase
    })
    output$stats <- renderText({
      numword <- length(strsplit(input$phrase," ")[[1]])
      numchar <- nchar(input$phrase)
      paste("You've written [", input$phrase, "]. It has ", numword, " words and ", numchar, "characters")
    })
    output$nextword <- renderText({
      result <- nextw(phraseGo())
      paste0(result)
    })

})
