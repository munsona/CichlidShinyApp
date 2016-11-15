fluidPage( 
  titlePanel("Hi everyone!"), 
  sidebarLayout( sidebarPanel(
  textInput("myText1", "Enter some text here:"), 
  actionButton("createNewData", "Simulate new data for 2nd bar plot") ), 
  mainPanel( 
   tabsetPanel(
     tabPanel("Individual Fish Tank Use", plotOutput ("plot")),
     tabPanel("Average Time Spent on Each Side", plotOutput ("plot2"))
   ) 
    ) 
  )
)