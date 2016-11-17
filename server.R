function(input, output) { 
  #Every that follows is setting up my database connection
  dbconnection <- eventReactive(input$postgresConnect, {
    if ( is.null(input$postgresHost) | is.null(input$postgresDBname) | is.null(input$postgresUser) | is.null(input$postgresPort) | is.null(input$postgresPwd)) return (NULL)
    drv <- dbDriver("PostgreSQL")
    ##disconnect all current connections
    all_cons <- dbListConnections(drv)
    for(con in all_cons) dbDisconnect(con)
    ##create a single new connection
    con <- dbConnect(drv=drv, dbname = input$postgresDBname, host = input$postgresHost, port = input$postgresPort, user = input$postgresUser, password = input$postgresPwd)
    return(con)
  })
  
  output$DoneConnect <- renderText({
    if (is.null(dbconnection())) return(NULL)
    message <- paste0("SUCCESS! Connected to ", input$postgresDBname , " on ", input$postgresUser, "@", input$postgresHost)
    return(message)
  })
  
  output$niceTable  <-  DT::renderDataTable({
    if(is.null(dbconnection())) return(NULL)
    dbGetQuery(dbconnection(), "select *  from pg_tables where schemaname!='pg_catalog' AND schemaname!='information_schema';")
  }
  )
  
  output$basicTable  <-  shiny::renderTable({
    if(is.null(dbconnection())) return(NULL)
    dbGetQuery(dbconnection(), "select *  from pg_tables where schemaname!='pg_catalog' AND schemaname!='information_schema';")
  }
  )
#Hers where I end my database connection part 


} 
