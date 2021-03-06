library(httr)
library(jsonlite)

fake_people <- function(num_results = 20, 
                        gender_wanted = 'female',
                        nat = 'US' {
  # Function will still need some error checking
  # e.g. a country that's not valid should be removed
  url <- "http://api.randomuser.me/"
  args <- list(gender = gender_wanted,
               results = num_results,
               nat = nat)
  
  query <- GET(url, query = args)
  data <- content(query, "text")
  results <- fromJSON(data, flatten = TRUE)
  results
}

fake_people(1)
fake_people()

fake_people(gender = "mal e")

fake_people(gender = "male", nat = "GB")