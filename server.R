function(input, output) { 
  output$myTextOutput1 <- renderText({ 
    return(input$myText1) })
output$mymap <- renderLeaflet({
  leaflet() %>% 
    addTiles() %>% 
    setView(-121.7547, 38.54, zoom = 10) %>% 
    addMarkers(data = points)
  })
output$myBarPlot <- renderPlot({ 
  p <- ggplot(dat1, aes(x=animal_id, y=measurement))
  +geom_violin() 
  +geom_jitter(shape=16, position=position_jitter(0.2)) 
  print(p) })

simulatedData <- eventReactive(input$createNewData, { 
  return(newdat()) 
  })

output$myRandomBarPlot <- renderPlot({ 
  p <- ggplot(simulatedData(), aes(x=animal_id, y=measurement))
  +geom_violin() 
  +geom_jitter(shape=16, position=position_jitter(0.2)) 
  print(p) 
}) 
}