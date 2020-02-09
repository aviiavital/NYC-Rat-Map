library(shiny)
library(shinydashboard)

function(input,output,session) {
  # TAB 1 ###############
  
  # NYC Rat Map Date Range #########################
  maptab = reactive({
    rats %>%
      filter(INSPECTION_DATE >= input$dateRange[1] &
               INSPECTION_DATE <= input$dateRange[2])
  })
  
  ## Creating the map ############
  output$map = renderLeaflet({
    leaflet() %>% 
      addTiles() %>%
      setView(lng =-73.92838 ,lat =40.73009, zoom = 10 )
  })

  ### Creating the Markers ON THE MAP ########
  observe({
    proxy = leafletProxy("map", data = maptab()) %>%
      clearMarkerClusters() %>%
      clearMarkers() %>%
      addMarkers(~LONGITUDE, ~LATITUDE,
                 clusterOptions = markerClusterOptions(),
                 group ="AREA",
                 popup = ~paste('<b>', 'Inspection Date:', INSPECTION_DATE,'</b>',
                                '<br/>', HOUSE_NUMBER, STREET_NAME,
                                '<br/>', BOROUGH,
                                ZIP_CODE,
                                '<br/>', 'Status: Active Rat Signs')) %>%
      addCircleMarkers(~LONGITUDE, ~LATITUDE, radius = 1, color = 'black',
                       stroke = FALSE,
                       fillOpacity = .4,
                       group = "CLOUD") %>%
      addLayersControl(
        baseGroups = c("AREA", "CLOUD"),
        options = layersControlOptions(collapsed = FALSE)
      )
  })
  
  # TAB 2 ###############
  
  # NYC histogram Date Range #########################
  maptab2 = reactive({
    rats_sep %>%
      filter(INSPECTION_DATE >= input$dateRange2[1] &
               INSPECTION_DATE <= input$dateRange2[2])
  })
  ### Creating the Histogram ########

  output$hist2 = renderPlot({
    ggplot(maptab2(), aes(x = Month)) + geom_bar(bins = 30) + facet_wrap(~Year)
  })
  
  # TAB 3################
  maptab3 = reactive({
    All_rats %>%
      filter(INSPECTION_DATE >= input$dateRange2[1] &
               INSPECTION_DATE <= input$dateRange2[2])
  })
  # ### Creating the Histogram ########
  
  output$hist3 = renderPlot({
    ggplot(maptab3(), aes(x = Month)) + geom_bar(bins = 30) + facet_wrap(~Year)
  })
  
  
  }