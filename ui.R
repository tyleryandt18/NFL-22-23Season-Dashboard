# Global Variables ------------------------------------------------------------
APP_THEME <- shinytheme("superhero")

# App UI ----------------------------------------------------------------------
ui <- fluidPage(
  theme = APP_THEME,
  sidebarLayout(
    sidebarPanel(
      h2("View Options"),
      hr(),
      checkboxGroupInput("view.allpro",
                         "View Pro Bowl / All-Pro Selections",
                         c("Pro Bowl Selections",
                           "All-Pro Selections"))
    ),
    mainPanel(
      tableOutput("table.basic")
    )
  )
)
