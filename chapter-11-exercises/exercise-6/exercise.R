# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")
View(flights)

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
dest_avg_arr_del <- flights %>% 
  group_by(dest) %>% 
  summarize(avg_arr_del = mean(arr_delay, na.rm = TRUE)) %>% 
  rename(faa = dest) %>% 
  left_join(airports, by = "faa") %>%
  filter(avg_arr_del == max(avg_arr_del, na.rm = TRUE))

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
air_avg_arr_del <- flights %>% 
  group_by(carrier) %>% 
  summarize(avg_arr_del = mean(arr_delay, na.rm = TRUE)) %>% 
  left_join(airlines, by = "carrier") %>% 
  filter(avg_arr_del == min(avg_arr_del, na.rm = TRUE))
