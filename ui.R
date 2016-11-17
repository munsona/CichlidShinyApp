fluidPage( 
  titlePanel("TITLE"), 
  sidebarLayout( sidebarPanel(
    #this is the database connection part
    HTML("<h4><b>    Connect to postgreSQL database</b></h4>"),
    br(),
    textInput("postgresHost", label = "Host name or IP address", value = "localhost"),
    textInput("postgresDBname", label = "Database name (if you have not set up an Animal Observer database yet enter the default database name)", value = "test"),
    textInput("postgresUser", label = "User name", value = "postgres"),
    numericInput("postgresPort", label = "Port", value = "5432"),
    passwordInput("postgresPwd", label = "Password (non-encrypted, use a VPN for safer connection!)", value = "postgres"),
    actionButton("postgresConnect", label = "Connect"),
    br(),
    br(),
    textOutput("DoneConnect")), 
  mainPanel( 
   tabsetPanel(
     tabPanel("Individual Fish Tank Use", plotOutput ("plot")),
     tabPanel("Average Time Spent on Each Side", plotOutput ("plot2"))
   ) 
    ) 
  )
)
