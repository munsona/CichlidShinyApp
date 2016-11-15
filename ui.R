fluidPage( 
  titlePanel("TITLE"), 
  sidebarLayout( sidebarPanel(
  textInput("myText1", "HOLDER"), 
  actionButton("createNewData", "HOLDER") ), 
  mainPanel( 
   tabsetPanel(
     tabPanel("Individual Fish Tank Use", plotOutput ("plot")),
     tabPanel("Average Time Spent on Each Side", plotOutput ("plot2"))
   ) 
    ) 
  )
)
