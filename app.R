library(shiny)

ui <- fluidPage(
  titlePanel("CREATE Cloud Shiny Test"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", "Number of observations:", min = 1, max = 1000, value = 500)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs), col = "skyblue", border = "white",
         main = "Histogram of Random Normal Values")
  })
}

shinyApp(ui = ui, server = server)