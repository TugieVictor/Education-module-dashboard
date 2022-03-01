# load libraries
pacman::p_load(shiny, tidyverse, ggplot2, plotly, rio, data.table)

# Load data
priData <- import("C:/Users/vmwangi/OneDrive - CGIAR/Documents/R/Education_module_dashboard/data/Primary_school_enrolments.csv")


# Define app ui
ui <- fluidPage(
  # Application Title
  titlePanel("School Enrollment Model"),
  
  # Define the layout of the app
  sidebarLayout(
    
    # Sibebar section
    sidebarPanel(
      p("From the makueni training workshop by Clinton David - CIFOR-ICRAF"), # this is a paragraph
      
      strong(em("Data used in this is obtained from an SQLite database")), # this is a bold line
    ),
    mainPanel(
      plotOutput("LineGraph")
      )
    
  )
  
)

# Define server logic
server <- function(input, output) {
  
  # Generate code
  output$LineGraph <- renderPlot({
    ThePlot <- ggplot(priData, mapping = aes(x = Year, y = Sum_of_total, color = Sex))+
       geom_line(size = 3)+
          labs (x = "Years", y = "Sum of Total Enrollments", title = "School Enrolment in Ukambani")
    ThePlot +
      theme(plot.title = element_text(hjust = 0.5))
  })
  
}


# Run the app
shinyApp(ui = ui, server = server)
