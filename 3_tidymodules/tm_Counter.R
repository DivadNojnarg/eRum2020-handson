#'
#' Counter Module.
#'
#' @description
#' This \href{https://opensource.nibr.com/tidymodules}{`{tm}`} module is a R6 class representing a Counter.
#'
#' @family tm
#'
#' @details
#' More details about your module here.
#'
#'
#' @import tidymodules
#' @noRd 
Counter <- R6::R6Class(
  classname = "Counter",
  inherit = TidyModule,
  public = list(
    #' @description
    #' Module's initialization function.
    #' @param ... options
    #' @return An instance of Counter
    initialize = function(...){
      # Don't remove the line below
      super$initialize(...)
      
      # Ports definition starts here...
      self$definePort({
        self$addInputPort(
          name = "reset",
          description = "Action button output to reset counter",
          sample = 3
        )
        
        self$addOutputPort(
          name = "counter",
          description = "State of the counter",
          sample = 2)
      })
      
    },
    #' @description
    #' Module's ui function.
    #' @return HTML tags list.
    ui = function(label = "Counter"){
      # Module's representation starts here ...
      tagList(
        actionButton(self$ns("button"), label = label),
        verbatimTextOutput(self$ns("out"))
      )
    },
    #' @description
    #' Module's server function.
    #' @param input Shiny input
    #' @param output Shiny output
    #' @param session Shiny session
    server = function(input, output, session){
      # Don't remove the line below
      super$server(input,output,session)
      
      # Module server logic starts here ...
      count <- reactiveVal(0)
      
      observeEvent(self$execInput("reset"),{
        count(0)
      })
      
      observeEvent(input$button, {
        count(count() + 1)
      })
      output$out <- renderText({
        count()
      })
      
      self$assignPort({
        self$updateOutputPort("counter",count)
      })

    }
  )
)
