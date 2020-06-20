# --------------------------------------
# Author : Mustapha Larbaoui
# Email : mustapha.larbaoui@novartis.com
# Company : Novartis
# --------------------------------------


# Chapter 1 : OOP & R6

library(shiny)

# Shiny module definition

counterButton <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    actionButton(ns("button"), label = label),
    verbatimTextOutput(ns("out"))
  )
}

counter <- function(input, output, session, reset) {
  count <- reactiveVal(0)
  
  observeEvent(reset(),{
    count(0)
  })
  
  observeEvent(input$button, {
    count(count() + 1)
  })
  output$out <- renderText({
    count()
  })
  count
}

# The app

ui <- fluidPage(
  actionButton("reset", label = "Reset counter"),
  br(),
  counterButton("counter1", "Counter #1"),
  verbatimTextOutput("addition")
)

server <- function(input, output, session) {
  
  reset <- reactive(input$reset)
  cnt <- callModule(counter, "counter1",reset)
  output$addition <- renderText({
    paste0("counter + 2 = ",cnt()+2)
  })
  
}

shinyApp(ui, server)

# {tm} starts here ....
# tidymodules::add_module("counter",path = "./3_tidymodules/")

source("./3_tidymodules/tm_Counter.R")

# The app with {tm}

my_counter <- Counter$new()

ui <- fluidPage(
  actionButton("reset", label = "Reset counter"),
  br(),
  my_counter$ui("Counter #1"),
  verbatimTextOutput("addition")
)

server <- function(input, output, session) {
  
  callModules()
  
  reset <- reactive(input$reset)

  defineEdges({
    
    reset %>1% my_counter
    
  })
  
  output$addition <- renderText({
    paste0("counter + 2 = ",my_counter$execOutput("counter")+2)
  })
  
}




## A. Do the short swirl lesson first
## B. Copy the counter module example, adjust and convert it to {tm}

# Chapter 2 : Namespace management


# Chapter 3 : Module communication


# Chapter 4 & 5 : Inheritance & Session

