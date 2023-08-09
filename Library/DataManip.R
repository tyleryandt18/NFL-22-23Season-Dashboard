# Read in Data Sets ------------------------------------------------------------
# Source: https://www.pro-football-reference.com/years/2022/fantasy.htm
nfl_22 <- read.csv("Data/NFLData2022.csv") %>%
  rename("Passing Yds" = Yds,
         "Passing TDs" = TD,
         "Rushing Att" = Att.1,
         "Rushing Yds" = Yds.1,
         "Yds per Att" = Y.A,
         "Rushing TDs" = TD.1,
         "Receiving Yds" = Yds.2,
         "Yds per Rec" = Y.R,
         "Receiving TDs" = TD.2,
         "Total Non-Passing TDs" = TD.3,
         "2PM" = X2PM,
         "2PP" = X2PP) %>%
  select(-c(X.9999))

# Data Manipulation Functions -------------------------------------------------

# A function that filters the data set to see Pro Bowl and or All-Pro Selected
# players.
viewAllPro <- function(input, df){
  selected <- input$view.allpro
  if("Pro Bowl Selections" %in% selected){
    if("All-Pro Selections" %in% selected){
      myData <- df %>%
        filter(grepl('\\*\\+', Player))
    } else {
      myData <- df %>%
        filter(grepl('\\*', Player))
    }
  } else {
    if("All-Pro Selections" %in% selected){
      myData <- df %>%
        filter(grepl('\\+', Player))
    } else {
      myData <- df
    }
  }
  return(myData)
}

# A function that filters the positions of the players.
viewPos <- function(input, df){
  selected <- input$view.pos
  if(is.null(selected)){
    myData <- df
  } else {
    myData <- df %>%
      filter(FantPos %in% selected)   
  }
  return(myData)
}

# A function that filters the team of the players.
viewTeam <- function(input, df){
  selected <- input$view.team
  if(is.null(selected)){
    myData <- df
  } else {
    myData <- df %>%
      filter(Tm %in% selected)
  }
  return(myData)
}