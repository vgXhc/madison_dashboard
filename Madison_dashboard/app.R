library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(#disable = T, 
                  title = "Madison Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Transportation", icon = icon("bus"),
        menuSubItem("Transit", tabName = "transit", icon = icon("car")),
        menuSubItem("Biking", tabName = "bike", icon = icon("bicycle"))),
      menuItem("Elections", tabName = "elections", icon = icon("check-square"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "transit",
          h2("stuff about the buses")),
      tabItem(tabName = "bike",
              h2("Bike facts")),
  tabItem(tabName = "elections",
          h2("Elections dashboard"))
    )
  )
)

  server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    
    output$plot1 <- renderPlot({
      data <- histdata[seq_len(input$slider)]
      hist(data)
    })
  }
  

shinyApp(ui, server)