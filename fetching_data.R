# Load required libraries 
pacman::p_load(RSQL, RSQLite, DBI, tidyverse)


# Create the connection to the db created in the previous excercise 
connection <- dbConnect(SQLite(),
                        "C:/Users/vmwangi/OneDrive - CGIAR/Documents/R/Primary_School_data/Primary_school_enrolments.sqlite")


# List the tables in the db
dbListTables(connection)


# fetch the table in the db
tbl(connection, "Primary_school_enrolments") %>% 
  collect() -> PrimaryData

# PrimaryData -> tbl(connection, "Primary_school_enrolments") 
# this should also work as above line of code but it doesn't load exactlly collect the data

 
# Save the Primary data into a csv in the data folder
write.csv(PrimaryData, file = "C:/Users/vmwangi/OneDrive - CGIAR/Documents/R/Education_module_dashboard/data/Primary_school_enrolments.csv",
          row.names = F)

