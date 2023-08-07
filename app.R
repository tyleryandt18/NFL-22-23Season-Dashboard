# Load Library Packages -------------------------------------------------------
library(shiny)
library(shinythemes)
library(tidyverse)
library(dplyr)

# Source Files ----------------------------------------------------------------
source("Library/DataManip.R")
source("ui.R")

# Working Directory
# setwd("/Users/tyleryandt/Desktop/Fantasy 2022 Dashboard")

# App Server ------------------------------------------------------------------
server <- function(input, output, session) {
  output$table.basic <- renderTable(viewAllPro(input))
}

shinyApp(ui, server)