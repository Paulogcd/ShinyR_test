library(shiny)
library(bslib)

# Define UI ----
ui <- page_sidebar(
  title = "censusVis", 
  sidebar = sidebar(
    helpText('Create demographic maps with information from the 2010 US Census.'),
    selectInput("var",
      label = "Choose a variable to display",
      choices = list("Percent White","Percent Black","Percent Hispanic", "Percent Asian")),
    sliderInput("range", 
      label = "Range of interest",
      min = 0, max = 100, 
      value = c(25,75))
  ),
  # This allows to display the variable of the server function "output$selected_var"
  textOutput("selected_var"),

  # This allows to display the output$selected_range variable
  textOutput("selected_range"), 

  # In this card, I want to display some plot : 
  # card(card_header("Plot something : "),
  #   card_body(
  #     numericInput("alpha",
  #       label = "Values of your functions : ", 
  #       value = 0) 
  #   ), 
  #   plotOutput(plot_1))
)

# ui <- page_fluid(
#   layout_sidebar(
#     sidebar = sidebar("Sidebar"),
#     "Main contents"
#   )   
# )

# Define server logic ----
server <- function(input, output) {
  output$selected_var = renderText(paste("You have selected ",input$var))
  output$selected_range = renderText(paste("You have selected the following range : ", input$range[1], " - ", input$range[2]))
  # output$plot_1 = renderPlot({plot(x = (1:10), y = x*input$alpha)})
}

# Run the app ----
shinyApp(ui = ui, server = server)
