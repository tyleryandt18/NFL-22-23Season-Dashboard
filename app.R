# Load Library Packages -------------------------------------------------------
library(shiny)
library(shinythemes)
library(tidyverse)
library(dplyr)

# Source Files ----------------------------------------------------------------
source("Library/DataManip.R")
source("ui.R")

# Working Directory
# setwd("/Users/tyleryandt/Desktop/NFL-22Season-Dashboard")

# App Server ------------------------------------------------------------------
server <- function(input, output, session) {
  # app_df <- reactiveVal(nfl_22)
  # observeEvent(list(input$view.allpro, input$view.pos), {
  #   app_df(viewAllPro(input))
  #   app_df(viewPos(input))
  #   output$table.main <- renderTable(app_df())
  # })
  output$table.main <- renderTable(viewPos(input))
}

shinyApp(ui, server)