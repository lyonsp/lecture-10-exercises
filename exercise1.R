### Exercise 1: Get your favorite Band's bio from the Echonest API ###
library(jsonlite)

# Create a variable `api_key` that stores your api key
# Register your own API key here: https://developer.echonest.com/account/register
api_key <- "IHZX7A5ZFJIFM0Q30"

# Create a variable that stores the name of your favorite artist
fav_artist <- "Magic Man"

# Substitute the spaces in your band-name with '+'s using the `gsub` function
band_name <- gsub(" ", "+", fav_artist)

# Construct a seach query to hit the api.
# See documentation/examples: http://developer.echonest.com/docs/v4/artist.html#biographies
base_url <- "http://developer.echonest.com/api/v4/artist/biographies?api_key"
query_url <- paste0(base_url, api_key, "&name=", band_name)

# Use fromJSON to retrieve the results
fav_results <- fromJSON(query_url)

# Get the text of the (first) biography available
first_bio <- fav_results$response$biographies$text[1]
