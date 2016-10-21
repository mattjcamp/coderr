library(sqldf)

context("SQL COUNT")

test_that("SQL Count behaves as expected", {

  sample <- code_sql_sample("quakes")

  d <-
    sample %>%
    code_sql_count() %>%
    sqldf()

  expect_equal(d[1, 1], 1000)

  d <-
    sample %>%
    code_sql_count(by = "stations") %>%
    sqldf()

  expect_equal(d[1, 2], 20)

})
