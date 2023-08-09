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
  output$table.main <- renderTable({
    app_df <- nfl_22 %>%
      viewAllPro(input, .) %>%
      viewPos(input, .) %>%
      viewTeam(input, .)
  })
}

shinyApp(ui, server)