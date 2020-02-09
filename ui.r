library(shiny)
library(shinythemes)
library(shinydashboard)

header = dashboardHeader(title = "Rat Outbreaks")

body = dashboardBody(
  tabItems(
    tabItem(
      # Tab 1#####################
      tabName = "Map",
      h2("Map"),
      fluidRow(
        ### map ###################################
               column(
                 width = 9,
                 box(
                   width = NULL,
                   solidHeader = TRUE,
                   leafletOutput(outputId = "map", height = 675)
                 )
               ),
               ### Date Range #######################
               column(
                 width = 3,
                 box(
                   width = NULL,
                   status = "primary",
                   uiOutput("Rat Map"),
                   dateRangeInput(
                     'dateRange',
                     label = 'Date range input: yyyy-mm-dd',
                     format = "yyyy-mm-dd",
                     start = '2010-01-01',
                     end = '2019-12-31',
                     min = '2010-01-01',
                     max = '2019-12-31'
                   )
                 )
               )
      )
    ),
    
    # Tab 2############
    tabItem(tabName = "Graphs",
            h2("Graphs"),
            fluidRow(column(
              width = 9,
              ### Histogram ################################
              box(
                width = NULL,
                solidHeader = TRUE,
                plotOutput("hist2")
              )
            ),
            ### Control Widgets #######################
            column(
              width = 3,
              box(
                width = NULL,
                status = "primary",
                uiOutput("Date Range"),
                dateRangeInput(
                  'dateRange2',
                  label = 'Date range input: yyyy-mm-dd',
                  format = "yyyy-mm-dd",
                  start = '2010-01-01',
                  end = '2019-12-31',
                  min = '2010-01-01',
                  max = '2019-12-31'
                )
              )
            ))),
    
    # Tab 3#################
    tabItem(tabName = "Overall",
            h2("Overall"),
            fluidRow(column(
              width = 9,
              ### Histogram ################################
              box(
                width = NULL,
                solidHeader = TRUE,
                plotOutput("hist3")
              )
            )
  ))
  ))


dashboardPage(
  header,
  dashboardSidebar(
    sidebarMenu(
    menuItem('Map', tabName = "Map", icon = icon("dashboard")),
    menuItem('Graphs', tabName = "Graphs",icon = icon("table")),
    menuItem('Overall', tabName = "Overall",icon = icon("table"))
  )),
  body
)














