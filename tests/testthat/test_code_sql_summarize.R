library(sqldf)

context("SQL SUMMARIZE")

test_that("SQL summarize behaves as expected", {

  sample <- code_sql_sample("quakes")

  d <-
    sample %>%
    code_sql_summarize(cols = "mag") %>%
    sqldf()

  expect_equal(d[1, 1], 1000)

  d <-
    sample %>%
    code_sql_summarize(cols = "mag", by = "stations") %>%
    sqldf()

  expect_equal(d[1, 2], 20)

})
