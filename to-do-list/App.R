library(shiny)
library(plotly)
library(vistime)
library(googlesheets4)
gs4_deauth()
library(tidyr)
library(dplyr)

# load google sheet
sheet_id <- "https://docs.google.com/spreadsheets/d/1HxKdDuA7pt1r-LGCbkwBYxr4jZ2Tvwq2GBRBf3skKho/"
data <- read_sheet(sheet_id, sheet = 1)

data.present <- data %>% 
  drop_na(group, start, end) %>% 
  mutate(color = case_when(priority == 1 ~ "red",
                           priority == 2 ~ "yellow",
                           priority == 3 ~ "green")) %>% 
  group_by(end) %>% 
  arrange(end)
# data.present

p <- vistime(data.present,
             optimize_y = FALSE)

pb <- plotly_build(p)

to_do_list_plot <- add_segments(p, 
                     x = Sys.Date(), 
                     xend = Sys.Date(), 
                     y = pb$x$layout$yaxis$range[1], 
                     yend = pb$x$layout$yaxis$range[2], 
                     color = I("light green"))

ui <- fluidPage(

    # Application title
    titlePanel("Topics page"),

    # Sidebar with a slider input for number of bins 
    navbarPage("Topics page",
               
        tabPanel("timeline",
          # timeline plot
          plotlyOutput("to_do_list_plot"),
          
          # print table
          div(dataTableOutput("table_print"), style = "font-size:80%")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$to_do_list_plot <- renderPlotly({
      to_do_list_plot
    })
    
    output$table_print <- renderDataTable({df <- reactiveVal(data.present)
    data.present %>% 
      select(-c(color))},
    options = list(pageLength = 1000,
                   searching = FALSE,
                   lengthChange = FALSE))
}

# Run the application 
shinyApp(ui = ui, server = server)
