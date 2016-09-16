library(sqldf)

context("SQL DISTINCT")

test_that("SQL Distinct behaves as expected", {

  sample <- code_sql_sample("quakes")

  d <-
    sample %>%
    code_sql_distinct(col = "stations") %>%
    sqldf()

  expect_equal(d[1, 1], 41)


})
