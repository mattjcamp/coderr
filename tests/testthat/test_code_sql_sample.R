library(sqldf)

context("SQL SAMPLE")

test_that("SQL Sample behaves as expected", {

  sample <- code_sql_sample("quakes")

  expect_equal(sample[1], "SELECT * FROM (quakes) RECORDS")

  d <-
    sample %>%
    sqldf()

  expect_equal(nrow(d), 1000)


})
