
# NOTE you can install wicher from github if you want to run these tests: install_github('mattjcamp/wicher','mattjcamp')

library(wicher)
library(sqldf)
library(dplyr)

context("SQL JOIN")

test_that("SQL JOIN WORKS", {

  d <-
    code_sql_sample("wiche_2013",
                    filter = "location <> 'us' and race = 'all' and gender = 'all' and grade = 'graduates' and year = 2016 and sector = 'public'") %>%
    code_sql_join(table_to_join = "states", by = "X.location = Y.state_id") %>%
    sqldf()

  expect_equal(filter(d, location == "az")$long, "Arizona")

})
